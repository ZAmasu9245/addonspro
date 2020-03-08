--[[-- License Plate Main Code
@copyright 2019 Limelight Gaming
@release 1.5.10
@author Doctor Internet
@module PLATE
--]]--

--- Server Functions
-- @section serverf

--- Table for storing all information about plates and their configuration.
local PLATE = {}

-- Ensure that the shared and clientside files are added to the download list.
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("sh_init.lua")
AddCSLuaFile("sh_autogen.lua")
AddCSLuaFile("sh_debugging.lua")

-- Add Configuration Files.
AddCSLuaFile("conf_vehicles.lua")
AddCSLuaFile("conf_derma.lua")
AddCSLuaFile("conf_misc.lua")

-- And then run the shared init.
PLATE_SHARED = PLATE
include("sh_init.lua")
PLATE:DebugPrint("Back to Server")

-- Precache NWStrings.
util.AddNetworkString("ll_plates::menu")
PLATE:DebugPrint("Precached NWStrings")

-- Localise commonly used functions.
local chr = string.char
local rnd = math.random
local esc = sql.SQLStr
local tblExist = sql.TableExists
local quer = sql.Query
local ceil = math.ceil
local strlen = string.len
local strfind = string.find
local querrow = sql.QueryRow
local rtime = RealTime
local tostr = tostring
local isstr = isstring
local agm = engine.ActiveGamemode
local upper = string.upper
PLATE:DebugPrint("Localise the functions.")

--- Generate a random capital letter.
-- @treturn string Random uppercase letter.
function PLATE:RandomLetter() return chr(65 + rnd(0, 25)) end

--- Generate a random number, in the range 0-9
-- Whilst it's not quicker, it's nicer to have it being a function in the plate table.
-- @treturn int Random number, range 0-9.
function PLATE:RandomNumber() return rnd(0, 9) end

--- Internal function, used for RandomPlate
-- Takes the string or digit string format pattern, returning a random letter or number.
-- @string val  Input value for testing.
-- @treturn str Random letter, number or empty string.
function PLATE.DoReplace(val) return (val == "%s" and PLATE.RandomLetter()) or (val == "%i" and PLATE.RandomNumber()) or "" end

--- Generates a random plate based on PLATE.DefaultFormat.
-- @treturn string Randomly generated plate. 333,135,504 plates using default format.
function PLATE:RandomPlate() return string.gsub(PLATE.Config.DefaultFormat, "%%%a", PLATE.DoReplace) end
PLATE:DebugPrint("Create Plate Functions")

--- Table containing valid vehicle classes.
-- Done as [str | class] = [bool | valid].
-- Reduces O(N) lookup to O(1)
PLATE.VehicleClasses = {
	["prop_vehicle_jeep"] = true,
	["prop_vehicle_jeep_old"] = true,
	["prop_vehicle_prisoner_pod"] = true,
	["prop_vehicle_airboat"] = true,
	["gmod_sent_vehicle_fphysics_base"] = true
}
PLATE:DebugPrint("Vehicle Classes Setup")

--- Get the "name" of the vehicle.
-- @ent ent The entity to get the name for.
-- @treturn ?string Returns nil on failure, vehicle name as string on success.
function PLATE:GetVehicleName(ent)
	if not IsValid(ent) then return end
	if not ent:IsVehicle() then return end

	local class = ent:GetClass()
	return (self.VehicleClasses[class] and (ent.VehicleScriptName or ent.VehicleName or ent:GetVehicleClass())) or class
end

--- Create the SQLite table, if it doesn't exist.
function PLATE:GenerateTable()
	if not tblExist("ll_plates") then
		quer([[CREATE TABLE `ll_plates` (`steamid` TEXT NOT NULL, `vehicle` TEXT NOT NULL, `plate` TEXT, PRIMARY KEY (`steamid`, `vehicle`));]])
	end
end
hook.Add("Initialize", "LL_Plates::CreateTable", function() PLATE:GenerateTable() end)
PLATE:DebugPrint("Table Generation.")

--- Get the player's chosen vehicle.
-- @ply ply Player to get the vehicle from.
-- @tparam boolean|Entity ent If false, get closest owned vehicle. If true, get eye trace vehicle. If ent, use specific ent.
function PLATE:GetChosenVehicle(ply, ent)
	local closest, chosenEnt
	if ent == true then
		chosenEnt = ply:GetEyeTrace().Entity
	elseif ent == false then
		closest = 9999999999
		for _, v in pairs(ents.GetAll()) do
			local dist = v:GetPos():DistToSqr(ply:GetPos())
			if v:IsVehicle() and self:CheckVehicleOwnership(ply, v) and dist < closest then
				closest = dist
				chosenEnt = v
			end
		end
	else
		chosenEnt = ent
	end

	if not IsValid(chosenEnt) then return end
	if not chosenEnt:IsVehicle() then return end
	if not self:CheckVehicleOwnership(ply, chosenEnt) then return ply:ChatPrint("You do not own this vehicle.") end

	return chosenEnt, (IsValid(chosenEnt) and chosenEnt:GetPos():DistToSqr(ply:GetPos())) or 0
end
PLATE:DebugPrint("Chosen Vehicle")

--- Open the plate menu on a client.
-- @ply ply Player to open the menu on.
-- @tparam boolean|Entity ent If false, get closest owned vehicle. If true, get eye trace vehicle. If ent, use specific ent.
-- @treturn ?boolean True if the net message sends, nil otherwise.
function PLATE:OpenMenu(ply, ent)
	if LLServer == "build" then ply:ChatPrint("You cannot change your license plate on the build server!"); return end
	if not self.Config.AllowChanges then return ply:ChatPrint("License plate changes are disabled.") end

	local time = rtime()
	ply.LastPlateChange = ply.LastPlateChange or (time - self.Config.Delay)
	if ply.LastPlateChange + self.Config.Delay > time then
		local timeLeft = ceil((ply.LastPlateChange + self.Config.Delay) - time)
		ply:ChatPrint("You have " ..  timeLeft .. " " .. (timeLeft == 1 and "second" or "seconds") .. " left before you can change your license plate again.")
		return
	end

	local dist
	ent, dist = self:GetChosenVehicle(ply, ent)
	if not ent then return end
	if dist > self.Config.MaxDist then ply:ChatPrint("You are too far away from your vehicle to change the plate."); return end
	if not self.Config.AllowEmergencyChanges and self:IsEmergency(ent) then return ply:ChatPrint("License plate changes are disabled for emergency vehicles.") end

	local allowed = hook.Call("CanOpenLicenseMenu", self, ply, ent)
	if not allowed then return end

	net.Start("ll_plates::menu")
	net.Send(ply)
	return true
end
PLATE:DebugPrint("Menu Opening")

if PLATE.Config.BindF3 then
	--- Open the plate menu on the selected vehicle.
	-- @ply ply The player who called ShowSpare1.
	function PLATE:OnShowSpare1(ply) return self:OpenMenu(ply, true) end
	hook.Add("ShowSpare1", "ll_plates::OpenF3Menu", function(ply) return PLATE:OnShowSpare1(ply) end)
end

--- Check if the player has the amount of cash required to do a transaction.
-- @ply ply The player to check cash on.
-- @int amt The minimum cash the player must have.
-- @treturn bool If the player can afford the transaction.
function PLATE:PlayerHasCash(ply, amt)
	local gm = agm()
	if gm == "cityrp" or gm == "cityrp_2_by_limelight" then
		return ply:CanAfford(amt)
	elseif gm == "darkrp" then
		return ply:canAfford(amt)
	end
	return true
end
PLATE:DebugPrint("Check Cash")

--- Take cash from a player.
-- @ply ply Player to take money from.
-- @int amt The amount of money to take.
function PLATE:PlayerTakeMoney(ply, amt)
	local gm = agm()
	if gm == "cityrp" or gm == "cityrp_2_by_limelight" then
		ply:GiveMoney(-amt)
	elseif gm == "darkrp" then
		ply:addMoney(-amt)
	end
end
PLATE:DebugPrint("Take Money")

--- Update the license plate in the DB and on the vehicle itself.
-- @tparam string|Player ply Player who's requesting the change, or their SteamID.
-- @tparam string|Vehicle veh The vehicle entity the change is being requested for, or the vehicle name if setting without an entity.
-- @string plate The plate that's having the change requested.
-- @treturn boolean Success?
function PLATE:SetLicensePlate(ply, veh, plate)
	if not plate then return false end
	local sid = esc(isstr(ply) and ply or ply:SteamID())
	veh = isstr(veh) and veh or self:GetVehicleName(veh)
	if not veh and not isstr(veh) then return false end

	plate = tostr(plate):gsub("[^%w- ]", ""):gsub("%l", function(val) return upper(val) end):sub(0, self.Config.MaxLength)
	local veh_name_esc = esc(veh)
	local sqlstr = "INSERT INTO ll_plates VALUES (" .. sid .. ", "  .. veh_name_esc .. ", " .. esc(plate) .. ");"
	if querrow("SELECT * FROM ll_plates WHERE steamid=" .. sid .. " AND vehicle=" .. veh_name_esc .. ";") then
		sqlstr = "UPDATE ll_plates SET plate=" .. esc(plate) .. " WHERE steamid=" .. sid .. " AND vehicle=" .. veh_name_esc .. ";"
	end

	quer(sqlstr)
	for _, v in ipairs(ents.GetAll()) do
		if self:GetVehicleName(v) == veh and self:CheckVehicleOwnership(ply, v) then
			v:SetNWString("ll_plate", plate)
		end
	end
	return true
end
PLATE:DebugPrint("Set Plates")

--- Get the steamid of the player with matching plate.
-- @string plate License plate to find.
-- @treturn ?string SteamID if found.
function PLATE:SearchPlate(plate)
	local res = querrow(Format("SELECT steamid FROM ll_plates WHERE plate = %s;", esc(plate)))
	if res then return res.steamid end
end

--- Fetch a table of all license plates, keyed by vehicle ID or
-- license plate for a specific steam ID / vehicle pair.
-- @string sid SteamID to query.
-- @string[opt] veh Vehicle ID
-- @treturn table|string|nil Table of plates if veh isn't specified. Plate or nil if veh is specified.
function PLATE:PlateFromSteamID(sid, veh)
	if veh then
		local res = querrow("SELECT * FROM ll_plates WHERE steamid=" .. esc(sid) .. " AND vehicle=" .. esc(veh) .. ";")
		if not res then return nil end

		return res.plate
	else
		local res = quer("SELECT * FROM ll_plates WHERE steamid=" .. esc(sid) .. ";")
		if not res then return end

		for id, data in ipairs(res) do
			res[data.vehicle] = data.plate
			res[id] = nil
		end
		return res
	end
end

--- Fetch license plate information for a vehicle and generate if none exists.
-- @tparam string|Player ply Player or SteamID to get information for.
-- @tparam string|Vehicle veh Vehicle (name) to get information for.
-- @treturn string License plate.
function PLATE:GetLicensePlate(ply, veh)
	local sid = esc(isstr(ply) and ply or ply:SteamID())
	veh = isstr(veh) and veh or self:GetVehicleName(veh)
	local veh_esc = esc(veh)

	local res = querrow("SELECT * FROM ll_plates WHERE steamid=" .. sid .. " AND vehicle=" .. veh_esc .. ";")
	if res then return res.plate end

	local newPlate = self:RandomPlate()
	while querrow("SELECT * FROM ll_plates WHERE plate=" .. esc(newPlate) .. ";") do
		newPlate = self:RandomPlate()
	end
	self:SetLicensePlate(ply, veh, newPlate)

	return newPlate
end
PLATE:DebugPrint("Get Plates")

--- Hook function, called to determine if a player can open the license plate menu.
-- @ply ply The player updating their plate.
-- @veh veh The vehicle being updated.
-- @treturn boolean If the change is allowed.
function PLATE:CanOpenLicenseMenu(ply, veh) return true end

--- Hook function, called to determine if a player can update their license plate.
-- @ply ply The player updating their plate.
-- @veh veh The vehicle being updated.
-- @string plate The new license plate.
-- @treturn boolean If the change is allowed.
function PLATE:CanUpdateLicensePlate(ply, veh, plate) return true end

--- Internal function, used to process the plate update net message.
-- @int leng Length of incoming net message.
-- @ply ply The player sending the message.
-- @string plate The new plate.
-- @int veh_type The vehicle picker type.
-- @veh veh The vehicle entity.
function PLATE:GetUpdate(leng, ply, plate, veh_type, veh)
	if veh_type == 0 then
		veh = self:GetChosenVehicle(ply, veh)
	elseif veh_type == 1 then
		veh = self:GetChosenVehicle(ply, true)
	elseif veh_type == 2 then
		veh = self:GetChosenVehicle(ply, false)
	end

	if not IsValid(veh) then return end
	local strleng = strlen(plate)

	if not self.Config.AllowChanges then return ply:ChatPrint("License plate changes are disabled.") end
	if not self.Config.AllowEmergencyChanges and self:IsEmergency(veh) then return ply:ChatPrint("License plate changes are disabled for emergency vehicles.") end
	if not self:PlayerHasCash(ply, self.Config.Cost) then return ply:ChatPrint("You don't have the $" .. self.Config.Cost .. " required to purchase a custom plate.") end

	local allowed = hook.Call("CanUpdateLicensePlate", self, ply, veh, plate)
	if not allowed then return end

	if strleng < 1 then return ply:ChatPrint("Invalid License Plate! Minimum Length is 1 character.") end
	if strleng > 8 then return ply:ChatPrint("Invalid License Plate! Maximum Length is 8 characters.") end
	if strfind(plate, "[^%w- ]") then return ply:ChatPrint("Invalid License Plate! Only spaces, dashes, numbers and letters allowed.") end
	if querrow("SELECT * FROM ll_plates WHERE plate=" .. esc(plate) .. ";") then return ply:ChatPrint("License plate already in use!") end

	local success = self:SetLicensePlate(ply, veh, plate)
	if success then
		self:PlayerTakeMoney(ply, self.Config.Cost)
		ply:ChatPrint("Thank you for purchasing your custom plate.")
		ply.LastPlateChange = rtime()
	end
end

--- Check if a given vehicle is an emergency vehicle.
-- @veh veh Vehicle to check.
-- @treturn boolean If the vehicle is an emergency vehicle.
function PLATE:IsEmergency(veh)
	local vname = self:GetVehicleName(veh)
	if self.EmergOverride[vname] then return false end

	if self.Config.ParseVCEmergency and (veh.VC_isELS or self.Emergency[veh.VC_Category]) then return true end
	if self.Emergency[vname] then return true end
	if veh.VehicleTable and self.Emergency[veh.VehicleTable.Category] then return true end

	return false
end

net.Receive("ll_plates::menu", function(leng, ply)
	local plate = net.ReadString()
	local veh_type = net.ReadUInt(2)

	local veh
	if veh_type == 0 then veh = net.ReadEntity() end

	PLATE:GetUpdate(leng, ply, plate, veh_type, veh)
end)

--- Setup a vehicle's license plates, upon spawn.
-- If, for whatever reason, you need to call this on a non-registered-vehicle?
-- Dev or something idk. SCars maybe? Should work.
-- @ply ply The player that spawned the vehicle.
-- @veh veh The vehicle spawned.
function PLATE:PrepareVehicle(ply, veh)
	PLATE:DebugPrint("Attempting to Prepare Vehicle")
	if not IsValid(ply) then return end
	if not IsValid(veh) then return end
	PLATE:DebugPrint("Vehicle and Owner Are Valid")

	veh:SetNWEntity("PlatesOwner", ply)
	PLATE:DebugPrint("Set Owner")

	local vname = self:GetVehicleName(veh)
	if not vname then return end
	veh:SetNWString("ll_v_name", vname)
	PLATE:DebugPrint("Got Name")

	local plate = self:GetLicensePlate(ply, vname) -- Use the vname here to save a few cycles.
	if not plate then return end
	veh:SetNWString("ll_plate", plate)
	PLATE:DebugPrint("Got Plate")

	if self:IsEmergency(veh) then
		veh:SetNWBool("IsExemptVehicle", true)
		PLATE:DebugPrint("Set as Exempt")
	end
end
hook.Add("PlayerSpawnedVehicle", "ll_plates::OnVehicleSpawn", function(p, v) PLATE:PrepareVehicle(p, v) end)
hook.Add("playerBoughtCustomVehicle", "ll_plates::OnVehicleSpawn", function(p, t, v, c) PLATE:PrepareVehicle(p, v) end)
hook.Add("playerBoughtVehicle", "ll_plates::OnVehicleSpawn", function(p, v, c) PLATE:PrepareVehicle(p, v) end)
hook.Add("VC_CD_spawnedVehicle", "ll_plates::OnVehicleSpawn", function(p, e, t)
	if t then return end
	PLATE:PrepareVehicle(p, e)
end)
PLATE:DebugPrint("Prepare Hooks.")

LL_PLATES_SYSTEM = PLATE
--[[-- License Plate XAdmin Integration
@copyright 2019 Limelight Gaming
@release 1.7.2
@author Doctor Internet
@module xAdmin
--]]--

local q = sql.Query
local e = sql.SQLStr
local f = Format

xAdmin.RegisterCategory("plates", "L² Plates")

xAdmin.RegisterCommand("getplate", "Get Plate", function(tgt, ply)
	local vehs = list.Get("Vehicles")

	if not isstring(tgt) then tgt = tgt:SteamID() end
	local plates = q(f("SELECT * FROM ll_plates WHERE steamid=%s", e(tgt)))

	for _, plate in ipairs(plates) do
		local veh = vehs[plate.vehicle]
		plates[_].sort = (veh and "1" or "0") .. "_" .. (veh and veh.Name or plate.vehicle)
		plates[_].value = Format("%s: '%s'", veh and veh.Name or plate.vehicle, plate.plate)
	end

	for _, plate in SortedPairsByMemberValue(plates, "sort") do
		if IsValid(ply) then
			ply:PrintMessage(HUD_PRINTCONSOLE, plate.value)
		else
			print(plate.value)
		end
	end

	if IsValid(ply) then xAdmin.Notify(ply, xAdmin.NotificationSUCCESS, f("Found %s license plates for %s. Printed to Console.", #plates, tgt)) end

	return true
end, "plates", {{"Player", "User"}}, "<User>", "Fetches license plates for a given user.")

xAdmin.RegisterCommand("searchplate", "Search Plate", function(tgt, ply, args)
	local plate = args[1]
	if not plate then
		if IsValid(ply) then
			xAdmin.Notify(ply, xAdmin.NotificationERROR, "Missing argument 'plate'")
		else
			print("Missing argument 'plate'")
		end
		return false
	end

	local vehs = list.Get("Vehicles")
	local plates = q(f("SELECT * FROM ll_plates WHERE plate=%s", e(plate)))

	if plates and #plates == 0 then
		if IsValid(ply) then
			xAdmin.Notify(ply, xAdmin.NotificationSUCCESS, f("No plates match '%s'", plate))
		else
			print(f("No plates match '%s'", plate))
		end
		return true
	end

	plate = plates[1]
	local veh = vehs[plate.vehicle]
	plate = Format("Found '%s', links to steamID %s on '%s'", plate.plate, plate.steamid, veh and veh.Name or plate.vehicle)

	if IsValid(ply) then
		xAdmin.Notify(ply, xAdmin.NotificationSUCCESS, plate)
	else
		print(plate)
	end

	return true
end, "plates", {{"String", "License Plate"}}, "<License Plate>", "Searches for a license plate's owner.", true)
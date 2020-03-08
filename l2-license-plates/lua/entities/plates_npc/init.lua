--[[-- License Seller NPC Server Code
@copyright 2019 Limelight Gaming
@release 1.5.5
@author Doctor Internet
@module PlateNPC
@alias ENT
--]]--

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

util.AddNetworkString("ll_plates::npc_menu")

--- Prepare the entity for use.
function ENT:Initialize()
	self:SetModel("models/Humans/Group01/Male_06.mdl")
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_IDLE)
	self:SetSolid(SOLID_BBOX)
	self:CapabilitiesAdd(CAP_ANIMATEDFACE or CAP_TURN_HEAD)
	self:SetUseType(SIMPLE_USE)
	self:SetMaxYawSpeed(90)
end

--- Hook function called when damage is sent.
function ENT:OnTakeDamage() return false end

--- Called when an input is sent.
-- @string n The name of the sent input.
-- @ent a Direct activator.
-- @ent c Primary caller.
function ENT:AcceptInput(n, a, c)
	if n == "Use" and IsValid(c) and c:IsPlayer() then
		local v = LL_PLATES_SYSTEM:GetChosenVehicle(c, false)
		if IsValid(v) then
			net.Start("ll_plates::npc_menu")
			net.WriteEntity(v)
			net.Send(c)
		else
			c:ChatPrint("You must have a vehicle out to change your license plate.")
		end
	end
end
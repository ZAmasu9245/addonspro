AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function ENT:Initialize()
	self:SetModel( "models/craphead_scripts/adv_keys/props/alarm.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	
	local phys = self:GetPhysicsObject()
	phys:Wake()
end

function ENT:PhysicsCollide( data, physobj )
	if data.DeltaTime > .5 then
		if data.HitEntity:GetClass() == "prop_vehicle_jeep" then			
			local TheVehicle = data.HitEntity

			if not TheVehicle.HasVehicleAlarm then
				TheVehicle.HasVehicleAlarm = true
				
				DarkRP.notify( self:Getowning_ent(), 3, 5, "You have successfully installed a vehicle alarm for your vehicle." )
				self:Getowning_ent():ConCommand("play npc/scanner/scanner_electric1.wav")
				
				timer.Simple( 0.2, function()
					self:Remove()
				end )
			else
				DarkRP.notify( self:Getowning_ent(), 1, 5, "The vehicle already has an alarm installed." )
			end
		end
	end
end
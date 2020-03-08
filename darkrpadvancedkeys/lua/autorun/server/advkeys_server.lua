resource.AddWorkshop( "1443497352" )

function ADVKEYS_OverwriteKeys( ply, before, after )
	timer.Simple(0.1, function()
		if not IsValid( ply ) then 
			return
		end

		if ply:HasWeapon( "keys" ) then
			ply:StripWeapon( "keys" )
			ply:Give( "weapon_adv_keys" )
		end
	end)
end
hook.Add( "OnPlayerChangedTeam", "ADVKEYS_OverwriteKeys", ADVKEYS_OverwriteKeys ) -- DarkRP Special Hook (2.5.0+ Only)

function ADVKEYS_OverwriteKeysSpawn( ply )
	timer.Simple(0.1, function() 
		if not IsValid( ply ) then 
			return
		end
		
		if ply:HasWeapon( "keys" ) then
			ply:StripWeapon( "keys" )
			ply:Give( "weapon_adv_keys" )
		end
	end)
end
hook.Add( "PlayerSpawn", "ADVKEYS_OverwriteKeysSpawn", ADVKEYS_OverwriteKeysSpawn ) -- PlayerSpawn

-- Vehicle Alarm
function ADVKEYS_AlarmTrigger( ply, vehicle, canpick )
	if canpick then
		if vehicle.HasVehicleAlarm then -- has alarm installed
			if not vehicle.AlarmOn then -- alarm not already on
				if vehicle:GetNWBool( "ADVKEYS_IsLocked" ) then -- only activate if car is locked
					if timer.Exists( "ALARM_HazardLightsFlash" ) then
						timer.Remove( "ALARM_HazardLightsFlash" )
					end

					local CarAlarmSound = Sound( ADVKEYS_ALARM_AlarmSound )
	 
					local mysound = CreateSound( vehicle, CarAlarmSound )
					mysound:Play()
					vehicle.AlarmSound = mysound
					
					vehicle.AlarmOn = true
					timer.Simple( 23, function()
						if IsValid( vehicle ) and vehicle.AlarmOn then
							vehicle.AlarmOn = false
							lightson = false
							timer.Remove( "ALARM_HazardLightsFlash" )
						end
					end )
					
					if vehicle.VC_setHazardLights then -- VCMod Check 76561198397716339
						lightson = true
						timer.Create( "ALARM_HazardLightsFlash", 0.5, 0, function()
							if IsValid( vehicle ) then
								if lightson then
									vehicle:VC_setHazardLights( false )
									lightson = false
								else
									vehicle:VC_setHazardLights( true )
									lightson = true
								end
							end
						end )
					end
					
					if ADVKEYS_ALARM_NotifyOwner then
						if IsValid( vehicle:getDoorOwner() ) then
							DarkRP.notify( vehicle:getDoorOwner(), 0, 4, "Somebody is stealing your vehicle!" )
						end
					end
				end
			end
		end
	end
end
hook.Add( "canLockpick", "ADVKEYS_AlarmTrigger", ADVKEYS_AlarmTrigger )
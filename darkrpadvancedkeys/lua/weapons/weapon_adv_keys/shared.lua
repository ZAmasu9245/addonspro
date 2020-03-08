--[[ MODEL INFO
Recommended FOV: 65 +-5

Hold type:  slam

Sequences/ACTS(30 fps):

idle		ACT_VM_IDLE
lock		ACT_VM_PRIMARYATTACK
unlock		ACT_VM_SECONDARYATTACK
lock_alt	ACT_VM_PICKUP
unlock_alt	ACT_VM_RELEASE
draw		ACT_VM_DRAW
press_1		ACT_VM_HITCENTER
press_2		ACT_VM_HITCENTER2
76561198397716339
--]]

if SERVER then
	AddCSLuaFile( "shared.lua" )
	AddCSLuaFile( "cl_menu.lua" )
end

if CLIENT then
	include( "cl_menu.lua" )
	SWEP.PrintName = "Clé"
	SWEP.Slot = 1
    SWEP.SlotPos = 1
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

SWEP.PrintName = "Clé"
SWEP.Author = "Crap-Head"
SWEP.Instructions = "Left click to lock\nRight click to unlock\nReload for door settings or animation menu"
SWEP.Base = "weapon_base"

SWEP.UseHands = true
SWEP.ViewModelFOV = 65
SWEP.ViewModelFlip = false

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "Crap-Head Scripts"

SWEP.ViewModel = "models/craphead_scripts/adv_keys/weapons/c_key.mdl"
SWEP.WorldModel = "models/craphead_scripts/adv_keys/weapons/w_key.mdl"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize()
    self:SetHoldType( "slam" )
end

function SWEP:Deploy()
    self:SetHoldType( "slam" )
	self:SendWeaponAnim( ACT_VM_DRAW )
	--self.Owner:ConCommand( "play craphead_scripts/adv_keys/pull_out.mp3" )
	-- 76561198397716339
end

local function lookingAtLockable(ply, ent, hitpos)
    local eyepos = ply:EyePos()
    return IsValid(ent)             and
        ent:isKeysOwnable()         and
        (
            ent:isDoor()    and eyepos:DistToSqr(hitpos) < ADVKEYS_DistanceToDoor
            or
            ent:IsVehicle() and eyepos:DistToSqr(hitpos) < ADVKEYS_DistanceToVehicle
        )

end

local function ADVWEP_LockUnlockAnim( ply )
    local RP = RecipientFilter()
    RP:AddAllPlayers()

    umsg.Start( "anim_keys", RP )
        umsg.Entity( ply )
        umsg.String( "usekeys" )
    umsg.End()

    ply:AnimRestartGesture( GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_ITEM_PLACE, true )
end

local function ADVWEP_DoKnock( ply )
    ply:EmitSound( table.Random( ADVKEYS_DoorKnockSounds ), 100, math.random( 90, 110 ) )
	
    umsg.Start( "anim_keys" )
        umsg.Entity( ply )
        umsg.String( "knocking" )
    umsg.End()

    ply:AnimRestartGesture( GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST, true )
end

function SWEP:PrimaryAttack()
    local trace = self:GetOwner():GetEyeTrace()

    if not lookingAtLockable( self:GetOwner(), trace.Entity, trace.HitPos ) then 
		return 
	end
	
	if self:GetOwner().CantUse then
		return
	end
	
    if CLIENT then return end
	
	self:SetNextPrimaryFire( CurTime() + ADVKEYS_KnockDoorDelay )
	self:SetNextSecondaryFire( CurTime() + ADVKEYS_KnockDoorDelay )
	
    if self:GetOwner():canKeysLock( trace.Entity ) then
		self:GetOwner().CantUse = true
		timer.Simple( ADVKEYS_LockUnlockDelay, function()
			if IsValid( self ) then
				self:GetOwner().CantUse = false
			end
		end )
	
		if trace.Entity:IsVehicle() then
			timer.Simple( 0.4, function()
				if IsValid( self ) then
					self:SetHoldType( "pistol" )
					self:GetOwner():EmitSound( ADVKEYS_CarBipSound )
					trace.Entity:keysLock()
					
					if trace.Entity.VC_setHazardLights then -- VCMod Check
						trace.Entity:VC_setHazardLights( true )
					end
					
					trace.Entity:SetNWBool( "ADVKEYS_IsLocked", true )
					
					-- Stop alarm
					if trace.Entity.AlarmOn then
						timer.Remove( "ALARM_HazardLightsFlash" )
						trace.Entity.AlarmOn = false
						trace.Entity.AlarmSound:Stop() -- stops the sound
					end
				end
			end)
			timer.Simple( 0.8, function()
				if IsValid( self ) then
					self:SetHoldType( "slam" )
					
					if trace.Entity.VC_setHazardLights then -- VCMod Check
						trace.Entity:VC_setHazardLights( false )
					end
				end
			end)
			
			self:SendWeaponAnim( ACT_VM_HITCENTER )
		else
			self:EmitSound("npc/metropolice/gear" .. math.floor( math.Rand( 1, 7 ) ) .. ".wav")
			timer.Simple(1.1, function()
				if IsValid( self ) then
					self:EmitSound( ADVKEYS_LockDoorSound )
					trace.Entity:keysLock()
					ADVWEP_LockUnlockAnim( self:GetOwner() )
					trace.Entity:SetNWBool( "ADVKEYS_IsLocked", true )
				end
			end)
				
			if ADVKEYS_UsePrimaryAnims then
				self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
			else
				self:SendWeaponAnim( ACT_VM_PICKUP )
			end
		end
		
		timer.Simple( ( ADVKEYS_LockUnlockDelay - 0.15 ), function()
			if IsValid( self ) then
				self:SendWeaponAnim( ACT_VM_IDLE )
			end
		end)
    elseif trace.Entity:IsVehicle() then
        DarkRP.notify(self:GetOwner(), 1, 3, "You do not own this vehicle!")
    else
        ADVWEP_DoKnock( self:GetOwner() )
    end
end

function SWEP:SecondaryAttack()
    local trace = self:GetOwner():GetEyeTrace()

	if not lookingAtLockable( self:GetOwner(), trace.Entity, trace.HitPos ) then 
		return 
	end
	
	if self:GetOwner().CantUse then
		return
	end
	
    if CLIENT then return end
	
	self:SetNextPrimaryFire( CurTime() + ADVKEYS_KnockDoorDelay )
	self:SetNextSecondaryFire( CurTime() + ADVKEYS_KnockDoorDelay )
	
    if self:GetOwner():canKeysLock( trace.Entity ) then
		self:GetOwner().CantUse = true
		timer.Simple( ADVKEYS_LockUnlockDelay, function()
			if IsValid( self ) then
				self:GetOwner().CantUse = false
			end
		end )
	
		if trace.Entity:IsVehicle() then
			timer.Simple( 0.4, function()
				if IsValid( self ) then
					self:SetHoldType( "pistol" )
					self:GetOwner():EmitSound( ADVKEYS_CarBipSound )
					trace.Entity:keysUnLock()
					
					if trace.Entity.VC_setHazardLights then -- VCMod Check
						trace.Entity:VC_setHazardLights( true )
					end
					
					trace.Entity:SetNWBool( "ADVKEYS_IsLocked", false )
					
					-- Stop alarm
					if trace.Entity.AlarmOn then
						timer.Remove( "ALARM_HazardLightsFlash" )
						trace.Entity.AlarmOn = false
						trace.Entity.AlarmSound:Stop() -- stops the sound
					end
				end
			end)
			timer.Simple( 0.8, function()
				if IsValid( self ) then
					self:SetHoldType( "slam" )
					
					if trace.Entity.VC_setHazardLights then -- VCMod Check
						trace.Entity:VC_setHazardLights( false )
					end
				end
			end)
			
			self:SendWeaponAnim( ACT_VM_HITCENTER2 )
		else
			self:EmitSound("npc/metropolice/gear" .. math.floor( math.Rand( 1, 7 ) ) .. ".wav")
			timer.Simple( 1.1, function()
				if IsValid( self ) then
					self:EmitSound( ADVKEYS_UnlockDoorSound )
					trace.Entity:keysUnLock()
					ADVWEP_LockUnlockAnim( self:GetOwner() )
					trace.Entity:SetNWBool( "ADVKEYS_IsLocked", false )
				end
			end )
			
			if ADVKEYS_UsePrimaryAnims then
				self:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
			else
				self:SendWeaponAnim( ACT_VM_RELEASE )
			end
		end
		
		timer.Simple( ( ADVKEYS_LockUnlockDelay - 0.15 ), function()
			if IsValid( self ) then
				self:SendWeaponAnim( ACT_VM_IDLE )
			end
		end )
    elseif trace.Entity:IsVehicle() then
        DarkRP.notify( self:GetOwner(), 1, 3, "You do not own this vehicle!" )
    else
        ADVWEP_DoKnock( self:GetOwner(), "physics/wood/wood_crate_impact_hard3.wav" )
    end
end

-- Default DarkRP code
function SWEP:Reload()
    local trace = self:GetOwner():GetEyeTrace()
	
    if not IsValid(trace.Entity) or (IsValid(trace.Entity) and ((not trace.Entity:isDoor() and not trace.Entity:IsVehicle()) or self.Owner:EyePos():DistToSqr(trace.HitPos) > 40000)) then
        if CLIENT and not DarkRP.disabledDefaults["modules"]["animations"] then 
			RunConsoleCommand("_DarkRP_AnimationMenu") 
		end
        return
    end
	
    if SERVER then
        umsg.Start("KeysMenu", self:GetOwner())
        umsg.End()
    end
end
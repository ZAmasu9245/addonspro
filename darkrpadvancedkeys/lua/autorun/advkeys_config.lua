-- Lots of default sounds can be found here https://maurits.tv/data/garrysmod/wiki/wiki.garrysmod.com/index8f77.html

ADVKEYS_UsePrimaryAnims = true
-- There are two sets of animations for locking and unlocking doors (not cars). The primary is used by default, but if you change this to "false", it will change the animations.  
-- It's basically just an extra turn with the key, but thought someone might prefer it and added a config for it.

ADVKEYS_LockDoorSound = "doors/door_latch1.wav" -- Sound emitted when locking a door.
ADVKEYS_UnlockDoorSound = "doors/door_latch3.wav" -- Sound emitted when unlocking a door.
ADVKEYS_CarBipSound = "craphead_scripts/adv_keys/carlock.wav" -- Sound emitted when locking/unlocking vehicles.

ADVKEYS_LockUnlockDelay = 2.3 -- Delay when using the keys weapon (it's in seconds - DO NOT GO LOWER THAN 2.3 SECONDS). 
ADVKEYS_KnockDoorDelay = 0.5 -- Delay when knocking on a door you do not own.

ADVKEYS_DistanceToDoor = 4225 -- Distance between player and door before keys work.
ADVKEYS_DistanceToVehicle = 125000 -- Distance between player and car before keys work.

ADVKEYS_DoorKnockSounds = { -- This is a list of door knocks that will be chosen at random when knocking a door.
	"physics/wood/wood_crate_impact_soft1.wav",
	"physics/wood/wood_crate_impact_hard3.wav", -- This is the default DarkRP normally uses
	"physics/wood/wood_crate_impact_hard2.wav" -- THE LAST LINE SHOULD NOT HAVE A COMMA AT THE END. BE AWARE OF THIS WHEN EDITING THIS!
}

-- Configuration for the vehicle alarm that comes with the script
ADVKEYS_ALARM_NotifyOwner = true -- Should the owner of the vehicle get a notification when someone is stealing his car? true/false
ADVKEYS_ALARM_AlarmSound = "craphead_scripts/adv_keys/car_alarm.mp3" -- Sound of the alarm
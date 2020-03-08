function ADVKEYS_DarkRPAdds()
	AddEntity("Vehicle Alarm", {
		ent = "adv_veh_alarm",
		model = "models/craphead_scripts/adv_keys/props/alarm.mdl",
		price = 250,
		max = 10,
		cmd = "/buyvehiclealarm"
	})
end
hook.Add( "loadCustomDarkRPItems", "ADVKEYS_DarkRPAdds", ADVKEYS_DarkRPAdds )
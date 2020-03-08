--[[-- License Plate Misc Configs
@copyright 2019 Limelight Gaming
@release 1.5.5
@author Doctor Internet et al.
@module PLATE.Config
--]]--

local PLATE = PLATE_SHARED
local angForward = Angle(0, 180, 90)
local angBackward = Angle(0, 0, 90)

local function prp(...)
	PLATE:RegisterLegacy(...)
end

prp("sim_fphys_pwzaz", {Vector(90, 0, 23.5), Angle(0, 90, 90)})

--[[ LW Russian Vehicles ]]--
prp("kamaz", {Vector(0, 172.2, 45.6), scale = 1.25}, {Vector(-39, -166.5, 48.9)}) -- Kamaz 43101
prp("maz", {Vector(-28, 199.5, 64), scale = 1.4}, {Vector(-30.75, -188.6, 50.5), scale = 0.93}) -- MAZ-535
prp("uaz_31519", {Vector(0, 88.5, 43)}, {Vector(-26.5, -81.5, 79.5), angBackward + Angle(0, 0, -5)}) -- UAZ 31519
prp("uaz_3170", {Vector(0, 116.3, 32.8), angForward + Angle(0, 0, 10)}, {Vector(0, -60, 39), condition = function(v)
	local bg = v:GetBodygroup(5)
	if bg == 1 then return {pos = Vector(0, -100, 90), ang = Angle(0, 0, 0), scale = 0.6} end
	if bg == 2 then return false end
end, scale = 0.7}) -- UAZ 3170 Prototypes
prp("uaz_jag", {Vector(0.7, 109.6, 48.4), angForward + Angle(0, 0, -10)}, {Vector(1.3, -103.2, 46.8), angBackward + Angle(0, 0, -5)}) -- UAZ 3907 Jaguar Amphicar
prp("uaz_452", {Vector(0, 97.9, 53.6)}, {Vector(17, -98.5, 59), angBackward + Angle(0, 0, -5), condition = function(v)
	local bg = v:GetBodygroup(1)
	if bg == 1 then return {pos = Vector(32, -115, 59), ang = angBackward + Angle(0, 90, 0)} end
	if bg == 2 then return false end
end}) -- UAZ 452


--[[ LW Trucks ]]--
prp("daf_xfeuro6_4x2_lw", {Vector(0.46, 117, 20)}) -- DAF XF Euro 6 4x2
prp("mercedes_actros_2014_4x2_lw", {Vector(0.46, 127, 20)}) -- Mercedes Actros 2014 BigSpace 4x2
prp("mercedes_actros_6x4_lw", {Vector(0.46, 137, 32)}) -- Mercedes Actros Low Sleeper 6x4


--[[ LW Cars ]]--
-- Ascari
prp("asc_kz1r", {
	pos = Vector(0, 107.8, 20),
	ang = angForward
},{
	pos = Vector(0, -107.5, 29.3),
	ang = angBackward + Angle(0, 0, -5),
	scale = 0.85
})

-- Aston Martin
prp("astonmartin_cygnet_lw", {
	pos = Vector(0, 73.84, 22.93),
	ang = angForward
},{
	pos = Vector(0, -71, 27),
	ang = angBackward + Angle(0, 0, -18)
})

-- Audi
prp("audi_r18", {
	pos = Vector(0, 105.5, 18.2),
	ang = Angle(0, 180, 25),
	scale = 0.5
})

-- Austin Healey
prp("austin_healey_3000_lw", {
	pos = Vector(0, 94, 15),
	ang = angForward
})

-- Bently
prp("bentley_blower_lw", {
	pos = Vector(-9.2, 129, 23.6),
	ang = angForward,
	scale = 0.9
},{
	pos = Vector(0, -85, 38),
	ang = angBackward + Angle(0, 0, -8)
})
prp("bentley_arnage", {
	pos = Vector(0, 135.3, 21.8),
	ang = angForward
},{
	pos = Vector(0, -113.65, 37.25),
	ang = angBackward + Angle(0, 0, -22.5),
	scale = 0.9
})
prp("bently_pmcontinental", {
	pos = Vector(0, 120.5, 26.9),
	ang = angForward + Angle(0, 0, -10)
},{
	pos = Vector(0, -123.57, 31.48),
	ang = angBackward + Angle(0, 0, -5)
})

-- Bugatti
prp("bugatti_veyron_grandsport_lw", {
	pos = Vector(0, -108, 28.68),
	ang = angBackward + Angle(0, 0, -5)
})

-- Cadillac
prp("cad_eldorado", {
	pos = Vector(0, 136.4, 23),
	ang = angForward,
	scale = 0.9
},{
	pos = Vector(0, -132.8, 24),
	ang = angBackward,
	scale = 0.8
})
prp("cad_eldorado_limo", {
	pos = Vector(0, 136.5, 23),
	ang = angForward,
	scale = 0.9
},{
	pos = Vector(0, -241.4, 24),
	ang = angBackward,
	scale = 0.8
})

-- Caterham
prp("caterham_r500_superlight_lw", {
	pos = Vector( 0, 70.15, 25.7),
	ang = angForward + Angle(0, 0, -63)
},{
	pos = Vector( 0, -73.4, 17.68 ),
	ang = angBackward + Angle(0, 0, -10)
})

-- Chevrolet
prp("chev_camaro_68", {
	pos = Vector( 0, 109, 17.71 ),
	ang = angForward,
	scale = 0.95,
	condition = function(v)
		local bg = v:GetBodygroup(3)
		if bg == 0 then return false end
	end
},{
	pos = Vector( 0, -106, 19.3),
	ang = angBackward + Angle(0, 0, 20),
	scale = 0.95,
	condition = function(v)
		local bg = v:GetBodygroup(3)
		if bg == 0 then return false end
	end
})
prp("chev_cucv_lw", {
	pos = Vector(0, 106.3, 37.2),
	ang = angForward + Angle(0, 0, 15),
	scale = 0.9
},{
	pos = Vector( 0, -139.5, 31.5),
	ang = angBackward,
	scale = 0.8
})
prp("chev_cucv_chassis_lw", {
	pos = Vector( 24.5, 103.25, 36.5),
	ang = angForward,
	scale = 0.9
},{
	pos = Vector( 0, -133.2, 33.25 ),
	ang = angBackward,
	scale = 0.8
})
prp("chev_cucv_flatbed_lw", {
	pos = Vector(0, 106.3, 37.2),
	ang = angForward + Angle(0, 0, 15),
	scale = 0.9
},{
	pos = Vector( 0, -133.2, 33.25 ),
	ang = angBackward,
	scale = 0.8
})


-- Mercedes Benz
prp("merc_sprinter_boxtruck_lw", {Vector( 0.28, 179, 17.03 ), angForward + Angle(0, 0, 10), scale = 0.8}, {Vector(-38, -144.2, 36.8)})
prp("merc_sprinter_lwb_lw", {Vector( 0.71, 134.7, 18.21 ), angForward + Angle(0, 0, 10), scale = 0.8}, {Vector( -17.91, -156, 24.8 ), angBackward + Angle(0, -4, -5)})
prp("merc_sprinter_openchassis_lw", {Vector( 0.71, 179, 17 ), angForward + Angle(0, 0, 10), scale = 0.8}, {Vector( 0.84, -127.5, 21.2 )})
prp("merc_sprinter_swb_lw", {Vector( 0.71, 135, 17 ), angForward + Angle(0, 0, 10), scale = 0.8}, {Vector( -17.91, -112, 24.8 ), angBackward + Angle(0, -4, -5)})

-- Smart
prp("smartfortwo", {
	pos = Vector( 0, 67.62, 21.87 ),
	ang = angForward,
},{
	pos = Vector( 0, -64.5, 43.5 ),
	ang = angBackward
})

-- Y.A.R.E
prp("yare_buggy", {
	pos = Vector(-12.5, -85.5, 40),
	ang = angBackward + Angle(0, 0, -4)
})

-- I started from here. // Zambino
prp("bmw_530d_touring_lw", {Vector(0,-114.5,36), angBackward + Angle(0,0,-11.1), scale = 0.8}, {Vector(0,117.2,22), angForward})
prp("bmw_850csi_lw", {Vector(0,-108.5,33), angBackward + Angle(0,0,-11.1)}, {Vector(0,113.5,18), angForward})
PLATE:RegisterPlate("bmw_i8_lw", {
	pos = Vector(0, 117.5, 18.7),
	ang = Angle(0, 180, 88),
	scale = 0.87
},{
	pos = Vector(0, -114.6, 25),
	ang = angBackward - Angle(0,0,16),
	scale = 0.80
})
prp("bmw_x5_48i_lw", {Vector(0,122,27), angForward + Angle(0,0,0)}, {Vector(0,-114,47), angBackward + Angle(0,0,-7)})
prp("chev_impala_09", {Vector(0,121.7,23), angForward + Angle(0,0,-15)}, {Vector(0,-120,28), angBackward + Angle(0,0,-7)})
prp("chev_impala_09_taxi", "chev_impala_09")
prp("chev_nascar", {Vector(0,127.7,19), angForward + Angle(0,0,-10)}, {Vector(0,-120,28), angBackward + Angle(0,0,-7)})
prp("chev_suburban", {Vector(0,135.7,22), angForward + Angle(0,0,23)}, {Vector(0,-130,46.5), angBackward + Angle(0,0,0)})
prp("chev_tahoe_lw", {Vector(0,114.7,20), angForward + Angle(0,0,14)}, {Vector(0,-114,46.5), angBackward + Angle(0,0,-6)})
prp("citroen_ds3_rally_lw", {Vector(0,93.7,20), angForward + Angle(0,0,0)}, {Vector(0,-93,21), angBackward + Angle(0,0,-25)})
prp("dacia_duster_lw", {Vector(0,96.7,25), angForward + Angle(0,0,13)}, {Vector(0,-108,42), angBackward + Angle(0,0,-15)})
prp("dodge_ram_1500_outdoorsman_lw", {Vector(0,148.7,25), angForward + Angle(0,0,0)}, {Vector(0,-120,32), angBackward + Angle(0,0,0)})
prp("detomaso_pantera_lw", {Vector(0,-101.5,29), angBackward + Angle(0,0,0)})
prp("dodge_charger_70_fnf_lw", {Vector(0,126.4,31), angForward + Angle(0,0,0)}, {Vector(0,-128,27), angBackward + Angle(0,0,-1)})
prp("dodge_charger_2015_lw", {Vector(0, 124.5, 25), angForward}, {Vector(0, -127, 29.7)})
prp("dodge_monaco_lw", {Vector(0, 129.5, 18), angForward}, {Vector(0, -133, 25.7), angBackward + Angle(0,0,-15)})
prp("dodge_viper", {Vector(0, -103, 40.7), angBackward + Angle(0,0,0)})
prp("ferrari_365gts_lw", {Vector(0, -103.5, 35.7), angBackward + Angle(0,0,-28)})
prp("ferrari_458_lw", {Vector(0, -111.12, 28.5), angBackward + Angle(0,0,-20)})
prp("ferrari_f40_lw", {Vector(0, 107.5, 10), angForward}, {Vector(0, -109.12, 21.5), angBackward + Angle(0,0,0)})
prp("ferrari_ff_lw", {Vector(0, 122.62, 15), angForward}, {Vector(0, -118.12, 29.5), angBackward + Angle(0,0,-15)})
prp("ford_capri_rs3100_lw", {Vector(0, 101.62, 19), angForward}, {Vector(0, -104.12, 31.9), angBackward + Angle(0,0,0)})
prp("ford_foxbody_stock_lw", {Vector(0, 114.62, 19), angForward}, {Vector(0, -106.32, 34), angBackward + Angle(0,0,0)})
prp("fiat595", {Vector(0, 76.62, 18), angForward}, {Vector(0, -70, 29.5), angBackward + Angle(0,0,-25)})
prp("ferrari_laferrari_lw", {Vector(0, -109.12, 24.5), angBackward + Angle(0,0,-24)})
prp("fordcountry", {Vector(0, 132.50, 19), angForward + Angle(0,0,15)}, {Vector(0, -133.32, 20), angBackward + Angle(0,0,0)})
prp("ford_mustang_whitegirl_lw", {Vector(0, 109.1, 19), angForward + Angle(0,0,0)}, {Vector(0, -116.32, 26), angBackward + Angle(0,0,0)})
prp("ford_rs200_lw", {Vector(0, 100.7, 18), angForward + Angle(0,0,0)}, {Vector(0, -91.32, 31.70), angBackward + Angle(0,0,-10)})
prp("ford_falcon_xb_lw", {Vector(0, 112.7, 17), angForward + Angle(0,0,30)}, {Vector(0, -121.42, 27), angBackward + Angle(0,0,10)})
prp("gmc_typhoon", {Vector(0, 116.7, 24), angForward + Angle(0,0,0)}, {Vector(0, -98.42, 22.5), angBackward + Angle(0,0,0)})
--[[ 30 ]]--
prp("gmc_yukon_lw", {Vector(0, 136.7, 28), angForward + Angle(0,0,0)}, {Vector(0, -132.42, 32.5), angBackward + Angle(0,0,0)})
prp("honda_nsxr_lw", {Vector(0, 111.7, 18), angForward + Angle(0,0,0)}, {Vector(0, -111.42, 24.5), angBackward + Angle(0,0,0)})
prp("jag_xfr", {Vector(0, 119.7, 23), angForward + Angle(0,0,0)}, {Vector(0, -113.54, 41.5), angBackward + Angle(0,0,-10)})
prp("jaguar_xj220", {Vector(0, 122.7, 12), angForward + Angle(0,0,0)}, {Vector(0, -120.54, 21.5), angBackward + Angle(0,0,0)})
prp("hummer_h1_tc_lw", {Vector(0, 123.7, 34), angForward + Angle(0,0,0)}, {Vector(-43, -119.42, 38.5), angBackward + Angle(0,0,0)})
prp("mer_g65_6x6", {Vector(0, 124.7, 45), angForward + Angle(0,0,0)}, {Vector(0, -162.42, 40.5), angBackward + Angle(0,0,0)})
prp("hummer_h1_tc_offroad_lw", "hummer_h1_tc_lw")
prp("lam_countach", {Vector(0, 104.5, 17.5), angForward + Angle(0,0,13)}, {Vector(0, -100.12, 26.5), angBackward + Angle(0,0,0)})
prp("lam_huracan_lw", {Vector(0, 114.6, 13.5), angForward}, {Vector(0, -99.8, 19), angBackward + Angle(0,0,-20)})
prp("lotus_esprit_80_lw", {Vector(0, 113.6, 19.5), angForward}, {Vector(0, -94.8, 34.5), angBackward + Angle(0,0,0)})
prp("lotus_exiges_roadster_lw", {Vector(0, 98.6, 10.5), angForward}, {Vector(0, -100.8, 29.5), angBackward + Angle(0,0,0)})
prp("miata94", {Vector(0, 99.6, 18.5), angForward + Angle(0,0,10)}, {Vector(0, -92.8, 32.5), angBackward + Angle(0,0,-10)})
prp("mercedes_slk55_lw", {Vector(0, 97.6, 21.5), angForward + Angle(0,0,10)}, {Vector(0, -92.8, 36.9), angBackward + Angle(0,0,-10), scale = 0.8})
prp("lam_reventon_lw", {Vector(8, 119, 13.5), angForward + Angle(7,-17,20)}, {Vector(0, -103.4, 30.4), angBackward + Angle(0,0,-20)})
prp("lancia_037_stradale_lw", {Vector(0, -94.4, 18.4), angBackward + Angle(0,0,-0)})
prp("mercedes_190e_evo_lw", {Vector(0, -105.4, 31.4), angBackward + Angle(0,0,-10)})
prp("evo6", {Vector(-20, 107.6, 22.5), angForward + Angle(0,12,0)}, {Vector(0, -104, 42.7), angBackward + Angle(0,0,-10)})
prp("morgan_3wheeler_lw", {Vector(0, 68.6, 8.5), angForward + Angle(0,0,0)}, {Vector(0, -74, 20.7), angBackward})
prp("nfsmustang", {Vector(0, 130.6, 28.5), angForward + Angle(0,0,0)}, {Vector(0, -108, 32.7), angBackward + Angle(0,0,-10)})
prp("nissan_silvia_s14_lw", {Vector(0, 112.6, 20.5), angForward + Angle(0,0,0)}, {Vector(0, -113, 22), angBackward + Angle(0,0,3), scale = 0.8})
prp("nissan_silvia_s14_wide_lw", {Vector(0, 113.6, 20.8), angForward + Angle(0,0,-10)}, {Vector(0, -110, 36), angBackward + Angle(0,0,-14)})
prp("nissan_silvia_s14_works_lw", {Vector(0, 113.6, 20.8), angForward + Angle(0,0,-10)}, {Vector(0, -110, 34), angBackward + Angle(0,0,-14)})
prp("nis_skyline_r32", {Vector(0, 110.6, 23.8), angForward + Angle(0,0,0)}, {Vector(0, -110, 23), angBackward + Angle(0,0,14)})
prp("subaru_impreza_2001_lw", {Vector(0, 110, 20.8), angForward + Angle(0,0,0)}, {Vector(0, -106.2, 20), angBackward + Angle(0,0,0)})
prp("subaru_impreza_2004_lw", {Vector(0, 108, 20.8), angForward + Angle(0,0,0)}, {Vector(0, -105.2, 22), angBackward + Angle(0,0,0)})
prp("nissan_sileighty_lw", {Vector(0, 107.9, 20.8), angForward + Angle(0,0,0)}, {Vector(0, -109.5, 20), angBackward + Angle(0,0,0)})
prp("nis_s13", {Vector(0, 112.9, 20.8), angForward + Angle(0,0,0)}, {Vector(0, -109.5, 20), angBackward + Angle(0,0,0)})
prp("2000gtrstock", {Vector(0, 101.9, 20.8), angForward + Angle(0,0,0)}, {Vector(0, -116.8, 30), angBackward + Angle(0,0,8)})
prp("2000gtr_sh", "2000gtrstock")
prp("merc_sprinter_boxtruck_lw", {Vector(0, 179.3, 18), angForward + Angle(0,0,0)}, {Vector(0, -127.42, 20.5), angBackward + Angle(0,0,0)})









--[[ TDM Commercial ]]--
prp("courier_trucktdm", {
	pos = Vector(0, 139.6, 31.6),
	ang = angForward
},{
	pos = Vector(-39, -150, 110),
	ang = angBackward
})

prp("bustdm", {
	pos = Vector(0, 263.5, 60),
	ang = angForward,
	scale = 1.3
},{
	pos = Vector(0, -267.5, 68),
	ang = angBackward,
	scale = 1.3
})



--[[ TDM Trucks ]]--
prp("fgtargsytdm",{
	pos = Vector(0, 123.4, 30.9),
	ang = Angle(180, 0, -84)
},{
	pos = Vector(0,-3, 130),
	ang = angBackward,
	scale = 1.3
})
prp("c5500tdm",{
	pos = Vector(0, 124.62, 23.5),
	ang = Angle(180, 0, -85),
	scale = 0.8
},{
	pos = Vector(0, -208.35, 19.58),
	ang = angBackward,
	scale = 0.78
})
prp("kwt800tdm",{
	pos = Vector(0, 182.59, 30),
	ang = angForward,
	scale = 1.2
},{
	pos = Vector(-36, -9.2, 98),
	ang = angBackward,
	scale = 1.2
})
prp("peterbilt_579tdm",{
	pos = Vector(0, 173.75, 41.5),
	ang = Angle(180, 0, -94.9),
	scale = 0.8
},{
	pos = Vector(0, -123.385, 48),
	ang = angBackward
})
prp("peterbilt_579medtdm",{
	pos = Vector(0, 173.75, 47.5),
	ang = Angle(180, 0, -94.9),
	scale = 0.8
},{
	pos = Vector(0, -174.828, 54),
	ang = angBackward
})
prp("scania09tdm",{
	pos = Vector(0, 106.6, 34.8),
	ang = Angle(180, 0, -91.5)
},{
	pos = Vector(0,-131, 36),
	ang = angBackward
})
prp("scania09jigtdm",{
	pos = Vector(0, 106.6, 34.8),
	ang = Angle(180, 0, -91.5)
},{
	pos = Vector(0,-131, 36),
	ang = angBackward
})
prp("volvofh16shorttdm",{
	pos = Vector(0, 117.445, 25.8),
	ang = angForward,
	scale = 0.78
},{
	pos = Vector(0,-116, 27.8),
	ang = angBackward,
	scale = 1.2
})
prp("volvofh16longtdm",{
	pos = Vector(0, 117.445, 25.8),
	ang = angForward,
	scale = 0.78
},{
	pos = Vector(0,-124.65, 28.8),
	ang = angBackward,
	scale = 1.2
})



--[[ TDM Emergency ]]--
prp("charger12poltdm",{
	pos = Vector(0, 120.11, 22.8),
	ang = Angle(0, 180, 95),
	scale = 0.8
},{
	pos = Vector(0,-125.85, 30.8),
	ang = angBackward
})

prp("chargersrt8poltdm",{
	pos = Vector(7, 120.648, 22.5),
	ang = Angle(0, 171.2, 98),
	scale = 0.8
},{
	pos = Vector(0,-118.7, 28.8),
	ang = angBackward,
	scale = 0.81
})

prp("forcrownvicpoltdm",{
	pos = Vector(0, 125.9, 22),
	ang = Angle(0, 180, 112),
	scale = 0.8
},{
	pos = Vector(0,-123.5, 38),
	ang = Angle(0, 0, 79),
	scale = 0.9
})

prp("for_crownvic_fh3tdm",{
	pos = Vector(0, 121.95, 24.8),
	ang = Angle(0, 180, 97),
},{
	pos = Vector(0,-127.9, 43.5),
	ang = Angle(0, 0, 79),
	scale = 0.9
})

prp("fortauruspoltdm",{
	pos = Vector(0, 123.5, 19),
	ang = Angle(0, 180, 97),
	scale = 0.9
},{
	pos = Vector(0,-123.5, 26),
	ang = angBackward,
	scale = 0.87
})

prp("hsvw427poltdm",{
	pos = Vector(0, 121.9, 16.5),
	ang = angForward
},{
	pos = Vector(0,-114.95, 43),
	ang = Angle(0, 0, 79),
	scale = 0.87
})

--Lexus
prp("lex_is300tdm",{
	pos = Vector(0, 105.8, 23.8),
	ang = Angle(0, 180, 87.31),
	scale = 0.7
},{
	pos = Vector(0,-99.2, 38),
	ang = Angle(0, 0, 85)
})
prp("lex_is300poltdm", "lex_is300tdm")

prp("lex_isftdm",{
	pos = Vector(0, 109.65, 13),
	ang = Angle(0, 180, 94)
},{
	pos = Vector(0,-103.92, 39),
	ang = Angle(0, 0, 74)
})

prp("mereclasspoltdm",{
	pos = Vector(0, 103, 17.7),
	ang = Angle(0, 180, 100),
	scale = 0.73
},{
	pos = Vector(0,-120.25, 41.5),
	ang = Angle(0, 0, 83)
})

prp("mitsuevoxpoltdm",{
	pos = Vector(0, 105.25, 21.5),
	ang = Angle(0, 180, 99),
	scale = 0.9
},{
	pos = Vector(0,-105.3, 42),
	ang = Angle(0, 0, 95),
	scale = 0.87
})

prp("scaniafiretdm",{
	pos = Vector(0, 149, 37.5),
	ang = angForward,
	scale = 1.1
},{
	pos = Vector(30,-163.9, 40),
	ang = angBackward
})

prp("airtugtdm",{
	pos = Vector(0, 61, 18.5),
	ang = angForward,
	scale = 0.85
},{
	pos = Vector(17,-47.38, 20),
	ang = Angle(0, 0, 79),
	scale = 0.85
})



--[[ TDM Cars ]]--
-- Alfa Romeo
prp("alfa_stradaletdm", {
	pos = Vector( 0, 89.4, 24.8),
	ang = angForward + Angle(0, 0, -60)
},{
	pos = Vector(0, -93.45, 31.2),
	ang = angBackward + Angle(0, 0, 11)
})
prp("alfa_giuliettatdm", {
	pos = Vector( -19.29, 102.5, 25.2 ),
	ang = angForward + Angle(0, 13.5, -8),
	scale = 0.7
},{
	pos = Vector( -0.91, -100.9, 26.7 ),
	ang = angBackward + Angle(0, 0, -14),
	scale = 0.8
})

-- Aston Martin
prp("ast_db5tdm", {
	pos = Vector(0, 111.5, 20),
	ang = angForward,
},{
	pos = Vector( 0, -106.6, 31.2),
	ang = angBackward + Angle(0, 0, -5),
	scale = 0.8
})
prp("dbstdm", {
	pos = Vector( 0, 113, 20 ),
	ang = angForward
},{
	pos = Vector(0, -107, 40),
	ang = angBackward + Angle( 0, 0, -15 )
})
prp("ast_rapidetdm", {
	pos = Vector( 0, 122.75, 21.5 ),
	ang = angForward
},{
	pos = Vector( -0.29, -118.7, 30.55 ),
	ang = angBackward + Angle( 0, 0, -17 )
})
prp("v12vantagetdm", {
	pos = Vector( 0, 104.9, 16 ),
	ang = angForward
},{
	pos = Vector( -0.29, -109.8, 24.6 ),
	ang = angBackward + Angle( 0, 0, -12 ),
	scale = 0.9
})

-- Audi
prp("audir8tdm", {
	pos = Vector(0, 107.9, 21.5),
	ang = angForward,
},{
	pos = Vector(0, -103.5, 29.2),
	ang = angBackward + Angle(0, 0, -20),
})
prp("audir8spydtdm", {
	pos = Vector(0, 109, 27),
	ang = angForward,
},{
	pos = Vector(0, -103.2, 35.9),
	ang = angBackward + Angle(0, 0, -20),
})
prp("audir8plustdm", {
	pos = Vector(0, 107, 24),
	ang = angForward + Angle(0, 0, -9),
},{
	pos = Vector(0, -102, 34),
	ang = angBackward + Angle(0, 0, -20),
})
prp("rs4avanttdm", {
	pos = Vector( 0, 108.6, 22 ),
	ang = angForward + Angle(0, 0, -5)
},{
	pos = Vector( 0, -110.5, 34.5 ),
	ang = angBackward + Angle(0, 0, -14)
})
prp("auds4tdm", {
	pos = Vector( 0, 106.5, 24 ),
	ang = angForward + Angle(0, 0, -5)
},{
	pos = Vector( 0, -109.3, 38 ),
	ang = angBackward + Angle(0, 0, -14)
})
prp("auds5tdm", "auds4tdm")
prp("auditttdm", {
	pos = Vector(2.5, 101.5, 20.5),
	ang = angForward + Angle(0, 0 , -10)
},{
	pos = Vector(2.8, -94, 29.9 ),
	ang = angBackward + Angle(0, 0, -25)
})

-- BMW
prp("bmw1mtdm", {
	pos = Vector(0, 103.5, 20),
	ang = angForward,
},{
	pos = Vector( 0, -99, 38.5),
	ang = angBackward + Angle(0, 0, -10)
})
prp("bmw_340itdm", {
	pos = Vector( 0.28, 113.9, 20.9 ),
	ang = angForward,
},{
	pos = Vector( -0.69, -108, 39 ),
	ang = angBackward + Angle(0, 0, -20)
})
prp("507tdm", {
	pos = Vector( -0.1, 108, 28.5 ),
	ang = angForward
},{
	pos = Vector( 0, -105, 27.81 ),
	ang = angBackward + Angle(0, 0, -10)
})
prp("m1tdm",{
	pos = Vector( 0, 104, 12 ),
	ang = angForward,
},{
	pos = Vector( 0, -103, 34.5 ),
	ang = angBackward + Angle( 0, 0, -20 ),
})
prp("m3e92tdm",{
	pos = Vector( 0, 111, 16 ),
	ang = angForward
},{
	pos = Vector( 0, -106, 32 ),
	ang = angBackward + Angle(0, 0, -10)
})
prp("bmwm3gtrtdm",{
	pos = Vector( 0, 110, 24.12),
	ang = angForward
},{
	pos = Vector( 0.21, -102.2, 39.4 ),
	ang = angBackward + Angle(0, 0, -12)
})
prp("m5e34tdm", {
	pos = Vector( 0, 115.3, 21 ),
	ang = angForward,
	scale = 0.8
},{
	pos = Vector( 0, -111, 39 ),
	ang = angBackward,
	scale = 0.9
})
prp("bmwm5e60tdm", {
	pos = Vector( 0, 116.06, 26.62 ),
	ang = angForward,
},{
	pos = Vector( 0, -108, 41 ),
	ang = angBackward + Angle(0, 0, -15),
})
prp("bmwm613tdm", {
	pos = Vector( 0, 118.28, 32 ),
	ang = angForward,
},{
	pos = Vector( 0, -117.5, 33 ),
	ang = angBackward + Angle(0, 0, -5),
})
prp("bmw_isettatdm", {
	pos = Vector( 0, 54.5, 18 ),
	ang = angForward,
},{
	pos = Vector( 0, -48, 18 ),
	ang = angBackward + Angle(0, 0, -5),
})

-- Bowler
prp("bowlexrstdm", {
	pos = Vector( 0, 102.62, 21.5 ),
	ang = angForward
},{
	pos = Vector(0, -101.5, 45),
	ang = angBackward + Angle(0, 0, -5)
})

-- Bugatti
prp("eb110tdm", {
	pos = Vector( 0.12, 108, 13.5 ),
	ang = angForward,
},{
	pos = Vector( 0, -105, 33 ),
	ang = angBackward,
})
prp("veyrontdm", {
	pos = Vector( 0, -108, 30.5 ),
	ang = angBackward + Angle(0, 0, -5),
})
prp("veyronsstdm", {
	pos = Vector( 0, -94.7, 30.7 ),
	ang = angBackward + Angle(0, 0, -7),
	scale = 0.7
})

-- Cadillac
prp("cad_escaladetdm", {
	pos = Vector( 0, 123.5, 27.5 ),
	ang = angForward,
},{
	pos = Vector( 0, -124.5, 44.5 ),
	ang = angBackward
})
prp("cad_lmptdm", {
	pos = Vector(18, 103, 17.2 ),
	ang = Angle(0, 180, 25),
	scale = 0.5
})

-- Chevrolet
prp("che_blazertdm", {
	pos = Vector(0, 106.5, 22),
	ang = angForward + Angle(0, 0, 15),
	scale = 0.7
},{
	pos = Vector( 0, -105.8, 26.7 ),
	ang = angBackward,
	scale = 0.9
})
prp("che_c10tdm", {
	pos = Vector(0, 116.5, 21.9),
	ang = angForward + Angle(0, 0, 5)
},{
	pos = Vector(0, -108.45, 23.4),
	ang = angBackward
})
prp("che_69camarotdm", {
	pos = Vector(0, 116.3, 19),
	ang = angForward + Angle(0, 0, 10)
},{
	pos = Vector(0, -103.47, 25.4),
	ang = angBackward
})
prp("che_camarozl1tdm", {
	pos = Vector(0, 115, 23.21),
	ang = angForward
},{
	pos = Vector(0, -112, 33.5),
	ang = angBackward
})
prp("che_chevellesstdm", {
	pos = Vector(0, 124, 19),
	ang = angForward + Angle(0, 0, 10)
},{
	pos = Vector(0, -120.9, 25.8),
	ang = angBackward,
	scale = 0.8
})
prp("che_corv_gsctdm", {
	pos = Vector(0, 111.8, 21),
	ang = angForward + Angle(0, 0, 10)
},{
	pos = Vector(0, -103.5, 29.5),
	ang = angBackward,
})
prp("che_stingray427tdm", {
	pos = Vector( 0.53, 103.8, 24 ),
	ang = angForward + Angle(0, 0, 25),
},{
	pos = Vector( 0, -104, 26 ),
	ang = angBackward,
})
prp("che_impala96tdm",{
	pos = Vector( 0, 121, 17 ),
	ang = angForward,
},{
	pos = Vector( 0, -140, 35 ),
	ang = angBackward + Angle(0, 0, -20),
})
prp("che_sparktdm",{
	pos = Vector( 0, 88.25, 20 ),
	ang = angForward,
},{
	pos = Vector( 0, -85.5, 39 ),
	ang = angBackward + Angle(0, 0, -20)
})

-- Chrysler
prp("300ctdm", {
	pos = Vector( 0, 124, 21 ),
	ang = angForward
},{
	pos = Vector( 0, -124, 29.5 ),
	ang = angBackward + Angle(0, 0, -5)
})
prp("chr300c12tdm", {
	pos = Vector( 0, 121, 21 ),
	ang = angForward
},{
	pos = Vector( 0, -119, 29.5 ),
	ang = angBackward + Angle(0, 0, -5)
})
prp("ptcruisertdm", {
	pos = Vector( 0, 105, 19 ),
	ang = angForward
},{
	pos = Vector( 0, -102, 20.5 ),
	ang = angBackward + Angle(0, 0, -5)
})

-- Citroen
prp("citroenc1tdm", {
	pos = Vector( 0, 85, 22.5 ),
	ang = angForward,
	scale = 0.9
},{
	pos = Vector( 0, -81, 18.6 ),
	ang = angBackward + Angle(0, 0, -5),
	scale = 0.9
})
prp("c4tdm", {
	pos = Vector( 0, 96, 21 ),
	ang = angForward,
},{
	pos = Vector( 0, -99.4, 25.7 ),
	ang = angBackward + Angle(0, 0, -7),
	scale = 0.9
})

-- Delorean
prp("deloreantdm", {
	pos = Vector( 0, 102, 22 ),
	ang = angForward,
},{
	pos = Vector( -0.25, -100.7, 40.8 ),
	ang = angBackward + Angle(0, 0, -10),
	scale = 0.9
})

-- Dodge
prp("challenger70tdm", {
	pos = Vector( 0, 114, 21 ),
	ang = angForward,
},{
	pos = Vector( 0, -117, 27 ),
	ang = angBackward,
})
prp("dod_challenger15tdm", {
	pos = Vector( 0, 122, 22.2 ),
	ang = angForward + Angle(0, 0, 25),
},{
	pos = Vector( 0, -121.5, 27.3 ),
	ang = angBackward,
})
prp("chargersrt8tdm", {
	pos = Vector( 0, 121.8, 23 ),
	ang = angForward,
},{
	pos = Vector( 0, -118.8, 29 ),
	ang = angBackward + Angle(0, 0, -5),
	scale = 0.8
})
prp("charger2012tdm", {
	pos = Vector( 0, 121.8, 23 ),
	ang = angForward,
},{
	pos = Vector( 0, -126, 31 ),
	ang = angBackward + Angle(0, 0, -5),
})
prp("dod_ram_1500tdm", {
	pos = Vector( 0, 126, 23.5 ),
	ang = angForward,
},{
	pos = Vector( -26, -132.6, 28 ),
	ang = angBackward + Angle(0, -4, 7),
})
prp("dod_ram_3500tdm", {
	pos = Vector(0, 147.2, -19),
	ang = angForward,
},{
	pos = Vector( 0, -149.8, -9.2 ),
	ang = angBackward,
})
prp("dodgeramtdm", {
	pos = Vector(0, 122, 21.5),
	ang = angForward,
	condition = function(v)
		local bg = v:GetBodygroup(2)
		if bg == 0 then return {ang = angForward + Angle(0, 0, 5)} end
		if bg == 1 then return {pos = Vector( 0, 123.4, 20)} end
		if bg == 2 then return false end
	end
},{
	pos = Vector( 0, -119.9, 28 ),
	ang = Angle( 0, 0, 95 ),
	scale = 0.9
})

-- Ferrari
prp("fer_250gtotdm", {
	pos = Vector( 0, 102.37, 19.75 ),
	ang = angForward + Angle(0, 0, -50)
},{
	pos = Vector( 0, -101.2, 23.5 ),
	ang = angBackward
})
prp("fer_250gttdm", {
	pos = Vector( 0, 102.6, 18 ),
	ang = angForward
},{
	pos = Vector( 0, -102.7, 20.68 ),
	ang = angBackward
})
prp("fer_458spidtdm", {
	pos = Vector( 0, 109, 13.9 ),
	ang = angForward,
	scale = 0.9
},{
	pos = Vector( 0, -110, 29 ),
	ang = angBackward + Angle(0, 0, -20),
})
prp("fer_512trtdm", {
	pos = Vector( 0, 109.2, 13.4 ),
	ang = angForward + Angle(0, 0, 10),
	scale = 0.9
},{
	pos = Vector( 0, -107, 21.5 ),
	ang = angBackward,
	scale = 0.9
})
prp("fer_enzotdm", {
	pos = Vector( 1.2, 115.8, 16.4),
	ang = angForward,
	scale = 0.7
},{
	pos = Vector( 1.1, -114, 27),
	ang = angBackward
})
prp("ferf12tdm", {
	pos = Vector( 0, 109.5, 18),
	ang = angForward,
},{
	pos = Vector( 0, -108.9, 33.2),
	ang = angBackward + Angle(0, 0, -10)
})
prp("ferf430tdm", {
	pos = Vector( 0, 107.2, 14.5),
	ang = angForward + Angle(0, 0, 50),
},{
	pos = Vector( 0, -106, 27.4),
	ang = angBackward + Angle(0, 0, -13)
})
prp("fer_f50tdm", {
	pos = Vector( 0.81, 111, 9.84 ),
	ang = angForward
},{
	pos = Vector( 0.25, -109, 20.5 ),
	ang = angBackward
})
prp("fer_lafertdm", {
	pos = Vector( -13.5, 112, 17.31 ),
	ang = angForward + Angle(0, 15, 5)
},{
	pos = Vector( -16.19, -100, 31.71 ),
	ang = angBackward + Angle(0, -10, -13)
})

-- Ford
prp("crownvic_taxitdm", {
	pos = Vector( -0.2, 137.34, 20.46 ),
	ang = angForward + Angle(0, 0, 12),
},{
	pos = Vector( -0.2, -112.29, 37.91 ),
	ang = angBackward + Angle(0, 0, -6),
})
prp("coupe40tdm", {
	pos = Vector( -22.94, 109.65, 17.75 ),
	ang = angForward + Angle(0, 14, 5),
},{
	pos = Vector( 0.06, -113.6, 22.59 ),
	ang = angBackward + Angle(0, 0, -6),
})
prp("f100tdm", {
	pos = Vector( -35.38, 116.65, 19.18 ),
	ang = angForward + Angle(0, 6, 0),
},{
	pos = Vector( 0.06, -113.6, 22.59 ),
	ang = angBackward + Angle(0, 0, -6),
})
prp("f350tdm", {
	pos = Vector( 0.18, 134.21, 33.68 ),
	ang = angForward + Angle(0, 0, 0),
},{
	pos = Vector( -0.19, -155.97, 35.28 ),
	ang = angBackward + Angle(0, 0, -6),
})
prp("focusrstdm", {
	pos = Vector( 0, 100.95, 22.25 ),
	ang = angForward + Angle(0, 0, -3),
},{
	pos = Vector( 0.15, -103.22, 37.5 ),
	ang = angBackward + Angle(0, 0, -8),
})
prp("for_focus_rs16tdm", {
	pos = Vector( 0, 102.95, 18.25 ),
	ang = angForward + Angle(0, 0, -3),
},{
	pos = Vector( 0.15, -100.8, 46.5 ),
	ang = angBackward + Angle(0, 0, -15),
})
prp("focussvttdm", {
	pos = Vector( -0.07, 102.73, 17.21 ),
	ang = angForward + Angle(0, 0, -5),
},{
	pos = Vector( 0.15, -98.42, 41.5 ),
	ang = angBackward + Angle(0, 0, -8),
})
prp("gt05tdm", {
	pos = Vector( -0.07, 105.73, 17.21 ),
	ang = angForward + Angle(0, 0, 12),
},{
	pos = Vector( 0.81, -107.5, 32.78 ),
	ang = angBackward + Angle(0, 0, 17),
})
prp("mustanggttdm", {
	pos = Vector( 0.56, 115.8, 25.28 ),
	ang = angForward + Angle(0, 0, 12),
},{
	pos = Vector( -0.35, -114.29, 26.62 ),
	ang = angBackward + Angle(0, 0, 3),
})
prp("raptorsvttdm", {
	pos = Vector(0, 136.5, 27.3),
	ang = angForward
},{
	pos = Vector(0, -126.9, 32.9),
	ang = angBackward + Angle(0, 0, -1),
})
prp("for_she_gt500tdm", {
	pos = Vector( 0.56, 113.6, 20.28 ),
	ang = angForward + Angle(0, 0, 12),
},{
	pos = Vector( 0.06, -112.75, 33.34 ),
	ang = angBackward + Angle(0, 0, 3),
})
prp("transittdm", {
	pos = Vector( 0.56, 121.5, 25.28 ),
	ang = angForward + Angle(0, 0, 12),
},{
	pos = Vector( 0.06, -112.75, 40.34 ),
	ang = angBackward + Angle(0, 0, 3),
})

-- GMC
prp("gmc_savana_lw", {
	pos = Vector( -1.47, 132.78, 17.15),
	ang = angForward,
},{
	pos = Vector(15.9, -131.37, 48.00),
	ang = angBackward,
})
prp("gmc_savana_news_lw", {
	pos = Vector( 0, 137, 24.15),
	ang = angForward,
},{
	pos = Vector(15.9, -131.37, 48.00),
	ang = angBackward,
})
prp("sierralowtdm", {
	pos = Vector( 0, 125, 22.5),
	ang = angForward,
	scale = 0.8
},{
	pos = Vector(0, -128.5, 27.4),
	ang = angBackward,
	scale = 0.8
})
prp("sierratdm", {
	pos = Vector(0, 125, 42.5),
	ang = angForward,
	scale = 0.8
},{
	pos = Vector(0, -128.5, 47.4),
	ang = angBackward,
	scale = 0.8
})
prp("syclonetdm", {
	pos = Vector( 0.28, 113, 22.93 ),
	ang = angForward,
	scale = 0.8
},{
	pos = Vector( 0.46, -107.2, 23.87 ),
	ang = angBackward,
	scale = 0.8
})
prp("gmcvantdm", {
	pos = Vector(0, 113.5, 20.5),
	ang = angForward + Angle(0, 0, 10)
},{
	pos = Vector(0.8, -110.9, 19.25),
	ang = angBackward
})

-- Holden
prp("hsvgtstdm", {
	pos = Vector( 0.31, 121.5, 23.71 ),
	ang = angForward,
	scale = 0.9
},{
	pos = Vector( 0.93, -117.16, 42.43 ),
	ang = angBackward,
	scale = 0.9
})
prp("hsvw427tdm", {
	pos = Vector( 0.31, 123, 23.71 ),
	ang = angForward,
	scale = 0.9
},{
	pos = Vector( 0.93, -115.5, 42.43 ),
	ang = angBackward,
	scale = 0.9
})

-- Honda
prp("civictypertdm", {
	pos = Vector( 0.31, 108.5, 21.71 ),
	ang = angForward,
	scale = 0.9
},{
	pos = Vector( 0, -94, 38.5 ),
	ang = angBackward + Angle(0, 0, -10),
	scale = 0.9
})
prp("civic97tdm", {
	pos = Vector( 0.31, 103.5, 22.71 ),
	ang = angForward,
	scale = 0.9
},{
	pos = Vector( 0, -96.5, 40 ),
	ang = angBackward + Angle(0, 0, -10),
	scale = 0.9
})
prp("hon_crxsirtdm", {
	pos = Vector( -0.82, 84.5, 26 ),
	ang = angForward + Angle(0, 0, -50),
},{
	pos = Vector( 0, -85.7, 20.5 ),
	ang = angBackward + Angle(0, 0, -10),
	scale = 0.8,
	condition = function(veh)
		local bg = veh:GetBodygroup(4)
		if bg == 1 then return {pos = Vector( 0.21, -87, 20 )} end
		if bg == 2 then return {pos = Vector( 0.15, -85.8, 18.31 ), ang = angBackward + Angle(0, 0, -5)} end
		if bg == 3 then return {pos = Vector( 0.03, -86.7, 16.78 ), ang = angBackward} end
	end
})
prp("s2000tdm", {
	pos = Vector( 8.84, 97.28, 29 ),
	ang = angForward + Angle(0, 0, -60),
	scale = 0.8
},{
	pos = Vector( 0.03, -97, 22 ),
	ang = angBackward,
	scale = 1,
	condition = function(veh)
		local bg = veh:GetBodygroup(4)
		if bg == 1 then return {pos = Vector( -0.22, -97.5, 22 ), ang = angBackward + Angle(0, 0, -7)} end
		if bg == 2 then return {pos = Vector( -0.22, -98.3, 22.7 ), ang = angBackward + Angle(0, 0, -7)} end
		if bg == 3 then return {pos = Vector( -0.22, -97.4, 22.7 ), ang = angBackward + Angle(0, 0, -7)} end
	end
})

-- Hudson
prp("hudhornettdm", {
	pos = Vector( -0.44, 130, 24.62 ),
	ang = angForward,
	scale = 0.9
},{
	pos = Vector( 0.12, -127.88, 23 ),
	ang = angBackward + Angle(0, 0, -10),
	scale = 0.9
})

-- Hummer
prp("h1tdm", {
	pos = Vector(35.25, -110, 35),
	ang = Angle(180, 180, -90)
})
prp("h1opentdm", "h1tdm")

-- Jaguar
prp("jag_etypetdm",	{
	pos = Vector( -0.07, -102.5, 24.68 ),
	ang = angBackward + Angle(0, 0, -5),
})
prp("jag_ftypetdm",	{
	pos = Vector( 0, 109.8, 20 ),
	ang = angForward,
},{
	pos = Vector( 0, -106.6, 36.6 ),
	ang = angBackward + Angle(0, 0, -5),
})

-- Jeep
prp("grandchetdm", {
	pos = Vector( 0, 119.6, 31 ),
	ang = angForward + Angle(0, 0, -7),
},{
	pos = Vector( 0, -113.95, 51.9 ),
	ang = angBackward,
})
prp("jeewillystdm", {
	pos = Vector( -0.32, 75, 27.96 ),
	ang = angForward,
},{
	pos = Vector( 12.87, -86.85, 51.81 ),
	ang = angBackward,
})
prp("wranglertdm", {
	pos = Vector( 0, 91, 32 ),
	ang = angForward + Angle(0, 0, -7),
},{
	pos = Vector( 17, -84.95, 29.9 ),
	ang = angBackward,
})
prp("wrangler88tdm", {
	pos = Vector( 0, 95, 28 ),
	ang = angForward,
},{
	pos = Vector( -29.8, -80.95, 38.1 ),
	ang = angBackward,
})
prp("wrangler_fnftdm", {
	pos = Vector( -0.25, 105.09, 43.9 ),
	ang = angForward,
})

-- [Kia] - Cole
prp("ceedtdm",{
	pos = Vector( -0.16, 107.29, 13.97 ),
	ang = angForward,
},{
	pos = Vector( 0.42, -96.5, 35.5 ),
	ang = angBackward + Angle(0, 0, -10),
})

prp("fortekouptdm",{
	pos = Vector( -0.09, 111, 20.25 ),
	ang = angForward,
},{
	pos = Vector( 0.92, -108.9, 25 ),
	ang = angBackward + Angle(0, 0, -10),
})

-- [KTM] - Cole
prp("xbowtdm",{
	pos = Vector( 0.19, 92, 15.8 ),
	ang = angForward,
},{
	pos = Vector( -0.1, -82.4, 37.37 ),
	ang = angBackward + Angle(0, 0, -20),
})

prp("242turbotdm",{
	pos = Vector(0, 122.45, 17.3),
	ang = Angle(0, 180, 100),
	scale = 0.75
},{
	pos = Vector(0,-106.3, 28),
	ang = Angle(0, 0, 78)
})
prp("vol850rtdm",{
	pos = Vector(0, 116.4, 19.9),
	ang = Angle(0, 180, 95),
	scale = 0.78
},{
	pos = Vector(0,-110, 36),
	ang = Angle(0, 0, 84.9)
})
prp("vols60tdm",{
	pos = Vector(0, 109.65, 14.7),
	ang = Angle(0, 180, 91),
	scale = 0.7
},{
	pos = Vector(0,-105.45, 36),
	ang = Angle(0, 0, 83.5)
})
prp("volxc70tdm",{
	pos = Vector(0, 118.5, 17.6),
	ang = Angle(0, 180, 91),
	scale = 0.7
},{
	pos = Vector(0,-110.9, 34),
	ang = Angle(0, 0, 79.6)
})
prp("volxc90tdm",{
	pos = Vector(0, 116.78, 18.7),
	ang = Angle(0, 180, 104.58),
	scale = 0.8
},{
	pos = Vector(0,-113.195, 46),
	ang = Angle(0, 0, 91)
})
prp("vauxagilatdm",{
	pos = Vector(0, 89.47, 24.7),
	ang = Angle(0, 180, 85),
	scale = 0.85
},{
	pos = Vector(0, -86.6, 26.5),
	ang = Angle(0, 0, 78)
})
prp("vauxastra12tdm",{
	pos = Vector(0, 108, 17.5),
	ang = Angle(0, 180, 93)
},{
	pos = Vector(0, -102.35, 28.5),
	ang = Angle(0, 0, 78.4),
	scale = 0.85
})
prp("vauxcorsatdm",{
	pos = Vector(0, 92.7, 20.5),
	ang = Angle(0, 180, 98),
	scale = 0.95
},{
	pos = Vector(0, -91.485, 27.5),
	ang = Angle(0, 0, 65),
	scale = 0.85
})
prp("vauxinsigniatdm",{
	pos = Vector(0, 115.195, 24.8),
	ang = angForward,
	scale = 0.75
},{
	pos = Vector(0, -115.85, 32),
	ang = Angle(0, 0, 74.5)
})
prp("beetle68tdm",{
	pos = Vector(0, 94.38, 20.6),
	ang = Angle(0, 180, 92.8)
},{
	pos = Vector(0, -91.735, 29),
	ang = Angle(0, 0, 56.2),
	scale = 0.87
})
prp("vwcampertdm",{
	pos = Vector(0, 114.2, 25),
	ang = Angle(0, 180, 90),
	scale = 1.3
},{
	pos = Vector(0, -99.71, 36),
	ang = Angle(0, 0, 81.9)
})
prp("vwgolfgti14tdm",{
	pos = Vector(0, 103.17, 22.25),
	ang = Angle(0, 180, 90),
	scale = 0.7
},{
	pos = Vector(0, -100.9, 22),
	ang = Angle(0, 0, 80),
	scale = 0.9
})
prp("golfmk2tdm",{
	pos = Vector(18, 106.7, 9.7),
	ang = Angle(0, 180, 90),
	scale = 0.7
},{
	pos = Vector(18, -80.5, 29),
	ang = Angle(0, 0, 71.5)
})
prp("vw_golfr32tdm",{
	pos = Vector(0, 96.961, 24.1),
	ang = Angle(0, 180, 90),
	scale = 0.78
},{
	pos = Vector(0, -96.55, 24),
	ang = Angle(0, 0, 75)
})
prp("golfvr6tdm",{
	pos = Vector(0, 100.44, 19.9),
	ang = angForward,
	scale = 0.84
},{
	pos = Vector(0, -89.1, 37.5),
	ang = Angle(0, 0, 77.5)
})
prp("vwbeetleconvtdm",{
	pos = Vector(0, 103.685, 22),
	ang = Angle(0, 180, 83)
},{
	pos = Vector(0, -96.1, 23.3),
	ang = Angle(0, 0, 70.2)
})
prp("vwsciroccortdm",{
	pos = Vector(0, 98.4, 17.8),
	ang = Angle(0, 180, 88.5),
	scale = 0.85
},{
	pos = Vector(0, -96.655, 27),
	ang = Angle(0, 0, 75)
})
prp("st1tdm",{
	pos = Vector(0, 111.185, 15),
	ang = Angle(0, 180, 87.31)
},{
	pos = Vector(0,-113.32, 22.5),
	ang = Angle(0, 0, 76.5)
})
prp("toyfjtdm",{
	pos = Vector(0, 112, 35),
	ang = angForward + Angle(0, 0, 4),
	scale = 1.2
},{
	pos = Vector(24, -96.28, 42.9),
	ang = Angle(0, 4, 85),
	scale = 0.8
})
prp("mr2gttdm",{
	pos = Vector(0, 98, 15.4),
	ang = angForward
},{
	pos = Vector(0, -97.1, 22.3),
	ang = angBackward - Angle(0, 0, 4),
	scale = 0.8
})
prp("priustdm",{
	pos = Vector(0, 105.7, 24.7),
	ang = angForward - Angle(0, 0, 10),
	scale = 0.85
},{
	pos = Vector(0, -98.95, 39),
	ang = angBackward - Angle(0, 0, 14.5)
})
prp("toyrav4tdm",{
	pos = Vector(0, 104.1, 31.5),
	ang = angForward
},{
	pos = Vector(-22, -94.15, 33),
	ang = Angle(0, -1.2, 93)
})
prp("supratdm",{
	pos = Vector(0, 103.85, 18.15),
	ang = angForward,
	scale = 0.73
},{
	pos = Vector(0, -104.7, 29.5),
	ang = angBackward
})
prp("toytundratdm",{
	pos = Vector(0, 142.6, 35),
	ang = Angle(0, 180, 104.58)
},{
	pos = Vector(0,-136.65, 41.3),
	ang = Angle(0, 0, 95.8),
	scale = 0.9
})

-- McLaren / Mercedes-McLaren / Mercedes-Benz
prp("mclarenf1tdm", {
	pos = Vector( 0.06, 104.62, 14.5 ),
	ang = angForward
},{
	pos = Vector( -0.13, -105.5, 20.18 ),
	ang = angBackward + Angle(0, 0, -5)
})

prp("mp412cgt3tdm", {
	pos = Vector( 0.03, -107, 25 ),
	ang = angBackward + Angle(0, 0, -5)
})

prp("p1tdm", {
	pos = Vector( 0, 115.21, 15 ),
	ang = angForward + Angle( 0, 0, 4)
},{
	pos = Vector( 0.03, -102.5, 18.75 ),
	ang = angBackward + Angle(0, 0, 5.25)
})

prp("mer_slrtdm", {
	pos = Vector( -0.25, -108.72, 40.34 ),
	ang = angBackward + Angle(0, 0, -5)
})

prp("mer300seltdm", {
	pos = Vector( -0.07, 120.25, 15 ),
	ang = angForward
},{
	pos = Vector( -0.1, -119.25, 28 ),
	ang = angBackward
})

prp("mer300slgulltdm", {
	pos = Vector( -0.16, 110, 10.75 ),
	ang = angForward,
	condition = function(veh)
		local bg = veh:GetBodygroup(2)
		if bg == 1 then return {pos = Vector( -0.16, 108.5, 8.5 ), ang = angForward + Angle( 0, 0, -59)} end
	end
},{
	pos = Vector( 0, -111, 17.5 ),
	ang = angBackward + Angle(0, 0, -5)
})

prp("c32amgtdm", {
	pos = Vector( -0.47, 112.75, 23.31 ),
	ang = angForward
},{
	pos = Vector( 0, -109.47, 39.71 ),
	ang = angBackward + Angle(0, 0, -5)
})

prp("mere63tdm", {
	pos = Vector( -0.1, 118, 20 ),
	ang = angForward
},{
	pos = Vector( 0.21, -112.75, 39.5 ),
	ang = angBackward + Angle(0, 0, -12)
})

prp("merml63tdm", {
	pos = Vector( -0.04, 115.75, 21 ),
	ang = angForward,
	condition = function(veh)
		local bg = veh:GetBodygroup(1)
		if bg == 0 then return {pos = Vector( -0.04, 117, 22 ), ang = angForward + Angle( 0, 0, -5)} end
	end
},{
	pos = Vector( 0.68, -109, 45.5 ),
	ang = angBackward + Angle(0, 0, -10)
})

prp("sl65amgtdm", {
	pos = Vector( -0.13, 113.75, 18.5 ),
	ang = angForward
},{
	pos = Vector( -0.41, -99, 33.5 ),
	ang = angBackward + Angle(0, 0, -17)
})

prp("slsamgtdm", {
	pos = Vector( 0, 114.8, 16 ),
	ang = angForward
},{
	pos = Vector( -0.5, -112, 24.25 ),
	ang = angBackward + Angle(0, 0, 0)
})

-- Mini
prp("cooper65tdm", {
	pos = Vector( 0, 79, 15 ),
	ang = angForward
},{
	pos = Vector( -0.5, -76, 30.62 ),
	ang = angBackward + Angle(0, 0, -5)
})
prp("clubmantdm", {
	pos = Vector( 0, 92.5, 19 ),
	ang = angForward
},{
	pos = Vector( -0.5, -90.75, 20 ),
	ang = angBackward + Angle(0, 0, -10)
})
prp("coopercoupetdm", {
	pos = Vector( 0, 88, 19 ),
	ang = angForward
},{
	pos = Vector( -0.5, -78, 36 ),
	ang = angBackward + Angle(0, 0, -9)
})
prp("coopers11tdm", {
	pos = Vector( 0, 88.5, 19 ),
	ang = angForward
},{
	pos = Vector( -0.5, -81.5, 37.5 ),
	ang = angBackward + Angle(0, 0, -15)
})
prp("cooper4x4tdm", {
	pos = Vector( 0, 76.25, 44 ),
	ang = angForward
},{
	pos = Vector( -0.5, -79, 58 ),
	ang = angBackward + Angle(0, 0, -9)
})

-- Mitsu
prp("colttdm", {
	pos = Vector( 0, 103, 25.46 ),
	ang = angForward
},{
	pos = Vector( -0.5, -91.5, 28 ),
	ang = angBackward + Angle(0, 0, -5)
})
prp("mit_eclipsegsxtdm", {
	pos = Vector( 0, 102.5, 22 ),
	ang = angForward,
	condition = function(veh)
		local bg = veh:GetBodygroup(3)
		if bg == 2 or bg == 3 then return {pos = Vector( 0, 103, 22 )} end
		if bg == 4 then return {pos = Vector( 0, 104.5, 22 )} end
		if bg == 5 then return {pos = Vector( 0, 105.75, 23.5 )} end
	end
},{
	pos = Vector( -0.5, -99.5, 29 ),
	ang = angBackward + Angle(0, 0, -5),
	condition = function(veh)
		local bg = veh:GetBodygroup(4)
		if bg == 1 then return {pos = Vector( -0.5, -100, 28.5 ), ang = angBackward + Angle( 0, 0, -10)} end
		if bg == 2 then return {pos = Vector( -0.5, -101, 29.5 ), ang = angBackward + Angle( 0, 0, -15)} end
		if bg == 3 then return {pos = Vector( -0.5, -103.5, 20 ), ang = angBackward + Angle( 0, 0, -5)} end
		if bg == 5 then return {pos = Vector( -0.5, -102, 29 ), ang = angBackward + Angle( 0, 0, -12)} end
	end
})
prp("mitsu_eclipgttdm", {
	pos = Vector( 0, 109, 21 ),
	ang = angForward,
	condition = function(veh)
		local bg = veh:GetBodygroup(3)
		if bg == 0 then return {pos = Vector( 0, 110, 19 )} end
		if bg == 2 then return {pos = Vector( 0, 109.5, 21 )} end
	end
},{
	pos = Vector( -0.5, -103, 29.75 ),
	ang = angBackward + Angle(0, 0, -5),
	condition = function(veh)
		local bg = veh:GetBodygroup(5)
		if bg == 1 then return {pos = Vector( -0.5, -103, 29 )} end
	end
})
prp("mitsu_evo8tdm", {
	pos = Vector( 0, 104.5, 16.75 ),
	ang = angForward,
	condition = function(veh)
		local bg = veh:GetBodygroup(3)
		if bg == 0 then return {pos = Vector( 0, 105.25, 20 )} end
		if bg == 3 then return {pos = Vector( 0, 103, 19 )} end
		if bg == 4 then return {pos = Vector( 0, 103, 16 )} end
	end
},{
	pos = Vector( -0.5, -103, 21 ),
	ang = angBackward + Angle(0, 0, -5),
	condition = function(veh)
		local bg = veh:GetBodygroup(4)
		if bg == 1 then return {pos = Vector( -0.5, -103, 20 )} end
		if bg == 2 then return {ang = angBackward + Angle(0, 0, -13)} end
		if bg == 4 then return {pos = Vector( -0.5, -104, 21 ), ang = angBackward + Angle(0, 0, -25)} end
	end
})
prp("mitsu_evoxtdm", {
	pos = Vector( 0, 109, 28.5 ),
	ang = angForward
},{
	pos = Vector( -0.5, -109, 30.62 ),
	ang = angBackward + Angle(0, 0, -5),
	condition = function(veh)
		local bg = veh:GetBodygroup(4)
		if bg == 1 then return {pos = Vector( -0.5, -107, 27.5 ), ang = angBackward} end
	end
})

-- Lambo
prp("diablotdm", {
	pos = Vector( -0.22, 112, 16.68 ),
	ang = angForward,
},{
	pos = Vector( 1.31, -109, 38.34 ),
	ang = angBackward,
})
prp("gallardotdm", {
	pos = Vector( 0.21, 106, 20.12 ),
	ang = angForward,
},{
	pos = Vector( 0.4, -104.04, 32.31 ),
	ang = angBackward,
})
prp("gallardospydtdm", {
	pos = Vector( 0.06, 105.53, 15.81 ),
	ang = angForward,
},{
	pos = Vector( -0.6, -107.04, 34.18 ),
	ang = angBackward,
})
prp("miuracontdm", {
	pos = Vector( 0.03, 109.46, 20.78 ),
	ang = angForward,
},{
	pos = Vector( -0.6, -107.04, 34.18 ),
	ang = angBackward,
})
prp("miurap400tdm", {
	pos = Vector( 0.03, 106.46, 20.78 ),
	ang = angForward,
},{
	pos = Vector( -0.6, -106.5, 30.18 ),
	ang = angBackward,
})
prp("murcielagotdm", {
	pos = Vector( 0.71, 110.28, 15.96 ),
	ang = angForward,
},{
	pos = Vector( -0.54, -107.6, 30.93 ),
	ang = angBackward + Angle(0, 0, -15),
})
prp("murcielagosvtdm", {
	pos = Vector( 0.71, 116.28, 15.96 ),
	ang = angForward,
},{
	pos = Vector( -0.54, -107.9, 30.4 ),
	ang = angBackward + Angle(0, 0, -15),
})
prp("reventonrtdm", {
	pos = Vector( 0, 121.28, 15.96 ),
	ang = angForward,
},{
	pos = Vector( -0.32, -116.32, 33.2 ),
	ang = angBackward + Angle(0, 0, -15),
})

--Land Rover
prp("lrdefendertdm",{
	pos = Vector(0, 94.2, 42.2),
	ang = Angle(0, 180, 83),
	scale = 0.95
},{
	pos = Vector(-14,-92.1, 56),
	ang = Angle(0, 0, 90)
})
prp("landrovertdm",{
	pos = Vector(0, 117.8, 28),
	ang = Angle(0, 180, 95)
},{
	pos = Vector(0,-116.2, 48),
	ang = Angle(0, 0, 87.4)
})
prp("landrover12tdm",{
	pos = Vector(0, 122.6, 28.8),
	ang = Angle(0, 180, 95)
},{
	pos = Vector(0,-116.75, 50),
	ang = Angle(0, 0, 87.4)
})

-- Masterati
prp("mas_ghiblitdm",{
	pos = Vector( -30.44, 109.71, 18.62 ),
	ang = Angle(0, 220, 87.4)
},{
	pos = Vector( 0.03, -119.5, 40.56 ),
	ang = Angle(0, 0, 87.4)
})
prp("mas_quattrotdm",{
	pos = Vector( -34.5, 116.6, 24.62 ),
	ang = Angle(0, 210, 87.4)
},{
	pos = Vector( 0.03, -121.5, 40.56 ),
	ang = Angle(0, 0, 87.4)
})

-- Masda
prp("furaitdm",{
	pos = Vector( -34.5, 103.6, 5 ),
	ang = Angle(0, 200, 0)
},{
	pos = Vector( 23.37, -102, 25.5 ),
	ang = Angle(0, 0, 82.4)
})
prp("mx5tdm",{
	pos = Vector( -0.29, 97.5, 18.9 ),
	ang = Angle(0, 180, 87.4)
},{
	pos = Vector( 0, -91.32, 34.06 ),
	ang = Angle(0, 0, 82.4)
})
prp("rx7tdm",{
	pos = Vector( -0.29, 102.5, 16.9 ),
	ang = Angle(0, 180, 87.4)
},{
	pos = Vector( -0.19, -102.1, 22.03 ),
	ang = Angle(0, 0, 82.4)
})
prp("rx8tdm",{
	pos = Vector( -0.41, 105.84, 18.06 ),
	ang = Angle(0, 180, 87.4)
},{
	pos = Vector( 0.62, -105.85, 28.46 ),
	ang = Angle(0, 0, 82.4)
})
prp("speed3tdm",{
	pos = Vector( -0.41, 109.84, 18.06 ),
	ang = Angle(0, 180, 87.4)
},{
	pos = Vector( 0.62, -107.85, 22.46 ),
	ang = Angle(0, 0, 82.4)
})

-- Morgan
prp("morgaerosstdm", {
	pos = Vector( 0.28, 92.2, 19 ),
	ang = angForward
},{
	pos = Vector( -0.41, -100, 23.43 ),
	ang = angBackward
})

-- Nissan
prp("350ztdm", {
	pos = Vector( -0.25, 104, 21.96 ),
	ang = angForward,
	condition = function(veh)
		local bg = veh:GetBodygroup(2)
		if bg == 1 then return {pos = Vector( -0.25, 105, 21.96 )} end
		if bg == 2 then return {pos = Vector( -0.25, 106, 21 )} end
	end
},{
	pos = Vector( -0.41, -103, 30.5 ),
	ang = angBackward + Angle(0, 0, -10),
	condition = function(veh)
		local bg = veh:GetBodygroup(3)
		if bg == 0 then return {pos = Vector( -0.41, -103, 27.5 )} end
	end
})

prp("370ztdm", {
	pos = Vector( -0.25, 105, 21.96 ),
	ang = angForward,
	condition = function(veh)
		local bg = veh:GetBodygroup(3)
		if bg == 2 then return {pos = Vector( -0.25, 109.5, 19 )} end
	end
},{
	pos = Vector( -0.41, -100.5, 28.5 ),
	ang = angBackward + Angle(0, 0, -9),
	--[[condition = function(veh)
		local bg = veh:GetBodygroup(3)
		if bg == 0 then return {pos = Vector( -0.41, -103, 27.5 )} end
	end]]--
})

prp("gtrtdm", {
	pos = Vector( 0, 111.5, 22 ),
	ang = angForward,
},{
	pos = Vector( 0, -110, 30.5 ),
	ang = angBackward + Angle(0, 0, -10),
})
prp("nis_leaftdm", {Vector( 0, 110.5, 21.15 )}, {pos = Vector( 0.06, -102, 22.5 ), ang = angBackward + Angle( 0, 0, -5)})
prp("nissilvs15tdm", {
	pos = Vector( 0.4, 106, 21.65 ),
	condition = function(veh)
		local bg = veh:GetBodygroup(3)
		if bg == 3 then return {pos = Vector( 0.4, 106.4, 17.5 )} end
	end
},{
	pos = Vector( -0.13, -104.91, 20.81 )
})

prp("r34tdm", {
	pos = Vector( 0, 108.5, 20.5 ),
	condition = function(veh)
		local bg = veh:GetBodygroup(3)
		if bg == 2 then return {pos = Vector( 0, 111.75, 20.5 )} end
		if bg == 3 then return {pos = Vector( 0, 114.1, 20.5 )} end
		if bg == 4 then return {pos = Vector( 0, 109.5, 20.5 )} end
	end
},{
	pos = Vector( 0, -107, 24 ),
	condition = function(veh)
		local bg = veh:GetBodygroup(4)
		if bg == 3 then return {ang = angBackward + Angle( 0, 0, -5 )} end
	end
})

-- Noble
prp("noblem600tdm", {Vector( 0.84, 107.5, 13 )}, {Vector( 0.31, -98.75, 25 ), angBackward + Angle( 0, 0, -15), scale = 0.8})

-- Pagani
prp("zondagrtdm", {Vector(0, 107, 11)}, {Vector( -15.63, -105.5, 24.62 ), angBackward + Angle(0, 0, -5)})
prp("c12tdm", {Vector(0, 102.5, 11)}, {Vector(14.5, -101, 27), angBackward + Angle(0, 0, -10)})

-- Pontiac
prp("pon_fierogttdm", {Vector( 0.46, 101, 20.28 )}, {Vector( -0.25, -96.32, 18.31 )})
prp("pon_firebirdtransamtdm", {Vector( 0.46, 124, 21.5 ), scale = 0.8}, {Vector( -0.25, -112, 34 ), angBackward + Angle(0, 0, -9)})

-- Porsche
prp("porgt3rsrtdm", {Vector(0.06, 110, 17)}, {Vector(0, -107.5, 18.5), angBackward + Angle(0, 0 -5), scale = 0.7})
prp("918spydtdm", {Vector(0.06, 114, 18.4)}, {Vector(0, -111.8, 29.5), angBackward + Angle(0, 0, -7)})
prp("997gt3tdm", {Vector(0.06, 106, 22)}, {Vector(0, -102, 26.5)})
prp("carreragttdm", {Vector(0.06, 110, 18)}, {Vector(0, -106.5, 23)})
prp("cayenne12tdm", {Vector(0.06, 119, 23)}, {Vector(0, -115, 45)})
prp("cayennetdm", {Vector(0.06, 113, 22)}, {Vector(0, -112, 41)})

prp("scionfrstdm", {Vector(0.62, 104.62, 23.5)}, {Vector( -0.66, -100, 40.2 ), angBackward + Angle(0, 0, -7)})
prp("sciontctdm", {Vector(0.62, 105.5, 20.5)}, {Vector( -0.66, -100, 36 ), angBackward + Angle(0, 0, -7)})
prp("scionxdtdm", {Vector( -0.29, 89.28, 24.31 )}, {Vector( 4.59, -89.32, 37.06 ), angBackward + Angle(0, 0, -7)})

-- Saleen
prp("sal_s281_00tdm", {Vector(0.06, 109, 31)}, {Vector(0, -102, 47.5), angBackward + Angle( 0, 0, -10)})
prp("sal_s281e_06tdm", {Vector(0.06, 114, 24), angForward + Angle(0, 0, 5)}, {Vector(0, -107.5, 43.5), angBackward + Angle( 0, 0, -12)})
prp("sal_s331_supercabtdm", {Vector(0.06, 141.5, 30)}, {Vector(0, -139, 25.5)})

-- Shelby
prp("she1000tdm", {Vector(0, 116, 30)}, {Vector(0, -113.5, 36)})

-- SRT
prp("vipvipertdm", {Vector(0, 108, 18)}, {Vector(0, -106, 36)})

-- Suburu
prp("subimpreza08tdm", {Vector(0, 106, 18)}, {Vector(0, -101.5, 39)})
prp("subimpreza05tdm", {Vector(0, 106, 19)}, {Vector(0, -105, 23.5)})
prp("subleggt10tdm", {Vector(0, 114, 17)}, {Vector(0, -109.4, 37.7), angBackward + Angle(0, 0, -10)})
prp("sublegrs90tdm", {Vector(0, -108, 22.5), angBackward + Angle(0, 0, -14)})

-- Tesla
prp("tesmodelstdm", {Vector(0, -122, 38.5), angBackward + Angle(0, 0, -14)})



--[[ Talon ]]--
prp("f150tal1981", {
	pos = Vector( 0, 118.5, 30.5 ),
	ang = angForward + Angle(0, 0, 5),
},{
	pos = Vector( -0.2, -142.3, 29.2 ),
	ang = angBackward,
})
prp("tal86silverado_2500", {
	pos = Vector(0, 129.5, 25),
	ang = angForward + Angle(0, 0, 18),
},{
	pos = Vector(-0.2, -128.5, 28),
	ang = angBackward,
	scale = 0.85
})
prp("tal86silverado_2500cc", {
	pos = Vector(0, 129.5, 25),
	ang = angForward + Angle(0, 0, 18),
},{
	pos = Vector(-0.2, -169, 28),
	ang = angBackward,
	scale = 0.85
})
prp("tal86silverado", "tal86silverado_2500cc")
prp("tal86suburban353", {
	pos = Vector(0, 102, 26.5),
	ang = angForward + Angle(0, 0, 18),
},{
	pos = Vector(-0.2, -144.5, 26),
	ang = angBackward,
	scale = 0.85
})
prp("tal86suburban379", "tal86suburban353")
prp("tal86suburban440", "tal86suburban353")
prp("tal86suburban454", "tal86suburban353")
prp("talblazer", {
	pos = Vector(0, 129.2, 25.5),
	ang = angForward + Angle(0, 0, 18),
},{
	pos = Vector(0, -95, 26),
	ang = angBackward,
	scale = 0.85
})
prp("tal89suburban", {
	pos = Vector(-1.3, 123.9, 30),
	ang = angForward + Angle(0, 0, 18),
},{
	pos = Vector( -1.79, -125, 29.5 ),
	ang = angBackward,
	scale = 0.85
})
prp("talsilveradotc", {
	pos = Vector(0, 153, 27.8),
	ang = angForward,
},{
	pos = Vector( 0, -135.6, 27 ),
	ang = angBackward,
	scale = 0.85
})
prp("silverado2500hdtal", {
	pos = Vector(0, 160, 27.8),
	ang = angForward,
},{
	pos = Vector( -1, -128, 25.3 ),
	ang = angBackward,
	scale = 0.75
})
prp("silverado2500hdtal_d", "silverado2500hdtal")
prp("talsuburban2015", {
	pos = Vector(0, 140, 30),
	ang = angForward,
},{
	pos = Vector(0, -128, 47),
	ang = angBackward,
	scale = 0.85
})
prp("f150tal", {
	pos = Vector( 1.3, 126.5, 25),
	ang = angForward,
	scale = 0.8
},{
	pos = Vector( 0.7, -139.5, 28.5 ),
	ang = angBackward + Angle(0, 0, 6),
	scale = 0.75
})
prp("f150poltal", "f150tal")
prp("taltigr", {
	pos = Vector( -18.35, -103.69, 55.68 ),
	ang = angBackward
})
prp("h2talstock", {
	pos = Vector( 0.2, 124, 32 ),
	ang = angForward + Angle(0, 0, -3),
},{
	pos = Vector( 0, -94, 51 ),
	ang = angBackward,
})
prp("h2talambu", {
	pos = Vector(12, -117, 28.4),
	ang = angBackward,
	scale = 0.8,
	condition = function(v)
		local bg = v:GetBodygroup(14)
		if bg == 1 then return false end
	end
})
prp("talh3", {
	pos = Vector( 0.2, 89, 30.5),
	ang = angForward + Angle(0, 0, 40),
},{
	pos = Vector( 0, -94, 51 ),
	ang = angBackward,
})
prp("talh3alpha", "talh3")
prp("talhumhxv6", {
	pos = Vector( -1.8, 85.5, 41.75 ),
	ang = angForward + Angle(0, 0, 5),
	scale = 0.9
},{
	pos = Vector( -2, -123.7, 64),
	ang = angBackward,
	condition = function(v)
		local bg = v:GetBodygroup(7)
		if bg == 1 then return {pos = Vector(-2, -107, 64)} end
	end
})
prp("talhumhxv8", "talhumhxv6")
prp("tallm002", {
	pos = Vector(0, 108, 31.4),
	ang = angForward + Angle(0, 0, 5),
	scale = 0.9
},{
	pos = Vector( -33, -111.8, 60),
	ang = angBackward + Angle(0, 0, -10),
	scale = 0.8
})
prp("humveetal733", {
	pos = Vector( -0.38, 105, 46 ),
	ang = angForward,
},{
	pos = Vector( 0, -105, 50.71 ),
	ang = angBackward
})
prp("humveetal733c3", {
	pos = Vector( -0.94, -110.66, 52.96 ),
	ang = angBackward,
	condition = function(v)
		local bg = v:GetBodygroup(7)
		if bg == 1 then return false end
		if bg == 2 then return false end
	end
})
prp("mrapcougartal733", {
	pos = Vector( 42.5, -115, 40 ),
	ang = angBackward,
	scale = 0.8
})
prp("maxxprotal", {
	pos = Vector( -2.5, -111, 57 ),
	ang = angBackward,
})
prp("matvtal733", {
	pos = Vector( 34.5, -115, 97 ),
	ang = angBackward
})
prp("talspm3", {
	pos = Vector(13.59, -80, 62.09),
	ang = angBackward,
	condition = function(v)
		local bg = v:GetBodygroup(3)
		if bg == 0 then return {ang = Angle(0, 90, 90), pos = Vector(30, -95, 62)} end
	end
})




--[[ iSchmall ]]--
PLATE:RegisterPlate("2016 Ford Police Interceptor Utility", {
	pos = Vector( 0, 115.5, 28 ),
	ang = angForward
},{
	pos = Vector( 0, -112, 49 ),
	ang = angBackward + Angle(0, 0, -12)
})

--[[ Added by NASA (from RPNetwork) - https://steamcommunity.com/profiles/76561198090616453/ ]]--
PLATE:RegisterPlate("perryn_ford_f550_ambulance", {
	pos = Vector( 0.31, 148.96, 21.65 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( 0.21, -141.35, 23.06 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("perryn_lenco_bearcat", {
	pos = Vector( -0.32, 137.81, 33 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( -35.32, -141.07, 38.75 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("smc_mustang_gp_15", {
	pos = Vector( -0.19, 112.12, 17.65 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( -0.32, -121.1, 29.09 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("17raptor_cop_sgm", {
	pos = Vector( 0.03, 130.81, 29.59 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( 0.09, -118.63, 35.31 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("perryn_american_laddertruck", {
	pos = Vector( -0.38, 324, 42.84 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( 0.11, -367, 53.9 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("perryn_pierce_arrow_xt", {
	pos = Vector( 0.28, 178.81, 21.65 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( 1.03, -242.94, 14.37 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("perryn_cadillac_dts_limousine", {
	pos = Vector( -0.04, 154.96, 22.96 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( 0.03, -147.22, 26.25 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("crsk_tesla_model_x_2015", {
	pos = Vector( -0.38, 100.53, 18.87 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( -0.44, -146.94, 44.4 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("demon_sgm", {
	pos = Vector( -0.25, 121.87, 16.09 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( 0.21, -123.16, 25.78 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("perryn_2010_ford_taurus_freelancer", {
	pos = Vector( 0.12, 116, 19.71 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( -0.07, -131.72, 24.25 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("perryn_rescue_truck", {
	pos = Vector( -0.16, 163.03, 25.9 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( 0.59, -210.91, 32.28 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("rv", {
	pos = Vector( -0.63, 169.59, 18.81 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( 30.96, -160.07, 18.84 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("bus", {
	pos = Vector( -0.72, 172.09, 28.28 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( -0.16, -233.44, 33 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("models_sgm", {
	pos = Vector( -0.19, 117.96, 14.65 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( 0.09, -122.16, 36 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("hot_twinmill_lw", {
	pos = Vector( 12.25, 119.84, 19.21 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( -0.16, -91.47, 25.71 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("bmw_m5e39_lw", {
	pos = Vector( -0.66, 119, 21.18 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( 0.28, -115.22, 36.65 ),
	ang = angBackward,
	scale = 1,
})
PLATE:RegisterPlate("bmw_m3_e30_lw", { -- Edited (fixed pos)
	pos = Vector( -0.13, 105.81, 20.43 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( -0.22, -106.88, 30.46 ),
	ang = angBackward,
	scale = 1,
})

PLATE:RegisterPlate("crsk_rolls-royce_phantom_viii_2018", {
	pos = Vector( 0.21, 85.59, 19.68 ),
	ang = angForward,
	scale = 1,
},{
	pos = Vector( -0.1, -149.91, 37.71 ),
	ang = angBackward + Angle(0, 0, -10),
	scale = 1,
})


--[[
	CrSk Autos
	Plates positioned by Zambie ^‿^
	https://steamcommunity.com/id/zambiefarmery10
]]--

-- Dodge Challenger Hellcat 2015
PLATE:RegisterPlate("crsk_dodge_challenger_hellcat_2015", {
	pos = Vector(0, 125.7, 26.5),
	ang = Angle(0, 180, 98),
},{
	pos = Vector(0, -123.2, 29.3),
	ang = angBackward - Angle(0,0,8),
	scale = 0.8
})
-- Alfa Romeo 8C Spider 2008
PLATE:RegisterPlate("crsk_alfaromeo_8cspider", {
	pos = Vector(0, -105.8, 35.1),
	ang = angBackward - Angle(0,0,13),
	scale = 0.92
})
-- Alfa Romeo Alfasud Sprint 1972
PLATE:RegisterPlate("crsk_alfaromeo_alfasud", {
	pos = Vector(0, -101.6, 37.1),
	ang = angBackward - Angle(0,0,-12),
	scale = 0.92
})
-- Alfa Romeo Giulia Quadrifoglio 2017
PLATE:RegisterPlate("crsk_alfa_giulia_quadrifoglio_2017", {
	pos = Vector(-18.5, 99.9, 21.5),
	ang = Angle(0, 192, 90),
	scale = 0.86
},{
	pos = Vector(0, -116.2, 35.3),
	ang = angBackward - Angle(0,0,8)
})
-- Alfa Romeo Montreal 1970
PLATE:RegisterPlate("crsk_alfaromeo_montreal", {
	pos = Vector(0, -102.4, 31.9),
	ang = angBackward - Angle(0,0,4)
})
-- Alpina B10 E34 Bi-turbo 1989
PLATE:RegisterPlate("crsk_alpina_b10", {
	pos = Vector(0, 108.5, 22.3),
	ang = Angle(0, 180, 95),
	scale = 0.82
},{
	pos = Vector(0, -114.9, 36.3),
	ang = angBackward - Angle(0,0,8),
	scale = 0.8
})
-- Aston Martin DB11 2017
PLATE:RegisterPlate("crsk_aston_db11_2017", {
	pos = Vector(0, 120.8, 13.5),
	ang = Angle(0, 180, 90),
	scale = 0.86
},{
	pos = Vector(0, -109.2, 20.7),
	ang = angBackward - Angle(0,0,8)
})
-- Aston Martin Vantage V600 1998
PLATE:RegisterPlate("crsk_aston_vantagev600_1998", {
	pos = Vector(0, 103.2, 22.9),
	ang = Angle(0, 180, 82),
	scale = 0.7
},{
	pos = Vector(0, -126.1, 41.3),
	ang = angBackward - Angle(0,0,14.5),
	scale = 0.96
})
-- Audi A4 Quattro 2016
PLATE:RegisterPlate("crsk_audi_a4_quattro_2016", {
	pos = Vector(0, 109.3, 22.9),
	ang = Angle(0, 180, 82),
},{
	pos = Vector(0, -109.9, 37.8),
	ang = angBackward - Angle(0,0,14.5),
	scale = 0.96
})
-- Audi RS6 Avant Quattro 2016
PLATE:RegisterPlate("crsk_audi_rs6_avant_2016", {
	pos = Vector(0, 111.2, 25.5),
	ang = Angle(0, 180, 84),
},{
	pos = Vector(0, -121.8, 36.9),
	ang = angBackward - Angle(0,0,8)
})
-- Audi S5 2017
PLATE:RegisterPlate("crsk_audi_s5_2017", {
	pos = Vector(0, 107.2, 20.6),
	ang = Angle(0, 180, 88),
},{
	pos = Vector(0, -104.7, 36.9),
	ang = angBackward - Angle(0,0,17.9)
})
-- BMW M135i F21 2012
PLATE:RegisterPlate("crsk_bmw_m135i_f21_2012", {
	pos = Vector(0, 96.4, 21.3),
	ang = Angle(0, 180, 88),
	scale = 0.88
},{
	pos = Vector(0, -108.3, 19.4),
	ang = angBackward - Angle(0,0,9.2),
	scale = 0.96
})
-- BMW 750Li F02 2009
PLATE:RegisterPlate("crsk_bmw_750li_f02_2009", {
	pos = Vector(0, 123.4, 21.3),
	ang = Angle(0, 180, 88),
	scale = 0.88
},{
	pos = Vector(0, -120.2, 36.9),
	ang = angBackward - Angle(0,0,7.2),
	scale = 0.96
})
-- BMW 7er 750i G11 2015
PLATE:RegisterPlate("crsk_bmw_7er_g11_2015", {
	pos = Vector(0, 125.4, 23.7),
	ang = Angle(0, 180, 88),
},{
	pos = Vector(0, -120.3, 40.1),
	ang = angBackward - Angle(0,0,12.2),
	scale = 0.96
})
-- BMW i8 2015
PLATE:RegisterPlate("crsk_bmw_i8", {
	pos = Vector(0, 108.5, 20.7),
	ang = Angle(0, 180, 88),
	scale = 0.87
},{
	pos = Vector(0, -126.4, 25.6),
	ang = angBackward - Angle(0,0,29),
	scale = 0.80
})
-- BMW X6M F86 2015
PLATE:RegisterPlate("crsk_bmw_x6m_f86_2015", {
	pos = Vector(0, 131.2, 26.7),
	ang = Angle(0, 180, 88),
},{
	pos = Vector(0, -112.4, 50.6),
	ang = angBackward - Angle(0,0,10),
	scale = 1.2
})
-- BMW Z4 E89 sDrive28i 2012
PLATE:RegisterPlate("crsk_bmw_z4e89", {
	pos = Vector(0, 97.2, 19.2),
	ang = Angle(0, 180, 99),
},{
	pos = Vector(0, -100.5, 18.7),
	ang = angBackward - Angle(0,0,10)
})
-- Buffalo
PLATE:RegisterPlate("crsk_gtasa_buffalo", {
	pos = Vector(0, 117.3, 31.2),
	ang = Angle(0, 180, 78),
},{
	pos = Vector(0, -105.9, 37.7),
	ang = angBackward - Angle(0,0,13),
	scale = 0.89
})
-- Cadillac CTS-V 2016
PLATE:RegisterPlate("crsk_cadillac_cts-v_2016", {
	pos = Vector(0, -119.4, 36.6),
	ang = angBackward - Angle(0,0,10)
})
-- Cadillac Fleetwood Brougham d'Elegance 1985
PLATE:RegisterPlate("crsk_cadillac_fleetwoodbrougham_1985", {
	pos = Vector(0, 112.6, 20),
	ang = angForward,
},{
	pos = Vector(0, -155, 37.7),
	ang = angBackward - Angle(0,0,7)
})
-- Chevrolet Caprice 1993
PLATE:RegisterPlate("crsk_chevrolet_caprice_1993", {
	pos = Vector(0, -134.2, 32.3),
	ang = angBackward - Angle(0,0,-4)
})
-- Chevrolet Corvette C1 1957
PLATE:RegisterPlate("crsk_chevrolet_corvette_c1_1957", {
	pos = Vector(0, 98.2, 15.3),
	ang = angForward - Angle(0,0,-4),
	scale = 1.5
})
-- Devel Sixteen 2015
PLATE:RegisterPlate("crsk_devel_sixteen", {
	pos = Vector(0, -136.2, 11.3),
	ang = angBackward - Angle(0,0,0),
	scale = 1.4
})
-- Ferrari 360 Challenge Stradale 2003
PLATE:RegisterPlate("crsk_ferrari_360stradale_2003", {
	pos = Vector(0, 109.7, 15),
	ang = angForward,
	scale = 0.74
},{
	pos = Vector(0, -101.4, 24.7),
	ang = angBackward - Angle(0,0,7)
})
-- Ferrari 812 Superfast 2017
PLATE:RegisterPlate("crsk_ferrari_812superfast_2017", {
	pos = Vector(0, 101.7, 15),
	ang = angForward,
	scale = 0.74
},{
	pos = Vector(0, -119, 26.9),
	ang = angBackward - Angle(0,0,25)
})
-- Fiat 126p & Fiat 126p Low
PLATE:RegisterPlate("crsk_fiat_126p", {
	pos = Vector(0, 71.7, 20),
	ang = angForward,
},{
	pos = Vector(0, -72.5, 24.9),
	ang = angBackward - Angle(0,0,-5)
})
PLATE:RegisterPlate("crsk_fiat_126p_low", "crsk_fiat_126p")
-- Ford Bronco XLT 1982
PLATE:RegisterPlate("crsk_ford_bronco_1982", {
	pos = Vector(0, 100.8, 30.6),
	ang = angForward,
},{
	pos = Vector(0, -116.5, 29.9),
	ang = angBackward - Angle(0,0,0)
})
-- Ford Crown Victoria LTD 1987
PLATE:RegisterPlate("crsk_ford_crownvictoria_1987", {
	pos = Vector(0, 120.8, 19.6),
	ang = angForward,
},{
	pos = Vector(0, -106.5, 32.3),
	ang = angBackward - Angle(0,0,15)
})
-- Ford Falcon GTHO Phase III XY 1971
PLATE:RegisterPlate("crsk_ford_falcon_gtho_xy_1971", {
	pos = Vector(0, 98.5, 19.9),
	ang = angForward - Angle(0,0,-19),
	scale = 0.8
},{
	pos = Vector(0, -122.5, 21.5),
	ang = angBackward - Angle(0,0,-26),
	scale = 0.64
})
-- Ford Focus MKIII 2012
PLATE:RegisterPlate("crsk_ford_focus_mk3_2012", {
	pos = Vector(0, 100.2, 22),
	ang = Angle(0, 180, 88),
},{
	pos = Vector(0, -115.8, 40.6),
	ang = angBackward - Angle(0,0,10),
	scale = 0.9
})
PLATE:RegisterPlate("crsk_ford_focus_mk3_2012_police", "crsk_ford_focus_mk3_2012")
-- Ford Gran Torino Sport 2-Door SportsRoof 1972
PLATE:RegisterPlate("crsk_ford_grantorino_1972", {
	pos = Vector(0, 114.2, 30),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -133.5, 25.6),
	ang = angBackward - Angle(0,0,15),
	scale = 0.9
})
-- Ford LTD LX 1986
PLATE:RegisterPlate("crsk_ford_ltd_lx_1986", {
	pos = Vector(0, 114.2, 21),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -129.5, 32.6),
	ang = angBackward - Angle(0,0,4)
})
-- GAZ 24 Volga
PLATE:RegisterPlate("crsk_gaz_24_volga", {
	pos = Vector(0, 107.2, 26),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -129.9, 33.6),
	ang = angBackward - Angle(0,0,-11.6)
})
PLATE:RegisterPlate("crsk_gaz_24_volga_low", "crsk_gaz_24_volga")
-- GMC Sierra 1500 SLT 2014
PLATE:RegisterPlate("crsk_gmc_sierra_1500slt_2014", {
	pos = Vector(0, 131.4, 21.3),
	ang = Angle(0, 180, 111),
},{
	pos = Vector(0, -142.9, 30.6),
	ang = angBackward - Angle(0,0,0)
})
-- Holden Commodore UTE SS 2012
PLATE:RegisterPlate("crsk_holden_commodore_ute_ss_2012", {
	pos = Vector(0, 109.5, 21),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -133, 34.6),
	ang = angBackward - Angle(0,0,10)
})
-- Honda Accord 2008
PLATE:RegisterPlate("crsk_honda_accord_2008", {
	pos = Vector(0, 116.6, 25),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -113, 43.6),
	ang = angBackward - Angle(0,0,10)
})
-- Honda Integra DC2 Typer 1998
PLATE:RegisterPlate("crsk_honda_integra_dc2_typer_1998", {
	pos = Vector(0, -107.7, 21.9),
	ang = angBackward - Angle(0,0,0),
	scale = 0.9
})
-- Honda NSX 2017
PLATE:RegisterPlate("crsk_honda_nsx_2017", {
	pos = Vector(0, -100, 19.9),
	ang = angBackward - Angle(0,0,0),
	scale = 1.2
})
-- Honda Prelude 1980
PLATE:RegisterPlate("crsk_honda_prelude_1980", {
	pos = Vector(0, -97.2, 34.5),
	ang = angBackward - Angle(0,0,10),
})
-- Honda Prelude 1996
PLATE:RegisterPlate("crsk_honda_prelude_1996", {
	pos = Vector(0, 112.5, 21.5),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -105.6, 24.1),
	ang = angBackward - Angle(0,0,10)
})
-- Jaguar F-Pace S 2016
PLATE:RegisterPlate("crsk_jaguar_fpace_2016", {
	pos = Vector(0, 109.5, 24.5),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -128.6, 45.1),
	ang = angBackward - Angle(0,0,10)
})
-- Grand Jeep Cherokee SRT 2014
PLATE:RegisterPlate("crsk_jeep_grandcherokee_srt_2014", {
	pos = Vector(0, 119.5, 32.5),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -115.6, 48.1),
	ang = angBackward - Angle(0,0,-3)
})
-- Kia Stinger GT 2018
PLATE:RegisterPlate("crsk_kia_stinger_gt_2018", {
	pos = Vector(0, 113.7, 23.3),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -129.1, 36.1),
	ang = angBackward - Angle(0,0,20)
})
-- Lada 2170 Priora 2008
PLATE:RegisterPlate("crsk_lada_2170priora_2008", {
	pos = Vector(0, 106.7, 20.3),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -104.3, 36.1),
	ang = angBackward - Angle(0,0,9)
})
PLATE:RegisterPlate("crsk_lada_2170priora_2008_low", "crsk_lada_2170priora_2008")
-- Lamborghini Centenario
PLATE:RegisterPlate("crsk_lambo_centenario", {
	pos = Vector(0, -115.3, 30.1),
	ang = angBackward - Angle(0,0,9),
	scale = 0.87
})
-- Lamborghini Jalpa 1984
PLATE:RegisterPlate("crsk_lambo_jalpa", {
	pos = Vector(0, -105.3, 18.4),
	ang = angBackward - Angle(0,0,9)
})
-- Land Rover Series IIa Station Wagon
PLATE:RegisterPlate("crsk_landrover_series_IIa_stationwagon", {
	pos = Vector(28, 67.7, 35.3),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(30, -130.5, 36.8),
	ang = angBackward
})
-- Lexus LX570 2016
PLATE:RegisterPlate("crsk_lexus_lx570_2016", {
	pos = Vector(0, -134.5, 40.8),
	ang = angBackward
})
-- Maserati Alfieri Concept (2020)
PLATE:RegisterPlate("crsk_maserati_alfieri_concept", {
	pos = Vector(0, -117.7, 31.8),
	ang = angBackward + Angle(0,0,-14)
})
-- McLaren 720s 2017
PLATE:RegisterPlate("crsk_mclaren_720s_2017", {
	pos = Vector(0, -100.7, 21.9),
	ang = angBackward + Angle(0,0,-14)
})
-- Mercedes Benz 500E W124 1992
PLATE:RegisterPlate("crsk_mercedes_e500_w124_1992", {
	pos = Vector(0, 120.7, 19.3),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -107.3, 35.5),
	ang = angBackward + Angle(0,0,-15)
})
-- Mercedes Benz 500SE W140 1992
PLATE:RegisterPlate("crsk_mercedes_500se_w140_1992", {
	pos = Vector(0, 127.7, 18.3),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -112.2, 37.8),
	ang = angBackward + Angle(0,0,-7)
})
-- Mercedes Benz 500SL 1994
PLATE:RegisterPlate("crsk_mercedes_500sl_1994", {
	pos = Vector(0, 103.4, 20.3),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -115, 33.4),
	ang = angBackward + Angle(0,0,-13),
	scale = 0.9
})
-- Mercedes Benz 560 SEL W126 1985
PLATE:RegisterPlate("crsk_mercedes_560sel", {
	pos = Vector(0, 122.7, 18.9),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -135, 34.4),
	ang = angBackward + Angle(0,0,-13),
})
-- Mercedes Benz C250 W205 2014
PLATE:RegisterPlate("crsk_mercedes_c250_w205", {
	pos = Vector(0, 116.7, 21),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -115, 42),
	ang = angBackward + Angle(0,0,-13)
})
-- Mercedes C63s Coupe 2016
PLATE:RegisterPlate("crsk_mercedes_c63s_coupe_2016", {
	pos = Vector(0, 105.7, 20),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -119, 25.8),
	ang = angBackward + Angle(0,0,-13)
})
-- Mercedes Benz CLS 350 C218 2012
PLATE:RegisterPlate("crsk_mercedes_cls350", {
	pos = Vector(0, -101, 38.8),
	ang = angBackward + Angle(0,0,-13)
})
-- Mercedes Benz E63 AMG W212 2013
PLATE:RegisterPlate("crsk_mercedes_e63amg_w212_face", {
	pos = Vector(0, 115.7, 20),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -118, 38),
	ang = angBackward + Angle(0,0,-13)
})
-- Mercedes Benz G500 2008
PLATE:RegisterPlate("crsk_mercedes_g500_2008", {
	pos = Vector(0, 93.3, 23),
	ang = Angle(0, 180, 115),
},{
	pos = Vector(0, -113.4, 24),
	ang = angBackward + Angle(0,0,0)
})
-- Mercedes Benz G500 2008 SHORT
PLATE:RegisterPlate("crsk_mercedes_g500_short_2008", {
	pos = Vector(0, 93.3, 23),
	ang = Angle(0, 180, 115),
},{
	pos = Vector(0, -94.4, 24),
	ang = angBackward + Angle(0,0,0)
})
-- Mercedes Benz GL63 AMG 2013
PLATE:RegisterPlate("crsk_mercedes_gl63_amg_2013", {
	pos = Vector(0, 108.4, 27),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -134.4, 45),
	ang = angBackward + Angle(0,0,0)
})
-- Mitsubishi Galant VR-4 E39A 1987
PLATE:RegisterPlate("crsk_mitsubishi_galante39a", {
	pos = Vector(0, 103.7, 18),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -99, 33),
	ang = angBackward + Angle(0,0,-4)
})
-- Mitsubishi Lancer Evo IX
PLATE:RegisterPlate("crsk_mitsubishi_lancer_evo_ix", {
	pos = Vector(0, 112.7, 21),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -97.6, 24),
	ang = angBackward + Angle(0,0,-30),
	scale = 0.80
})
-- Moskvitch-412 AZLK
PLATE:RegisterPlate("crsk_moskvich_412azlk", {
	pos = Vector(0, 101.7, 19),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -110.6, 31),
	ang = angBackward,
	scale = 0.80
})
-- Nissan 370z Nismo 2016
PLATE:RegisterPlate("crsk_nissan_370z_2016", {
	pos = Vector(0, 107.7, 19),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -103.6, 30),
	ang = angBackward + Angle(0,0,-12),
})
-- Nissan Skyline R32 GT-R Custom
PLATE:RegisterPlate("crsk_nissan_skyline_r32_gtr_custom", {
	pos = Vector(-29.2, 106.7, 21),
	ang = Angle(0, 199, 90),
},{
	pos = Vector(0, -110.3, 23),
	ang = angBackward + Angle(0,0,0),
})
-- Pagani Huayrabc 2016
PLATE:RegisterPlate("crsk_pagani_huayrabc_2016", {
	pos = Vector(0, -102, 21),
	ang = angBackward + Angle(0,0,-10),
	scale = 0.72
})
-- Peugeot 205 T16 1984
PLATE:RegisterPlate("crsk_peugeot_205_t16_1984", {
	pos = Vector(0, 89.7, 21.4),
	ang = Angle(0, 180, 91),
},{
	pos = Vector(0, -95.3, 17),
	ang = angBackward + Angle(0,0,0),
})
-- Peugeot 308 GTI 2011
PLATE:RegisterPlate("crsk_peugeot_308gti_2011", {
	pos = Vector(0, 104.7, 10.4),
	ang = Angle(0, 180, 91),
},{
	pos = Vector(0, -108.1, 16),
	ang = angBackward + Angle(0,0,0),
	scale = 0.8
})
-- Peugeot 406 1998
PLATE:RegisterPlate("crsk_peugeot_406_1998", {
	pos = Vector(0, 120.7, 24),
	ang = Angle(0, 180, 91),
},{
	pos = Vector(0, -110.3, 26),
	ang = angBackward + Angle(0,0,-10),
})
PLATE:RegisterPlate("crsk_peugeot_406_taxi", "crsk_peugeot_406_1998")
-- Peugeot 508 2011
PLATE:RegisterPlate("crsk_peugeot_508_2011", {
	pos = Vector(0, 110.7, 22),
	ang = Angle(0, 180, 91),
},{
	pos = Vector(0, -117.3, 26),
	ang = angBackward + Angle(0,0,-2),
})
-- Porsche 911 Turbo S 2017
PLATE:RegisterPlate("crsk_porsche_911_turbos_2017", {
	pos = Vector(0, 110.7, 22),
	ang = Angle(0, 180, 91),
},{
	pos = Vector(0, -109.3, 25),
	ang = angBackward + Angle(0,0,-22),
})
-- Rolls Royce Dawn 2016
PLATE:RegisterPlate("crsk_rolls-royce_dawn", {
	pos = Vector(0, 110.9, 22),
	ang = Angle(0, 180, 91),
},{
	pos = Vector(0, -125.3, 40),
	ang = angBackward + Angle(0,0,-13),
})
-- Rolls Royce Phantom VIII 2018
PLATE:RegisterPlate("crsk_rolls-royce_phantom_viii_2018", {
	pos = Vector(0, 85.9, 20),
	ang = Angle(0, 180, 91),
},{
	pos = Vector(0, -149.3, 38),
	ang = angBackward + Angle(0,0,-13),
})
-- Rolls Royce Silver Cloud III 1963
PLATE:RegisterPlate("crsk_rolls-royce_silvercloud3", {
	pos = Vector(0, 112.3, 30),
	ang = Angle(0, 180, 91),
},{
	pos = Vector(0, -125.8, 33),
	ang = angBackward + Angle(0,0,-13),
	scale = 0.82
})
-- Rolls Royce Wraith 2013
PLATE:RegisterPlate("crsk_rolls-royce_wraith", {
	pos = Vector(0, 117.3, 21.9),
	ang = Angle(0, 180, 91),
},{
	pos = Vector(0, -118.3, 40),
	ang = angBackward + Angle(0,0,-13),
	scale = 1
})
-- SAAB 9-3 Aero 2002
PLATE:RegisterPlate("crsk_saab_93aero_2002", {
	pos = Vector(0, 115.4, 21.9),
	ang = Angle(0, 180, 91),
},{
	pos = Vector(0, -102.3, 41),
	ang = angBackward + Angle(0,0,-13),
	scale = 1
})
-- SAAB 900 Turbo 1989
PLATE:RegisterPlate("crsk_saab900turbo_1989", {
	pos = Vector(0, 114.6, 18),
	ang = Angle(0, 180, 91),
},{
	pos = Vector(0, -105.6, 28),
	ang = angBackward + Angle(0,0,-13),
	scale = 0.82
})
-- Saleen S7 Twin Turbo
PLATE:RegisterPlate("crsk_saleen_s7_twinturbo", {
	pos = Vector(0, -102.6, 21.8),
	ang = angBackward + Angle(0,0,0),
	scale = 0.9
})
-- SEAT Leon Cupra R
PLATE:RegisterPlate("crsk_seat_leon_cupra_r_2003", {
	pos = Vector(0, 90.6, 17),
	ang = Angle(0, 180, 91),
},{
	pos = Vector(0, -105.6, 22),
	ang = angBackward + Angle(0,0,-13),
	scale = 0.82
})
-- Skoda Fabria MK1 2001
PLATE:RegisterPlate("crsk_skoda_fabia_mk1", {
	pos = Vector(0, 103.6, 22.3),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -86.6, 38.6),
	ang = angBackward + Angle(0,0,5),
	scale = 0.82
})
-- Skoda Karoq 2018
PLATE:RegisterPlate("crsk_skoda_karoq_2018", {
	pos = Vector(0, 93.6, 27),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -117.2, 40.6),
	ang = angBackward + Angle(0,0,-15),
})
-- Skoda Octavia MK1 1999
PLATE:RegisterPlate("crsk_skoda_octavia_mk1_1999", {
	pos = Vector(0, 95.1, 20),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -124.1, 39),
	ang = angBackward + Angle(0,0,-4),
})
PLATE:RegisterPlate("crsk_skoda_octavia_mk1_1999_low", "crsk_skoda_octavia_mk1_1999")
-- Skoda Octavia MK3 2012
PLATE:RegisterPlate("crsk_skoda_octavia_mk3", {
	pos = Vector(0, 101.1, 20),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -121.9, 36),
	ang = angBackward + Angle(0,0,-15),
})
-- Skoda Rapid 2014
PLATE:RegisterPlate("crsk_skoda_rapid_2014", {
	pos = Vector(0, 107.9, 25),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -110.9, 43),
	ang = angBackward + Angle(0,0,-25),
})
-- Subaru WRX STi 2017
PLATE:RegisterPlate("crsk_subaru_wrx_sti_2017", {
	pos = Vector(0, 114.9, 21),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -113.2, 40),
	ang = angBackward + Angle(0,0,-10),
})
-- Toyota Camry XV50 2015
PLATE:RegisterPlate("crsk_toyota_camryxv50_2016", {
	pos = Vector(0, 118.9, 23),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -120.2, 37),
	ang = angBackward + Angle(0,0,-10),
})
-- Toyota Chaser Tourer V X100 1998
PLATE:RegisterPlate("crsk_toyota_chaservtourerx100", {
	pos = Vector(0, 97.3, 15.2),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -143.2, 36),
	ang = angBackward + Angle(0,0,-4),
})
-- Toyota Land Cruiser 200 2012
PLATE:RegisterPlate("crsk_toyota_landcruiser_200_2012", {
	pos = Vector(0, 131.1, 37.2),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -110.5, 43),
	ang = angBackward + Angle(0,0,8),
})
-- Toyota Mark II X90 1994
PLATE:RegisterPlate("crsk_toyota_mark_ii_x90_1994", {
	pos = Vector(0, 95.1, 21.7),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -142.5, 27.6),
	ang = angBackward + Angle(0,0,2),
})
PLATE:RegisterPlate("crsk_toyota_mark_ii_x90_1994_low", "crsk_toyota_mark_ii_x90_1994")
-- VAZ 2109
PLATE:RegisterPlate("crsk_vaz_2109", {
	pos = Vector(0, 100.5, 23),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -101.3, 33),
	ang = angBackward + Angle(0,0,-7.7),
})
PLATE:RegisterPlate("crsk_vaz_2109_low", "crsk_vaz_2109")
-- VAZ 2115
PLATE:RegisterPlate("crsk_vaz_2115", {
	pos = Vector(0, 108.1, 23),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -107.4, 19.2),
	ang = angBackward + Angle(0,0,7.7),
	scale = 0.87
})
PLATE:RegisterPlate("crsk_vaz_2115_low", "crsk_vaz_2115")
-- Volkswagen Kharmann Ghia
PLATE:RegisterPlate("crsk_volks_karmann_ghia", {
	pos = Vector(0, -96.4, 25.6),
	ang = angBackward + Angle(0,0,2.7),
	scale = 0.87
})
-- Volvo XC90 T8 2015
PLATE:RegisterPlate("crsk_volvo_xc90_t8_2015", {
	pos = Vector(0, 92.8, 27),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -143.9, 48.2),
	ang = angBackward + Angle(0,0,-7.7),
})
-- W Motors Fenyr Super Sport
PLATE:RegisterPlate("crsk_wmotors_fenyr_ss", {
	pos = Vector(0, -101.4, 28),
	ang = angBackward + Angle(0,0,0),
})
-- ZIL 41047
PLATE:RegisterPlate("crsk_zil_41047", {
	pos = Vector(0, 124.2, 22),
	ang = Angle(0, 180, 99),
},{
	pos = Vector(0, -155.9, 33.5),
	ang = angBackward + Angle(0,0,-7.7),
})
-- ZIL 130 Cargo
PLATE:RegisterPlate("crsk_zil_130bort", {
	pos = Vector(0, 128.2, 35),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(10, -166.1, 37.9),
	ang = angBackward + Angle(0,0,0),
})
-- DAF 95XF 4x2 2003
PLATE:RegisterPlate("crsk_daf_95xf_4x2_2003", {
	pos = Vector(0, 126, 22.4),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -129.1, 31.9),
	ang = angBackward + Angle(0,0,0),
})
-- IVECO Stralis Hi-way 2013
PLATE:RegisterPlate("crsk_iveco_stralis_hi-way_2013", {
	pos = Vector(0, 126, 33.4),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -133.1, 31.9),
	ang = angBackward + Angle(0,0,0),
})
-- Renault Magnum 2005
PLATE:RegisterPlate("crsk_renault_magnum_2005", {
	pos = Vector(0, 107, 20.4),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -159.5, 31.9),
	ang = angBackward + Angle(0,0,0),
})
-- Scania 1641 2004
PLATE:RegisterPlate("crsk_scania_164l_2004", {
	pos = Vector(0, 127.4, 28.9),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(-35, -125.5, 25.5),
	ang = angBackward + Angle(0,0,0),
})
-- PAZ 3205
PLATE:RegisterPlate("crsk_paz_3205", {
	pos = Vector(0, 156, 27),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -161.9, 55.5),
	ang = angBackward + Angle(0,0,0),
})
-- Mercedes-Benz 250GD Wolf
PLATE:RegisterPlate("crsk_mercedes_250gd_wolf", {
	pos = Vector(0, 100, 32),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -90, 44.5),
	ang = angBackward + Angle(0,0,0),
})
-- JAWA 350 634 (Motorbike)
PLATE:RegisterPlate("crsk_jawa_350_634", {
	pos = Vector(0, -47, 21.5),
	ang = angBackward + Angle(0,0,-14),
	scale = 0.8
})
-- LADA Vesta
PLATE:RegisterPlate("crsk_lada_vesta", {
	pos = Vector(0, 104.2, 22),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -103, 40.5),
	ang = angBackward + Angle(0,0,0),
})
PLATE:RegisterPlate("crsk_lada_vesta_low", "crsk_lada_vesta")
-- VAZ 2101
PLATE:RegisterPlate("crsk_vaz_2101", {
	pos = Vector(0, 91.7, 17),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -94.8, 30.5),
	ang = angBackward + Angle(0,0,8),
})
PLATE:RegisterPlate("crsk_vaz_2101_low", "crsk_vaz_2101")
-- VAZ 2106
PLATE:RegisterPlate("crsk_vaz_2106", {
	pos = Vector(0, 91.7, 19),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -92.8, 29.4),
	ang = angBackward + Angle(0,0,8),
})
PLATE:RegisterPlate("crsk_vaz_2106_low", "crsk_vaz_2106")
-- VAZ 2107
PLATE:RegisterPlate("crsk_vaz_2107", {
	pos = Vector(0, 96.7, 17),
	ang = Angle(0, 180, 90),
},{
	pos = Vector(0, -90.8, 29.4),
	ang = angBackward + Angle(0,0,0),
})
PLATE:RegisterPlate("crsk_vaz_2107_low", "crsk_vaz_2107")


--[[ Perryn's Vehicles
By Doctor Internet and Zambie ]]--
prp("photon_perryn_chevy_709", {Vector(0, 123.5, 31)}, {Vector(0, -159.5, 31), scale = 0.7})
prp("perryn_chevrolet_stepvan", {Vector(-0.5, 107.1, 17.4), scale = 0.9}, {Vector( -0.19, -133.45, 24.9 ), scale = 0.85})
prp("perryn_lapd_unmarked_crownvic", {Vector(-0.1, 115.3, 19.78), angForward + Angle(0, 0, 13)}, {Vector(0, -125, 35.8), angBackward + Angle(0, 0, -9), scale = 1.02})
prp("perryn_lapd_crown_victoria", {Vector(-0.1, 115.1, 21.4), angForward + Angle(0, 0, 13)}, {Vector(0, -125, 37.3), angBackward + Angle(0, 0, -9), scale = 1.02})
prp("perryn_v70_2001", {Vector(-0.63, -109, 38), angBackward + Angle(0, 0, -15)})
prp("perryn_volvo_v70_2001_new", {Vector(-0.63, -105, 38), angBackward + Angle(0, 0, -15)})
prp("perryn_2003_chevrolet_impala", {Vector( 0, 130.92, 45.6 ), scale = 0.83}, {Vector(0, -130, 53.1), angBackward + Angle(0, 0, -13), scale = 0.92})
prp("perryn_2003_chevrolet_impala_police", "perryn_2003_chevrolet_impala")
prp("perryn_2009_bmw_750li", {Vector( 0.59, 111.09, 22.96 )}, {Vector( -0.04, -130.7, 40 ), angBackward + Angle(0, 0, -10)})
prp("perryn_mercedes_vito_2010", {Vector( 0, 123, 27)}, {Vector(0,-110,45)})
prp("perryn_2010_vw_caravelle", {Vector(0, 101, 22)}, {Vector(0,-108.1,41.5), angBackward + Angle(0,0,-7)})
prp("perryn_2010_vw_caravelle_swedish_police", "perryn_2010_vw_caravelle")
prp("perryn_2012_vw_passat", {Vector( 0, 103.09, 24.96 )}, {Vector( -0.04, -115.06, 36 ), angBackward + Angle(0, 0, -10)})
prp("perryn_2014_bmwx5", {Vector( 0, 125.21, 29.26 )}, {Vector( -0.04, -106.9, 47 ), angBackward + Angle(0, 0, -14)})
prp("perryn_volvo_v70_2014", {Vector(0,108,23.8)}, {Vector(0,-107,38.5), angBackward + Angle(0,0,-7)})
prp("perryn_2014_volvo_xc70", {Vector(0,112.01,26.8)}, {Vector(0,-115,41.2), angBackward + Angle(0,0,-12)})
prp("perryn_2015_mercedes_nhs_ambulance", {Vector(0,122.89,19.8)}, {Vector(-0.5,-159.1,21.2), scale = 0.92})
prp("perryn_2015_mercedes_vito", {Vector(0,127,26)}, {Vector(0,-137,39.5), angBackward + Angle(0,0,-14)})
prp("perryn_2010_vw_caravelle", {Vector(0,100.4,20)}, {Vector(0,-108.5,41.5), angBackward + Angle(0,0,-8)})
prp("perryn_2010_vw_caravelle_swedish_police", "perryn_2010_vw_caravelle")
prp("perryn_2016_mercedes_sprinter", {Vector(0,129.1,21)}, {Vector(-20,-145.5,32), angBackward + Angle(0,-3,-5)})
prp("perryn_sprinter_armed_transport", "perryn_2016_mercedes_sprinter")
prp("perryn_american_lafrance", {Vector(0,212,27.5)}, {Vector(35,-197,45)})
prp("perryn_bearcat_g3", {Vector(0,106.5,31.5)}, {Vector(-35,-127,42)})
prp("perryn_chevy_709", {Vector(0,123,31.8)}, {Vector(0,-160,30)})
prp("perryn_dodge_ram_ambulance", {Vector(-1.3,129,26.8)}, {Vector(-1,-163,24.5)})
prp("perryn_pierce_arrow_xt", {Vector(0,177.3,21.8)}, {Vector(-35,-237.3,40)})
prp("perryn_fiat_ducato", {Vector(0,123,26.5)}, {Vector(-21,-121.1,43.4), angBackward + Angle(0,0,-10), scale = 0.9})
prp("perryn_ford_e-350_ambulance", {Vector(-33.4,121,27), angForward + Angle(0,8,4)}, {Vector(0,-173.1,28)})
prp("perryn_ford_e450_ambulance", {Vector(-1,147,25)}, {Vector(1,-118.65,25)})
prp("perryn_ford_f150", {Vector(0,122,25)}, {Vector(0,-135,28), angBackward + Angle(0,0,-10)})
prp("perryn_Ford_F700_Armored", {Vector(0,143,27)}, {Vector(0,-158,32)})
prp("perryn_ford_focus_st_estate", {Vector(0,103.3,25)}, {Vector(0,-116,40), angBackward + Angle(0,0,-28), scale = 0.7})
prp("perryn_mercedes_amg_gt_s", {Vector(0,-122,22), angForward + Angle(0,180,0)})
prp("perryn_mercedes_e-class_ambulance", {Vector(0,129,24)}, {Vector(0,-154,43), angBackward + Angle(0,0,-10)})
prp("perryn_pierce_pumper", {Vector(0,197,33)}, {Vector(0,-222,34)})
prp("perryn_scania_94d_firetruck", {Vector(22,150.5,25)}, {Vector(31,-172,34)})
prp("perryn_scania_laddertruck", {Vector(3,182,43)}, {Vector(41,-228.5,38)})
prp("perryn_vauxhall_insignia_wagon", {Vector(0,106.6,22)}, {Vector(0,-120,39), angBackward + Angle(0,0,-10)})
prp("perryn_volvo_fm_euro_tandem", {Vector(0,172,53)}, {Vector(0,-249.2,47)})
prp("perryn_volvo_fmx", {Vector(0,134,55)}, {Vector(0,-212.2,62)})


--[[ Don't know anymore. ]]

--[[ SUPER'S CARS ]]

prp("smx5m", {
	pos = Vector(0, 117.49, 22.5),
	ang = angForward,
	condition = function(v)
		local bg = v:GetBodygroup(1)
		if bg == 2 then return false end
	end
},{
	pos = Vector(0,-113.7,47),
	ang = Angle(0,0, 80),
})

prp("chargerhubsm", {Vector(0,121.5,25)}, {Vector(0,-118.5,30.5), angBackward + Angle(0,0,-10)})
prp("chargersm", "chargerhubsm")
prp("smplygtx", {Vector(0,114,21), angForward + Angle(0, 0, 16)}, {Vector(0,-123.2,35.2), angBackward + Angle(0,0,-10)})
prp("ply_gtx_shatter", "smplygtx")
prp("smc_chevrolet_caprice_ppv", {Vector(0,119.4,21), angForward + Angle(0, 0, 0)}, {Vector(0,-135,24.5), angBackward + Angle(0,0,0)})
prp("sm_12bmw530dtourciv", {Vector(0,121,23), angForward + Angle(0, 0, 0)}, {Vector(0,-118,38.4), angBackward + Angle(0,0,-15)})
prp("sm_12bmw530dtouremer", "sm_12bmw530dtourciv")
prp("sm_14bmw530dtourciv", "sm_12bmw530dtourciv")
prp("sm_14bmw530dtouremer", "sm_12bmw530dtourciv")
prp("12chargerawdsm", {Vector(0,121.5,20), angForward + Angle(0, 0, 0)}, {Vector(0,-121,28.7), angBackward + Angle(0,0,-10)})
prp("12chargersm", "12chargerawdsm")
--prp("sm_focusst_mk3") UNRELEASED CAR FINISH LAST
prp("smfrdfus", {Vector(0,124.1,24.5), angForward + Angle(0, 0, 2)}, {Vector(0,-114.7,43), angBackward + Angle(0,0,0)})
prp("mclar570s", {Vector(0,117.57,16), angForward + Angle(0, 0, 2)}, {Vector(0,-103,26), angBackward + Angle(0,0,-15)})
prp("smexplfordstl14", {Vector(0,119.1,23), angForward + Angle(0, 0, 2)}, {Vector(0,-127.5,49), angBackward + Angle(0,0,0)})
prp("sm_bmw530dsal", {Vector(0,121,23), angForward + Angle(0, 0, 0)}, {Vector(0,-118,38.4), angBackward + Angle(0,0,-10)})
prp("sm_tahoe_civ", {Vector(0.25,127.2,24.7), angForward + Angle(0, 0, 0)}, {Vector(0,-126.5,49.5), angBackward + Angle(0,0,0)})
prp("sm_charpurhub", {Vector(0,118.59,24), angForward + Angle(0, 0, 0)}, {Vector(0,-126.8,30), angBackward + Angle(0,0,-10)})
prp("sm_charpurhub2", "sm_charpurhub")
prp("sm_charpursuit", "sm_charpurhub")
prp("sm_charpursuit15", "sm_charpurhub")
prp("sm15rangrovspor", {Vector(0,137.25,37)}, {Vector(0,-111.5,54.5), angBackward + Angle(0,0,-6)})
prp("smutilfordhub", {Vector(0,114.6,30.2)}, {Vector(0,-124.8,53), angBackward + Angle(0,0,-17)})
prp("smexplfordstl", "smutilfordhub")
prp("sm18f90", {Vector(0,120.4,22), angForward + Angle(0, 0, 0)}, {Vector(0,-114,39.4), angBackward + Angle(0,0,-10)})
prp("sm_fer_812", {Vector(0,113.7,22.7), angForward + Angle(0, 0, 0)}, {Vector(0,-113,30.5), angBackward + Angle(0,0,-15)})
prp("sm_ford_f150", {Vector(0,127.9,30), angForward + Angle(0, 0, 0)}, {Vector(0,-131,31.4), angBackward + Angle(0,0,0)})
prp("sm_foc_civ", {Vector(0,111,16.5), angForward + Angle(0, 0, 0)}, {Vector(0,-96.9,31), angBackward + Angle(0,0,-10)})

--[[ STEEL'S CARS ]]

prp("smc_bui_regal_gnx", {Vector(0,118.9,22), angForward + Angle(0, 0, 0)}, {Vector(0,-114.5,37.5), angBackward + Angle(0,0,-15)})
prp("smc_bel_air", {Vector(0,114.95,17.5), angForward + Angle(0, 0, 0)}, {Vector(0,-128.9,21), angBackward + Angle(0,0,0)})
prp("smc_che_cam_irocz", {Vector(0,114.9,20), angForward + Angle(0, 0, 0)}, {Vector(0,-108.5,37), angBackward + Angle(0,0,-15)})
prp("smc_ss396", {Vector(0,104.5,17.5), angForward + Angle(0, 0, 18)}, {Vector(0,-130.6,25), angBackward + Angle(0,0,0)})
prp("smc_corvettezr1_19", {Vector(0,112.5,17.5), angForward + Angle(0, 0, 0)}, {Vector(0,-109,23.5), angBackward + Angle(0,0,-10)})
prp("smc_chevyii_nova", {Vector(0,106.2,20), angForward + Angle(0, 0, 15)}, {Vector(0,-114.3,27), angBackward + Angle(0,0,-10)})
prp("smc_mustang_gt_15", {Vector(0,111.95,22), angForward + Angle(0, 0, 0)}, {Vector(0,-119.9,28.9), angBackward + Angle(0,0,-10)})
prp("smc_maz_rx7_gslse", {Vector(0,104.8,22), angForward + Angle(0, 0, 0)}, {Vector(0,-102,20), angBackward + Angle(0,0,0)})
prp("smc_olds_hurst", {Vector(0,117,22), angForward + Angle(0, 0, 0)}, {Vector(0,-125,22.3), angBackward + Angle(0,0,0)})
prp("smc_ply_cuda426", {Vector(0,108,18), angForward + Angle(0, 0, 0)}, {Vector(0,-112,38), angBackward + Angle(0,0,-15)})
prp("smc_ply_roadrunner", {Vector(0,122.5,21), angForward + Angle(0, 0, 17)}, {Vector(0,-119.9,20.5), angBackward + Angle(0,0,0)})
prp("smc_pon_firebird_68", {Vector(0,106.65,19.5), angForward + Angle(0, 0, 17)}, {Vector(0,-112.7,24), angBackward + Angle(0,0,5)})
prp("smc_pon_g8_gxp", {Vector(0,121.6,21), angForward + Angle(0, 0, 0)}, {Vector(0,-115,42), angBackward + Angle(0,0,-10)})
prp("smc_pon_gto_judge", {Vector(0,114.5,19), angForward + Angle(0, 0, 12)}, {Vector(0,-122.5,25.5), angBackward + Angle(0,0, 0)})
prp("smc_cobra427", {Vector(0,91.2,12.3), angForward + Angle(0, 0, 0)}, {Vector(0,-92.67,25.5), angBackward + Angle(0,0,-2)})
prp("smc_toy_gt86rb", {Vector(0,106.1,19), angForward + Angle(0, 0, 0)}, {Vector(0,-98.5,35), angBackward + Angle(0,0,-10)})

prp("smc_pon_firebird_ws6", {
	pos = Vector(0,119.9,23),
	ang = angForward + Angle(0, 0, 0),
	condition = function(v)
	local bg = v:GetBodygroup(8)
	if bg == 2 then return false end
	end
},{
	pos = Vector(0,-118.5,19),
	ang = angBackward + Angle(0,0, 0),
	condition = function(v)
	local bg = v:GetBodygroup(9)
	if bg == 2 then return false end
	end
})

-- [[ RITZU'S CARS ]]

prp("ritzucars_2017_agera_rs", {Vector(0,107,13), angForward + Angle(0, 0, 0)}, {Vector(0.7,-104.5,30.2), angBackward + Angle(0,0,-20)})
prp("ritzucars_2018_bmw_m2", {Vector(5,103,20), angForward + Angle(0, 0, 0)}, {Vector(3.5,-109.3,40), angBackward + Angle(0,0,-10)}) -- it's actually an m2 competition but alright /shrug
prp("ritzucars_2011_cad_cts_v_coupe", {Vector(0,112.2,20.2), angForward + Angle(0, 0, 0)}, {Vector(0,-113,42), angBackward + Angle(0,0,-16)})
prp("ritzucars_2009_vette_zr1", {Vector(0,108.2,21), angForward + Angle(0, 0, 0)}, {Vector(0,-107.7,31.2), angBackward + Angle(0,0,-5)})
prp("ritzucars_2008_dod_viper_acr", {Vector(0,109,21), angForward + Angle(0, 0, 0)}, {Vector(0,-100.92,39.2), angBackward + Angle(0,0,-5)})
prp("ritzucars_1967_for_fastback", {Vector(0,110.8,22), angForward + Angle(0, 0, 0)}, {Vector(0,-108.5,21), angBackward + Angle(0,0,20)})
prp("ritzucars_2012gum_apollo", {Vector(0,102.81,10), angForward + Angle(0, 0, -8)}, {Vector(0,-100.65,37.5), angBackward + Angle(0,0,-10)})
prp("ritzucars_2012_lot_exige_s", {Vector(0,99.13,17.3), angForward + Angle(0, 0, 0)}, {Vector(0,-93.5,29.5), angBackward + Angle(0,0,0)})

prp("ritzucars_2009_pont_gto", {
	pos = Vector(0,116.7,22),
	ang = angForward + Angle(0, 0, 0),
	condition = function(v)
	local bg = v:GetBodygroup(5)
	if bg == 0 then return {pos = Vector(0, 116.7, 22), ang = angForward + Angle( 0, 0, 0)} end
	if bg == 1 then return {pos = Vector(0, 117.6, 22), ang = angForward + Angle( 0, 0, 0)} end
	if bg == 2 then return {pos = Vector(0, 116.6, 22), ang = angForward + Angle(0, 0, 0)} end
	if bg == 3 then return false end
	end
},{
	pos = Vector(0,-114.95,42),
	ang = angBackward + Angle(0,0, -8),
})

prp("ritzucars_2009_lexus_is_f", {
	pos = Vector(0,114.6,18),
	ang = angForward + Angle(0, 0, 0),
	condition = function(v)
	local bg = v:GetBodygroup(1)
	if bg == 4 then return false end
	end
},{
	pos = Vector(0,-106.44,39.5),
	ang = angBackward + Angle(0,0, -15),
})

prp("ritzucars_sn95_cobra_r", {
	pos = Vector( 0, 109, 17.71 ),
	ang = angForward,
	scale = 0.95,
	condition = function(v)
		local bg = v:GetBodygroup(2)
		if bg == 0 then return {pos = Vector(0, 113.4, 20.35 ), ang = angForward + Angle(0, 0, -10)} end
		if bg == 1 then return {pos = Vector(0, 112.64, 19.5 ), ang = angForward + Angle(0, 0, 5)} end
		if bg == 2 then return {pos = Vector(0, 113.5, 15.5 ), ang = angForward + Angle(0, 0, 0)} end
		if bg == 3 then return {pos = Vector(0, 113, 20 ), ang = angForward + Angle(0, 0, 0)} end
		if bg == 4 then return false end
	end
},{
	pos = Vector( 0, -104.2, 39.5),
	ang = angBackward + Angle(0, 0, -6),
	scale = 0.95,
})

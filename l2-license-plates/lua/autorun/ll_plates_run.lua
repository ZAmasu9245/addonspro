--[[-- Licenseplate Bootstrapper
@copyright 2019 Limelight Gaming
@release 1.6.0
@author Doctor Internet
@module Loader
--]]--

if SERVER then
	include("ll_plates/sv_init.lua")
	AddCSLuaFile("ll_plates/sh_init.lua")
	AddCSLuaFile("ll_plates/cl_init.lua")
else
	include("ll_plates/cl_init.lua")
end
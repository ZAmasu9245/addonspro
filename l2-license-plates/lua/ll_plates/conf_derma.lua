--[[-- License Plate Misc Configs
@copyright 2019 Limelight Gaming
@release 1.5.5
@author Doctor Internet
@module PLATE.Config
--]]--

local PLATE = PLATE_SHARED

--- Derma Settings
-- @section derma

--- The title for the F3 derma frame.
-- @field[type=string] PLATE.Config.DermaTitle
PLATE.Config.DermaTitle = "Register for a Custom Plate"

--- The body text for the F3 derma frame.
-- @field[type=string] PLATE.Config.DermaInfo
PLATE.Config.DermaInfo = [[Please enter your custom plate (max 8 chars)
Spaces, Dashes, Numbers and Letters are allowed.

Example: LL-2018
This will cost: $]] .. string.Comma(PLATE.Config.Cost) .. "."

--- The frame colour for the derma panel.
-- @field[type=Color] PLATE.Config.DermaFrameCol
PLATE.Config.DermaFrameCol = Color(33, 33, 33) -- Storm.

--- The text colour for the derma panel.
-- @field[type=Color] PLATE.Config.DermaTextCol
PLATE.Config.DermaTextCol = Color(236, 239, 241) -- Steel White.

--- The brand / feature colour for the derma panel.
-- @field[type=Color] PLATE.Config.DermaBrandCol
PLATE.Config.DermaBrandCol = Color(66, 165, 245) -- Limelight Blue

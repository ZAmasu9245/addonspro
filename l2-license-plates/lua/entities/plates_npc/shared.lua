--[[-- License Seller NPC Shared Code
@copyright 2019 Limelight Gaming
@release 1.5.5
@author Doctor Internet
@module PlateNPC
@alias ENT
--]]--

--- The entity base used.
ENT.Base = "base_ai"

--- The type of entity.
ENT.Type = "ai"

--- If frames are automatically advanced.
ENT.AutomaticFrameAdvance = true

--- Client spawn name.
ENT.PrintName = "License Plate NPC"

--- Author.
ENT.Author = "Doctor Internet"

--- Contact info.
ENT.Contact = ""

--- Fluff text
ENT.Purpose = "Selling custom places."

--- Fluff text
ENT.Instructions = "Press E, do the menu."

--- If the ent can be spawned by admins.
ENT.AdminSpawnable = false

--- If the ent can be spawned.
ENT.Spawnable = true

--- Setter for ENT.AutomaticFrameAdvance
-- @bool bUsingAnim If the entity is using animations.
function ENT:SetAutomaticFrameAdvance(bUsingAnim) self.AutomaticFrameAdvance = bUsingAnim end
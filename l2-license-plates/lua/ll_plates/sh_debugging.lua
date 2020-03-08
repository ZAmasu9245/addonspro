--[[-- License Plate Misc Configs
@copyright 2019 Limelight Gaming
@release 1.5.5
@author Doctor Internet
@module PLATE
--]]--

local PLATE = PLATE_SHARED

--- @field[type=boolean] DoDebugPrints Whether the system will do debug prints.
PLATE.Config.DoDebugPrints = false

--- Shared Functions
-- @section sharedf

--- Turn vararg inputs into a single string.
-- @tparam vararg ... Inputs.
-- @treturn string Stringified Inputs.
function PLATE:DebugStringify(...)
	local tab = {}

	local m = select("#", ...)
	for i = 1, m do
		local val = select(i, ...)

		if isstring(val) then
			table.insert(tab, val)
		elseif isnumber(val) then
			table.insert(tab, tostring(val))
		elseif IsValid(val) and val:IsPlayer() then
			table.insert(tab, val:Name())
		else
			table.insert(tab, tostring(val))
		end
	end

	return table.concat(tab, " ")
end

if PLATE.Config.DoDebugPrints then
	local fHand
	if SERVER then
		fHand = file.Open("ll-plates-sv-debug-" .. os.time() .. ".txt", "w", "DATA")
	else
		fHand = file.Open("ll-plates-cl-debug-" .. os.time() .. ".txt", "w", "DATA")
	end

	--- Output a debug message to console and debugging file.
	-- <span style='color:red; font-weight:bold'>Only works when DoDebugPrints is set to true.</span>
	-- @tparam vararg ... Inputs.
	function PLATE:DebugPrint(...)
		print("[" .. os.date("%Y-%m-%d %X") .. "]", ...)
		fHand:Write("[" .. os.date("%Y-%m-%d %X") .. "] ")
		fHand:Write(self:DebugStringify(...))
		fHand:Write("\n")
		fHand:Flush()
	end
	PLATE:DebugPrint("Debugging Library Loaded.")
else
	function PLATE:DebugPrint(...) end
end

--[[-- License Plate Main Code
@copyright 2019 Limelight Gaming
@release 1.5.12
@author Doctor Internet
@module PLATE
--]]--

--- Client Functions
-- @section clientf

-- Create our plate table.
local PLATE = {}
PLATE_SHARED = PLATE

-- And then run the shared init.
include("sh_init.lua")
PLATE:DebugPrint("Back to Client.")

-- Locally include some functions.
local isstr = isstring
local upper = string.upper
local IsValid = IsValid
local ipairs = ipairs
local surface = surface
local render = render
local cam = cam
local ega = ents.GetAll
PLATE:DebugPrint("Cached Functions.")

-- Create our fonts.
PLATE:DebugPrint("Creating Fonts.")
surface.CreateFont("ll_plates::font", {font = "Lucida", size = 200, antialias = true})
surface.CreateFont("ll_plates::header", {font = "Courier", size = 60, antialias = true})


--- Get the colour required for a specific plate by its path.
-- @string path The path to grab colour for.
-- @treturn Color The colour for the plate, or the default plate colour if none is defined.
function PLATE:GetPlateColourFromPath(path) return self.Colours[path] or self.Config.DefaultColour end

-- Store some stuff we use later.
local p = PLATE.Config.Path
local ve = PLATE.Config.Version

--- Get the plate based on the current month/day.
-- @treturn string Path to the plate, not including base path.
function PLATE:GetBySeason()
	local month = self.Months[os.date("%m")]
	if not month then
		return self.Config.DefaultPlate
	elseif isstr(month) then
		return ve .. month
	elseif month[os.date("%d")] then
		return ve .. month[os.date("%d")]
	elseif month["default"] then
		return ve .. month["default"]
	else
		return self.Config.DefaultPlate
	end
end
PLATE:DebugPrint("Utility Functions.")

-- Since these won't change often, we can cache them at the start of the script.
PLATE.platePath = p .. PLATE:GetBySeason()
PLATE.plateMat = Material(PLATE.platePath)
PLATE.plateCol = PLATE:GetPlateColourFromPath(PLATE.platePath)

-- Exempt plates for Government.
PLATE.exemptPath = p .. "exempt.png"
PLATE.exemptMat = Material(PLATE.exemptPath)
PLATE.exemptCol = PLATE:GetPlateColourFromPath(PLATE.exemptPath)

PLATE.Config.PlateDarken = math.min(math.max(PLATE.Config.PlateDarken, 0), 1)
-- This gets used for resetting the colour of the base plate.
PLATE.COLOUR_NONE = Color(255 * PLATE.Config.PlateDarken, 255 * PLATE.Config.PlateDarken, 255 * PLATE.Config.PlateDarken, 255)
PLATE.COLOUR_RESET = Color(255, 255, 255)
PLATE:DebugPrint("Precache Colours and Materials.")

--- Ensure we're valid. (Used for the hook lib).
function PLATE:IsValid()
	return true
end

--- Draw the plates on a single car.
-- @ent ent Entity to draw on.
-- @vector lPlyPos The player's position.
-- @tab[opt] traceData The trace data to use as a base for trace based plate hiding.
function PLATE:DrawCar(ent, lPlyPos, traceData)
	if not IsValid(ent) then return end
	if not ent:IsVehicle() then return end
	if ent:GetPos():DistToSqr(lPlyPos) > self.Config.FadeDist then return end

	local plates = self:GetPlate(ent:GetNWString("ll_v_name"))
	if not plates then return end

	local text = ent:GetNWString("ll_plate")
	if not text then return end

	local exempt = ent:GetNWBool("IsExemptVehicle")
	local mat = exempt and self.exemptMat or self.plateMat
	local col = exempt and self.exemptCol or self.plateCol

	local title = not exempt and self.Config.HeaderText or false
	if traceData then
		traceData = table.Copy(traceData)
		table.insert(traceData.filter, ent)
	end

	local platesM = #plates
	for i = 1, platesM do
		self:DrawPlate(ent, plates[i], text, title, mat, col, traceData)
	end
end


--- Draw a single plate on a given entity.
-- @ent ent The entity to draw on.
-- @tab plate Plate data.
-- @string text The license plate text to draw.
-- @string[opt] title Title to draw.
-- @tparam Material mat Plate material to draw.
-- @color col Color to draw.
-- @tab[opt] traceData Tracedata to use.
function PLATE:DrawPlate(ent, plate, text, title, mat, col, traceData)
	local pos, ang, sca, cond, bgs = plate.pos, plate.ang, plate.scale, plate.condition, plate.bg

	if cond then
		local res = cond(ent)
		if res == false then return end

		pos = res and (res[1] or res.pos) or pos
		ang = res and (res[2] or res.ang) or ang
		sca = res and (res[3] or res.scale) or sca
	end

	if bgs and bgs.id then
		local va = ent:GetBodygroup(bgs.id)
		if bgs.val[va] then
			local ov = bgs.val[va]
			if ov.hidden then return end

			pos = ov.pos or pos
			ang = ov.ang or ang
			sca = ov.scale or sca
		end
	end

	if traceData then
		traceData.endpos = pos
		local tr = util.TraceLine(traceData)
		if tr.HitWorld or IsValid(tr.Entity) then return end
	end

	pos = ent:LocalToWorld(pos or Vector(0, 0, 0))
	ang = ent:LocalToWorldAngles(ang or Angle(0, 0, 0))
	sca = sca or 1

	surface.SetTextColor(col.r, col.g, col.b, 255)
	render.SuppressEngineLighting(true)
	local tw, th
	cam.Start3D2D(pos, ang, sca * 0.017)
		local w, h = self.Config.WidthScale, self.Config.HeightScale
		surface.SetMaterial(mat)
		surface.SetDrawColor(self.COLOUR_NONE)
		surface.DrawTexturedRect(-w / 2, -h / 2, w, h)
		surface.SetDrawColor(self.COLOUR_RESET)

		-- Draw the main plate text.
		surface.SetFont("ll_plates::font")
		tw, th = surface.GetTextSize(text)
		surface.SetTextPos(math.ceil(-tw / 2), math.ceil(-th / 2))
		surface.DrawText(text)

		if title then
			-- Draw the plate header.
			surface.SetFont("ll_plates::header")
			tw, th = surface.GetTextSize(title)
			surface.SetTextPos(math.ceil(-tw / 2), math.ceil(-150 - (th / 2)))
			surface.DrawText(title)
		end
	cam.End3D2D()
	render.SuppressEngineLighting(false)
end

--- Open the F3 license plate menu.
-- @int leng int Net Message Length
-- @param ply Confirmation that the net message was sent from the server. (Should be nil)
function PLATE:OpenMenu(leng, ply)
	if IsValid(self.Frame) and self.Frame:IsVisible() then return end -- Already open.
	if IsValid(self.Frame) then self.Frame:Remove() end

	local y
	self.Frame = vgui.Create("DFrame")
	self.Frame:SetTitle("")
	self.Frame:SetSize(300, 194)
	self.Frame:ShowCloseButton(true)
	self.Frame:Center()
	function self.Frame.Paint(panel, w, h)
		draw.RoundedBox(4, 3, 20, panel:GetWide() - 6, panel:GetTall() - 40, self.Config.DermaFrameCol)
	end

	self.Frame.TitleLabel = vgui.Create("DLabel", self.Frame)
	self.Frame.TitleLabel:SetText(self.Config.DermaTitle)
	self.Frame.TitleLabel:SetFont("Trebuchet24")
	self.Frame.TitleLabel:SetTextColor(self.Config.DermaBrandCol)
	self.Frame.TitleLabel:SizeToContents()
	self.Frame.TitleLabel:SetPos((self.Frame:GetWide() - self.Frame.TitleLabel:GetWide()) / 2, 25)

	self.Frame.InfoLabel = vgui.Create("DLabel", self.Frame)
	self.Frame.InfoLabel:SetText(self.Config.DermaInfo)
	self.Frame.InfoLabel:SetTextColor(self.Config.DermaTextCol)
	self.Frame.InfoLabel:SizeToContents()

	_, y = self.Frame.TitleLabel:GetPos()
	self.Frame.InfoLabel:SetPos(5, 5 + y + self.Frame.TitleLabel:GetTall())

	self.Frame.TextEntry = vgui.Create("DTextEntry", self.Frame)
	self.Frame.TextEntry:SetWide(self.Frame:GetWide() - 10)
	self.Frame.TextEntry:SetTextColor(self.Config.DermaTextCol)
	self.Frame.TextEntry:SetPaintBackground(false)
	self.Frame.TextEntry:SetDrawBorder(true)
	_, y = self.Frame.InfoLabel:GetPos()
	self.Frame.TextEntry:SetPos(5, 5 + y + self.Frame.InfoLabel:GetTall())
	function self.Frame.TextEntry.OnTextChanged(panel)
		panel:SetText(panel:GetText():gsub("[^%w- ]", ""):gsub("%l", upper):sub(0, self.Config.MaxLength))
		panel:SetCaretPos(panel:GetText():len())
	end

	self.Frame.Cancel = vgui.Create("DButton", self.Frame)
	self.Frame.Cancel:SetText("Cancel")
	self.Frame.Submit = vgui.Create("DButton", self.Frame)
	self.Frame.Submit:SetText("Buy Plates")
	_, y = self.Frame.TextEntry:GetPos()
	local w1 = ((self.Frame:GetWide() - 10) / 2) - 7
	local x1, x2 = 7, self.Frame:GetWide() - 7 - w1
	y = y + self.Frame.TextEntry:GetTall() + 5
	self.Frame.Cancel:SetPos(x1, y)
	self.Frame.Submit:SetPos(x2, y)
	self.Frame.Cancel:SetSize(w1, 20)
	self.Frame.Submit:SetSize(w1, 20)
	function self.Frame.Submit.DoClick(panel)
		local text = self.Frame.TextEntry:GetText()
		if text:len() < 1 then return end

		net.Start("ll_plates::menu")
			net.WriteString(text)
			net.WriteUInt(1, 2)
		net.SendToServer()

		self.Frame:Remove()
	end

	function self.Frame.Cancel.DoClick(panel)
		self.Frame:Remove()
	end

	self.Frame:MakePopup()
	self.Frame.TextEntry:RequestFocus()
end
net.Receive("ll_plates::menu", function(leng, ply) PLATE:OpenMenu(leng, ply) end)
PLATE:DebugPrint("Created Menu Function")

--- Internal function, used for hooking into PostDrawTranslucentRenderables.
-- Yes, I know BadCoderz fires on this.
-- The only other way of doing this is setting a RenderOverride function.
-- That breaks refract materials, so I'm not doing that.
-- I know I'm doing ents.GetAll in here. I need to test against multiple classes. prop_vehicle_jeep, prop_vehicle_jeep_old,
-- prop_vehicle_airboat, whatever the fuck the ID is for SCars. That has a higher performance hit than ents.GetAll.
-- @bool d If the hook is currently drawing depth.
-- @bool s If the hook is currently drawing sky.
function PLATE:PostDrawTranslucentRenderables(d, s)
	if d or s then return end

	local lPly = LocalPlayer()
	local lPlyPos = lPly:GetPos()

	local traceData
	if self.Config.BlockedHide then
		traceData = {start = lPly:EyePos(), filter = {lPly, lPly:GetActiveWeapon()}}
	end

	local entTab = ega()
	for _, car in ipairs(entTab) do
		self:DrawCar(car, lPlyPos, traceData)
	end
end
hook.Add("PostDrawTranslucentRenderables", PLATE, PLATE.PostDrawTranslucentRenderables)
PLATE:DebugPrint("Created Draw Hook")


LL_PLATES_SYSTEM = PLATE
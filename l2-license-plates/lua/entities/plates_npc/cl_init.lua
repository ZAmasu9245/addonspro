--[[-- License Seller NPC Client Code
@copyright 2019 Limelight Gaming
@release 1.5.5
@author Doctor Internet
@module PlateNPC
@alias ENT
--]]--

include("shared.lua")

local upper = string.upper

--- Open the NPC plate menu.
-- @int leng Net Message Length
-- @param ply Confirmation that the net message was sent from the server (should be nil)
-- @ent veh Closest player owned vehicle.
function LL_PLATES_SYSTEM:OpenNPCMenu(leng, ply, veh)
	if IsValid(self.Frame) and self.Frame:IsVisible() then return end -- Already open.
	if IsValid(self.Frame) then self.Frame:Remove() end
	if not IsValid(veh) then return end

	local y
	self.Frame = vgui.Create("DFrame")
	self.Frame:SetTitle("")
	self.Frame:SetSize(500, 500)
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
		panel:SetText(panel:GetText():gsub("[^%w- ]", ""):gsub("%l", function(val) return upper(val) end):sub(0, 8))
		panel:SetCaretPos(panel:GetText():len())
	end


	self.Frame.ModelPanel = vgui.Create("DModelPanel", self.Frame)
	_, y = self.Frame.TextEntry:GetPos()
	self.Frame.ModelPanel:SetPos(5, 5 + y + self.Frame.TextEntry:GetTall())

	self.Frame.Cancel = vgui.Create("DButton", self.Frame)
	self.Frame.Cancel:SetText("Cancel")
	self.Frame.Submit = vgui.Create("DButton", self.Frame)
	self.Frame.Submit:SetText("Buy Plates")
	local w1 = ((self.Frame:GetWide() - 10) / 2) - 7
	local x1, x2 = 7, self.Frame:GetWide() - 7 - w1

	y = self.Frame:GetTall() - (self.Frame.Cancel:GetTall() + 25)
	self.Frame.Cancel:SetPos(x1, y)
	self.Frame.Submit:SetPos(x2, y)
	self.Frame.Cancel:SetSize(w1, 20)
	self.Frame.Submit:SetSize(w1, 20)
	function self.Frame.Submit.DoClick(panel)
		local text = self.Frame.TextEntry:GetText()
		if text:len() < 1 then return end

		net.Start("ll_plates::menu")
			net.WriteString(text)
			net.WriteUInt(2, 2)
		net.SendToServer()

		self.Frame:Remove()
	end

	function self.Frame.Cancel.DoClick(panel)
		self.Frame:Remove()
	end

	local _, y3 = self.Frame.TextEntry:GetPos()
	local h = y - (y3 + self.Frame.TextEntry:GetTall() + 10)
	self.Frame.ModelPanel:SetSize(self.Frame:GetWide() - 10, h)
	self.Frame.ModelPanel:SetModel(veh:GetModel())
	self.Frame.ModelPanel:SetFOV(90)

	local boundMax, boundMin = self.Frame.ModelPanel.Entity:GetRenderBounds()
	local size = math.max(0, math.abs(boundMax.x) + math.abs(boundMin.x), math.abs(boundMax.y) + math.abs(boundMin.y), math.abs(boundMax.z) + math.abs(boundMin.z)) * 0.75
	self.Frame.ModelPanel:SetCamPos(Vector(size, size, size))
	self.Frame.ModelPanel:SetLookAt(self.Frame.ModelPanel.Entity:GetPos())

	self.Frame:MakePopup()
	self.Frame.TextEntry:RequestFocus()
end
net.Receive("ll_plates::npc_menu", function(leng, ply) LL_PLATES_SYSTEM:OpenNPCMenu(leng, ply, net.ReadEntity()) end)
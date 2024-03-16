local hasTarget = nil
local frame = CreateFrame("FRAME")
frame:RegisterEvent("UNIT_TARGET")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

local eventHandler = function()
	hasTarget = UnitExists("target")
end

frame:SetScript("OnEvent", eventHandler)

local origShowUIPanel = ShowUIPanel

ShowUIPanel = function (f)
	if hasTarget==nil or UnitExists("target")~=nil or f:GetName()~="GameMenuFrame" then
		origShowUIPanel(f)
	end
end
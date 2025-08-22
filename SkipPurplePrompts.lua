
--Variable Info 
local WantToSell = false

--REMEMBER FOR THE SYSTEM TO FIND THE COMMAND LINE, YOU HAVE TO BIND IT TO ITS VARIABLE NAME, NOT ITS VALUE
--command name 

-- Auto-sell without the "will become non-tradable" confirmation
local f = CreateFrame("Frame")
f:RegisterEvent("MERCHANT_CONFIRM_TRADE_TIMER_REMOVAL")
f:SetScript("OnEvent", function(self, event, ...)
    if event == "MERCHANT_CONFIRM_TRADE_TIMER_REMOVAL" and WantToSell then
        -- Automatically accept the dialog
        StaticPopup_Hide("CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL")
        SellCursorItem()
    end
end)

--diplays Hello PlayerName 

--DISPLAY FRAME
local Sellbutton = CreateFrame("Button", "MyAddonButton", UIParent, "UIPanelButtonTemplate")
Sellbutton:SetSize(60, 60)
Sellbutton:SetPoint("CENTER")    -- position on screen
Sellbutton:EnableMouse(true)
Sellbutton:SetMovable(true)
Sellbutton:SetClampedToScreen(true) 
Sellbutton:RegisterForClicks("AnyDown") -- Makes it clickable on both press and release

--Display Moveable Script
Sellbutton:SetScript("OnMouseDown", function(self, button)
	self:StartMoving()
end)
Sellbutton:SetScript("OnMouseUp", function(self, button)
	self:StopMovingOrSizing()
end)

Sellbutton:SetScript("OnClick", function(self, button, down)
        
        --Flip Boolean of WantToSell
        WantToSell = not WantToSell
        if WantToSell then
            self:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Check")
            print("Will Skip Sell Prompt") 
            
            
        else
            self:SetNormalTexture("Interface\\RaidFrame\\ReadyCheck-NotReady")
            print("Will NOT Skip Sell Prompt") 
            
            
        end
    

end)
Sellbutton:SetNormalTexture("Interface\\RaidFrame\\ReadyCheck-NotReady")


--CreateText
--local SessiontextFrame = infoDisplay:CreateFontString(nil, "Overlay", "GameFontNormal")
--SessiontextFrame:SetPoint("CENTER", infoDisplay, "CENTER", 0, 10)  -- anchor near the top
--SessiontextFrame:SetText("Penis!")



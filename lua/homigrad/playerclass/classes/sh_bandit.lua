local CLASS = player.RegClass("bandit")

function CLASS.Off(self)
    if CLIENT then return end
end

local plyclr = {
    Color(48, 48, 0),
    Color(48, 31, 0),
    Color(167, 76, 2)
}


local masks = {
    "arctic_balaclava",
    "phoenix_balaclava",
    "bandana"
}

function CLASS.On(self)
    if CLIENT then return end
    ApplyAppearance(self,nil,nil,nil,true)
    timer.Simple(.1,function()
        local Appearance = self.CurAppearance or hg.Appearance.GetRandomAppearance()

        Appearance.AAttachments = {
            masks[math.random(#masks)],
            "terrorist_band"
        }
        self:SetNetVar("Accessories", Appearance.AAttachments or "none")
        self:SetPlayerColor(plyclr[math.random(#plyclr)]:ToVector())
        
        self.CurAppearance = Appearance
    end)
end

function CLASS.Guilt(self, victim)
    if CLIENT then return end

    if victim:GetPlayerClass() == self:GetPlayerClass() then
        return 1
    end
end
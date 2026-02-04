local CLASS = player.RegClass("terrorist")

function CLASS.Off(self)
    if CLIENT then return end
end

local models = {
    "models/player/arctic.mdl",
    "models/player/phoenix.mdl",
    "models/player/leet.mdl",
    "models/player/guerilla.mdl"
}

function CLASS.On(self)
    if CLIENT then return end
    ApplyAppearance(self,nil,nil,nil,true)
    local Appearance = self.CurAppearance or hg.Appearance.GetRandomAppearance()
    Appearance.AAttachments = ""
    Appearance.AColthes = ""
    self:SetPlayerColor(Color(165,0,0):ToVector())
    self:SetModel(models[math.random(#models)])
end

function CLASS.Guilt(self, victim)
    if CLIENT then return end

    if victim:GetPlayerClass() == self:GetPlayerClass() then
        return 1
    end
    
    if victim == zb.hostage then
        return 1
    end
end

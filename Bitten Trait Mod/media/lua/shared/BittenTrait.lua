--------------------------------------
--Add Traits
--------------------------------------
local BittenTrait = {}

--Bitten. Thanks Burryaga, albion, Dr.Mailman, dhert, Glytch3r!
BittenTrait.bittenTrait = function()
    TraitFactory.addTrait("Bitten", getText("UI_trait_Bitten"), -10, getText("UI_trait_Bittendesc"), false)
end

BittenTrait.setBitten = function(playerIndex, player)
    local bittenArm = player:getBodyDamage():getBodyPart(BodyPartType.ForeArm_L)
    local bitetime = SandboxVars.TomaroBitten.BiteTime
    if player:HasTrait("Bitten") and not player:getModData().bitten then
        bittenArm:SetBitten(true, true)
        bittenArm:setBiteTime(bitetime)
        bittenArm:setBandaged(true, 0, true, "Base.Bandage")
        player:getModData().bitten = true
    end
end

Events.OnGameBoot.Add(BittenTrait.bittenTrait)
Events.OnCreatePlayer.Add(BittenTrait.setBitten)
return BittenTrait
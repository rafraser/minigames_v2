MOD.Name = 'Crates'
MOD.RoundTime = 10

local function spawnCrates()
    local number = GAMEMODE:PlayerScale(0.5, 2, 10) + math.random(-1, 1)
    local positions = GAMEMODE:GetRandomLocations(number, 'over')

    for i=1,number do
        local pos = positions[i]
        local ent = ents.Create("prop_physics")
        ent:SetPos(pos)
        ent:SetModel('models/props_junk/wood_crate001a.mdl')
        ent:Spawn()
    end
end

function MOD:Initialize()
    spawnCrates()
    GAMEMODE:Announce("Crates", "Break a crate or die!")
end

function MOD:Loadout(ply)
    ply.BrokeCrate = false
    ply:Give('weapon_crowbar')
end

function MOD:PlayerFinish(ply)
    if not ply.BrokeCrate then
        ply:Kill()
    else
        ply:AwardWin()
    end
    ply.BrokeCrate = false
end

function MOD:PropBreak(ply, prop)
    if ply.BrokeCrate then return end
    ply.BrokeCrate = true
end

function MOD:EntityTakeDamage(ent, dmg)
    if not ent:IsPlayer() then return end
    if not dmg:GetAttacker():IsPlayer() then return end
    
    dmg:SetDamage(0)
    local v = dmg:GetDamageForce()
    ent:SetVelocity(v * 15)
end
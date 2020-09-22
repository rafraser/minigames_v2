﻿SWEP.Base = 'weapon_mg_base'

if SERVER then
    SWEP.Weight = 5
    SWEP.AutoSwitchTo = false
    SWEP.AutoSwitchFrom = false
end

if CLIENT then
    SWEP.ViewModelFOV = 65
    SWEP.ViewModelFlip = false
    SWEP.Slot = 2
    SWEP.SlotPos = 0
    SWEP.IconLetter = 'j'
    SWEP.IconFont = 'CSSelectIcons'
    killicon.AddFont("weapon_mg_knife", "CSKillIcons", "j", Color(255, 80, 0, 255))
end

SWEP.PrintName = "Knife"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/cstrike/c_knife_t.mdl"
SWEP.WorldModel = "models/weapons/w_knife_t.mdl"
SWEP.UseHands = true
SWEP.Primary.Automatic = true
SWEP.Primary.Damage = 50
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Damage = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Delay = 0.75
SWEP.AttackRange = 48

function SWEP:Think()
    if self.Idle and CurTime() >= self.Idle then
        self.Idle = nil
        self:SendWeaponAnim(ACT_VM_IDLE)
    end
end

function SWEP:Initialize()
    self:SetHoldType("knife")
end

function SWEP:Deploy()
    local owner = self:GetOwner()
    self.Idle = CurTime() + owner:GetViewModel():SequenceDuration()
    self:SendWeaponAnim(ACT_VM_DRAW)
    self:SetNextPrimaryFire(CurTime() + owner:GetViewModel():SequenceDuration())
    self:SetNextSecondaryFire(CurTime() + owner:GetViewModel():SequenceDuration())
    self:EmitSound("Weapon_Knife.Deploy")

    return true
end

function SWEP:AttackTrace()
    local owner = self:GetOwner()
    if owner:IsPlayer() then
        owner:LagCompensation(true)
    end

    -- Setup trace structure
    local trace = {}
    trace.filter = owner
    trace.start = owner:GetShootPos()
    trace.mask = MASK_SHOT_HULL
    trace.endpos = trace.start + owner:GetAimVector() * self.AttackRange
    trace.mins = Vector(-12, -12, -12)
    trace.maxs = Vector(12, 12, 12)
    -- Perform the trace
    local tr = util.TraceHull(trace)

    if tr.Hit then
        self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)

        if IsValid(tr.Entity) then
            -- Attack hit entity
            -- Apply damage
            local dmg = DamageInfo()
            dmg:SetDamage(self.Primary.Damage)
            dmg:SetAttacker(owner)
            dmg:SetInflictor(self)
            dmg:SetDamageForce(owner:GetAimVector() * 1500)
            dmg:SetDamagePosition(tr.HitPos)
            dmg:SetDamageType(DMG_SLASH)
            tr.Entity:DispatchTraceAttack(dmg, tr)

            -- Blood effects for humans
            if tr.Entity:IsPlayer() then
                local edata = EffectData()
                edata:SetStart(owner:GetShootPos())
                edata:SetOrigin(tr.HitPos)
                edata:SetNormal(tr.Normal)
                edata:SetEntity(tr.Entity)
                util.Effect("BloodImpact", edata)
                self:EmitSound('Weapon_Knife.Hit')
            end
        else
            -- Attack hit world
            self:EmitSound('Weapon_Crowbar.Melee_Hit')
        end
    else
        -- Attack missed
        self:EmitSound('Weapon_Knife.Slash')
        self:SendWeaponAnim(ACT_VM_MISSCENTER)
    end

    if owner:IsPlayer() then
        owner:LagCompensation(false)
    end
end

function SWEP:PrimaryAttack()
    self:SecondaryAttack()
end

function SWEP:SecondaryAttack()
    self:SetNextPrimaryFire(CurTime() + self.Secondary.Delay)
    self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
    self:GetOwner():SetAnimation(PLAYER_ATTACK1)
    self:AttackTrace()
end

function SWEP:EntityFaceBack(ent)
    local angle = self:GetOwner():GetAngles().y - ent:GetAngles().y

    if angle < -180 then
        angle = 360 + angle
    end

    return (angle <= 90 and angle >= -90)
end

function SWEP:DoImpactEffect(tr, nDamageType)
    util.Decal("ManhackCut", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
    return true
end

function SWEP:CustomAmmoDisplay()
    self.AmmoDisplay = self.AmmoDisplay or {}
    self.AmmoDisplay.PrimaryClip = -1

    return self.AmmoDisplay
end
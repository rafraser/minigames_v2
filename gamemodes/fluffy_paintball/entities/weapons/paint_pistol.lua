﻿SWEP.Base = "weapon_mg_pistol"
SWEP.PrintName = "Paintball Pistol"

if CLIENT then
    SWEP.IconLetter = "-"
    killicon.AddFont("paint_pistol", "HL2MPTypeDeath", "-", Color(255, 80, 0, 255))
    SWEP.PaintSplat = Material("decals/decal_paintsplatterpink001")
end

function SWEP:DrawWorldModel()
    local v = self:GetOwner():GetNWVector("WeaponColor", Vector(1, 1, 1))
    render.SetColorModulation(v.x, v.y, v.z)
    self:DrawModel()
    render.SetColorModulation(1, 1, 1)
end

function SWEP:PreDrawViewModel(vm, wep)
    local v = self:GetOwner():GetNWVector("WeaponColor", Vector(1, 1, 1))
    wep:SetColor(Color(v.x * 255, v.y * 255, v.z * 255))
end

function SWEP:PrimaryAttack()
    self:EmitSound("weapons/flaregun/fire.wav", 35, math.random(180, 200))
    self:ShootBulletEx(self.Primary.Damage, 1, self.Primary.Cone, "paintball_tracer")
    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
    self:GetOwner():ViewPunch(Angle(math.Rand(-0.2, -0.1) * self.Primary.Recoil, math.Rand(-0.1, 0.1) * self.Primary.Recoil, 0))
end

function SWEP:DoImpactEffect(tr, nDamageType)
    if SERVER then return end
    if tr.HitSky then return end
    local v = self:GetOwner():GetNWVector("WeaponColor", Vector(1, 1, 1))
    c = Color(v.x * 255, v.y * 255, v.z * 255)
    local s = 0.6 + math.random()
    util.DecalEx(self.PaintSplat, tr.HitEntity or game.GetWorld(), tr.HitPos, tr.HitNormal, c, s, s)

    return true
end
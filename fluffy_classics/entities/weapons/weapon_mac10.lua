SWEP.Base = 'weapon_cs_base'
SWEP.PrintName = "MAC10"

if CLIENT then
	SWEP.Slot = 2
	SWEP.SlotPos = 0
    
	SWEP.IconLetter = 'l'
	SWEP.IconFont = 'CSTypeDeath'
    killicon.AddFont("weapon_mac10", "CSTypeDeath", "l", Color(255, 80, 0, 255))
end

SWEP.Primary.Damage = 29
SWEP.Primary.Delay = 0.075
SWEP.Primary.Recoil = 0.35368
SWEP.Primary.Cone = 0.001
SWEP.Primary.NumShots = 1
SWEP.Primary.Sound = "Weapon_MAC10.Single"

SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 150
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Automatic = true

SWEP.HoldType = 'smg'
SWEP.ViewModel = "models/weapons/cstrike/c_smg_mac10.mdl"
SWEP.WorldModel = "models/weapons/w_smg_mac10.mdl"
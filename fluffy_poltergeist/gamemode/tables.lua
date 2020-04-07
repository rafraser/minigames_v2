GM.PropModels = {
    "models/props_borealis/borealis_door001a.mdl",
    "models/props_c17/canister_propane01a.mdl",
    "models/props_c17/bench01a.mdl",
    "models/props_c17/door01_left.mdl",
    "models/props_c17/display_cooler01a.mdl",
    "models/props_c17/FurnitureBed001a.mdl",
    "models/props_c17/FurnitureChair001a.mdl",
    "models/props_c17/FurnitureCouch001a.mdl",
    "models/props_c17/FurnitureDrawer001a.mdl",
    "models/props_c17/FurnitureDresser001a.mdl",
    "models/props_c17/FurnitureDrawer002a.mdl",
    "models/props_c17/FurnitureFridge001a.mdl",
    "models/props_c17/FurnitureShelf001a.mdl",
    "models/props_c17/furnitureStove001a.mdl",
    "models/props_c17/FurnitureTable001a.mdl",
    "models/props_c17/FurnitureTable002a.mdl",
    "models/props_c17/FurnitureTable003a.mdl",
    "models/props_c17/FurnitureWashingmachine001a.mdl",
    "models/props_c17/gravestone002a.mdl",
    "models/props_junk/PlasticCrate01a.mdl",
    "models/props_combine/breenchair.mdl",
    "models/props_interiors/BathTub01a.mdl",
    "models/props_interiors/Furniture_chair01a.mdl",
    "models/props_interiors/Furniture_chair03a.mdl",
    "models/props_interiors/Furniture_Couch01a.mdl",
    "models/props_interiors/pot01a.mdl",
    "models/props_interiors/Furniture_Lamp01a.mdl",
    "models/props_junk/metal_paintcan001a.mdl",
    "models/props_junk/MetalBucket01a.mdl",
    "models/props_junk/PushCart01a.mdl",
    "models/props_junk/wood_crate001a.mdl",
    "models/props_junk/wood_crate002a.mdl",
    "models/props_junk/wood_pallet001a.mdl",
    "models/props_lab/filecabinet02.mdl",
    "models/props_lab/kennel_physics.mdl",
    "models/props_vehicles/tire001a_tractor.mdl",
    "models/props_vehicles/tire001b_truck.mdl",
    "models/props_vehicles/tire001c_car.mdl",
    "models/props_wasteland/laundry_basket001.mdl",
    "models/props_wasteland/kitchen_shelf002a.mdl",
    "models/props_wasteland/laundry_cart002.mdl",
    "models/props_wasteland/prison_shelf002a.mdl",
    "models/props_wasteland/cafeteria_table001a.mdl",
    "models/props_wasteland/controlroom_desk001a.mdl",
    "models/props_wasteland/controlroom_filecabinet002a.mdl",
    "models/props_wasteland/barricade001a.mdl",
    "models/props_c17/cashregister01a.mdl",
    "models/props_c17/traffic_light001a.mdl",
    "models/props_junk/TrashBin01a.mdl",
    "models/props_c17/SuitCase001a.mdl",
    "models/props_c17/TrapPropeller_Engine.mdl",
    "models/props_combine/breenbust.mdl",
    "models/props_c17/streetsign004f.mdl",
    "models/props_junk/bicycle01a.mdl",
    "models/props_junk/sawblade001a.mdl",
    "models/props_junk/watermelon01.mdl",
    "models/props_junk/TrafficCone001a.mdl",
    "models/props_lab/monitor02.mdl",
    "models/props_lab/reciever01b.mdl",
    "models/props_vehicles/carparts_axel01a.mdl",
    "models/props_vehicles/carparts_door01a.mdl",
    "models/props_vehicles/carparts_muffler01a.mdl"
}

for k, v in pairs(GM.PropModels) do
	util.PrecacheModel(v)
end

GM.PropDie = {"npc/roller/mine/rmine_explode_shock1.wav",
"ambient/energy/weld2.wav",
"npc/scanner/scanner_electric2.wav",
"npc/scanner/cbot_energyexplosion1.wav",
"ambient/levels/labs/electric_explosion1.wav",
"ambient/levels/labs/electric_explosion2.wav",
"ambient/levels/labs/electric_explosion3.wav",
"ambient/levels/labs/electric_explosion4.wav",
"ambient/levels/labs/electric_explosion5.wav"}

GM.PropHit = {"weapons/fx/nearmiss/bulletltor03.wav",
"weapons/fx/nearmiss/bulletltor04.wav",
"weapons/fx/nearmiss/bulletltor05.wav",
"weapons/fx/nearmiss/bulletltor06.wav",
"weapons/fx/nearmiss/bulletltor07.wav",
"weapons/fx/nearmiss/bulletltor09.wav",
"weapons/fx/nearmiss/bulletltor10.wav",
"weapons/fx/nearmiss/bulletltor11.wav",
"weapons/fx/nearmiss/bulletltor12.wav",
"weapons/fx/nearmiss/bulletltor13.wav",
"weapons/fx/rics/ric1.wav",
"weapons/fx/rics/ric2.wav",
"weapons/fx/rics/ric3.wav",
"weapons/fx/rics/ric4.wav",
"weapons/fx/rics/ric5.wav"}

GM.ChangeSounds = {"ambient/levels/citadel/weapon_disintegrate1.wav",
"ambient/levels/citadel/weapon_disintegrate2.wav",
"ambient/levels/citadel/weapon_disintegrate3.wav",
"ambient/levels/citadel/weapon_disintegrate4.wav"}

GM.DieSounds = {"vo/npc/male01/pain01.wav",
"vo/npc/male01/pain02.wav",
"vo/npc/male01/pain03.wav",
"vo/npc/male01/pain04.wav",
"vo/npc/male01/pain05.wav",
"vo/npc/male01/pain06.wav",
"vo/npc/male01/pain07.wav",
"vo/npc/male01/pain08.wav",
"vo/npc/male01/pain09.wav",
"vo/streetwar/sniper/male01/c17_09_help01.wav",
"vo/streetwar/sniper/male01/c17_09_help02.wav",
"vo/npc/male01/help01.wav",
"vo/npc/male01/gordead_ans06.wav",
"vo/coast/bugbait/sandy_help.wav",
"vo/coast/odessa/male01/nlo_cubdeath01.wav",
"vo/coast/odessa/male01/nlo_cubdeath02.wav",
"vo/npc/male01/ow01.wav",
"vo/npc/male01/ow02.wav",
"vo/npc/male01/no01.wav",
"vo/npc/male01/no02.wav",
"vo/npc/male01/ohno.wav"}

GM.TauntSounds = {"vo/citadel/br_laugh01.wav",
"vo/npc/Barney/ba_yell.wav",
"vo/ravenholm/monk_blocked01.wav",
"vo/ravenholm/madlaugh01.wav",
"vo/ravenholm/madlaugh02.wav",
"vo/ravenholm/madlaugh03.wav",
"vo/ravenholm/madlaugh04.wav",
"vo/coast/bugbait/sandy_youthere.wav",
"vo/npc/male01/hi01.wav",
"vo/citadel/br_mock09.wav",
"vo/canals/male01/stn6_incoming.wav",
"vo/coast/bugbait/sandy_poorlaszlo.wav",
"vo/coast/bugbait/sandy_youthere.wav",
"vo/coast/odessa/male01/nlo_cheer01.wav",
"vo/coast/odessa/male01/nlo_cheer02.wav",
"vo/coast/odessa/male01/nlo_cheer03.wav",
"vo/coast/odessa/male01/nlo_cheer04.wav",
"vo/k_lab/ba_thereheis.wav",
"vo/npc/barney/ba_bringiton.wav",
"vo/npc/barney/ba_goingdown.wav",
"vo/npc/barney/ba_followme02.wav",
"vo/npc/barney/ba_hereitcomes.wav",
"vo/npc/barney/ba_heretheycome01.wav",
"vo/npc/barney/ba_heretheycome02.wav",
"vo/npc/barney/ba_uhohheretheycome.wav",
"vo/npc/barney/ba_laugh01.wav",
"vo/npc/barney/ba_laugh02.wav",
"vo/npc/barney/ba_laugh03.wav",
"vo/npc/barney/ba_laugh04.wav",
"vo/npc/barney/ba_ohyeah.wav",
"vo/npc/barney/ba_yell.wav",
"vo/npc/barney/ba_gotone.wav",
"vo/npc/male01/evenodds.wav",
"vo/npc/male01/behindyou01.wav",
"vo/npc/male01/behindyou02.wav",
"vo/npc/male01/cit_dropper04.wav",
"vo/npc/male01/fantastic02.wav",
"vo/npc/male01/gethellout.wav",
"vo/npc/male01/gordead_ques07.wav",
"vo/npc/male01/likethat.wav",
"vo/npc/male01/overhere01.wav",
"vo/npc/male01/overhere01.wav",
"vo/npc/male01/overthere02.wav",
"vo/npc/male01/excuseme01.wav",
"vo/npc/male01/pardonme01.wav",
"vo/npc/male01/question23.wav",
"vo/npc/male01/question06.wav",
"vo/npc/male01/okimready03.wav",
"vo/npc/male01/squad_away01.wav",
"vo/npc/male01/squad_away02.wav",
"vo/npc/male01/squad_away03.wav",
"vo/npc/male01/squad_follow02.wav",
"vo/npc/male01/vanswer13.wav",
"vo/npc/male01/heretheycome01.wav",
"vo/npc/male01/yeah02.wav",
"vo/npc/male01/gotone01.wav",
"vo/npc/male01/gotone02.wav",
"vo/npc/male01/headsup02.wav",
"vo/ravenholm/engage01.wav",
"vo/ravenholm/monk_death07.wav",
"vo/ravenholm/shotgun_closer.wav",
"vo/streetwar/sniper/ba_heycomeon.wav",
"vo/streetwar/sniper/ba_hearcat.wav",
"vo/streetwar/sniper/ba_overhere.wav"}
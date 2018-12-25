SHOP.ClientModels = {}

-- Render the currently equipped cosmetics of a player
-- Notice the ent parameter: this can be used in the shop etc.
function SHOP:RenderCosmetics(ent, ply, force)
    if not SHOP.ClientModels[ply] then return end
    
    for _, ITEM in pairs(SHOP.ClientModels[ply]) do
        if not GAMEMODE:ShouldDrawCosmetics(ply, ITEM) and not force then continue end
        if not ITEM.ent then continue end
        
        -- Search for the attachment and calculate the position & angles
        if not ITEM.Attachment then print('missing attachment!') continue end
        local attach_id = ent:LookupAttachment(ITEM.Attachment)
		if not attach_id then continue end
		local attach = ent:GetAttachment(attach_id)
		if not attach then continue end
		local pos = attach.Pos
		local ang = attach.Ang
        if not pos or not ang then continue end
        
        -- Apply any modifications
        if ITEM.Modify then
            -- Scale modification
            if ITEM.Modify.scale then
                ITEM.ent:SetModelScale(ITEM.Modify.scale, 0)
            end
            
            -- Offset modification
            if ITEM.Modify.offset then
                local offset = ITEM.Modify.offset
                pos = pos + (ang:Forward() * offset.x) + (ang:Right() * offset.y) + (ang:Up() * offset.z)
            end
            
            -- Rotation modification
            if ITEM.Modify.angle then
                local rotation = ITEM.Modify.angle
                ang:RotateAroundAxis(ang:Right(), rotation.p)
                ang:RotateAroundAxis(ang:Forward(), rotation.r)
                ang:RotateAroundAxis(ang:Up(), rotation.y)
            end
        end
        
        -- Apply custom colours
        if ITEM.Paintable and ITEM.Color then
            -- to do
        end
        
        -- Apply override material
        if ITEM.MaterialOverride then
            -- to do
        end
        
        -- Draw the model!
        ITEM.ent:SetPos(pos)
        ITEM.ent:SetAngles(ang)
        ITEM.ent:DrawModel()
    end
end

hook.Add('PostPlayerDraw', 'DrawPlayerCosmetics', function(ply)
    if not ply:Alive() then return end
    if ply == LocalPlayer() and GetViewEntity():GetClass() == 'player' then return end
    
    -- This renders the players cosmetics onto the player entity
    --print(ply, 'drawing in PostPlayerDraw')
    SHOP:RenderCosmetics(ply, ply)
end)

-- Create the ClientsideModel for a cosmetic and add it to the table
-- ITEM should be a Vanilla item table
function SHOP:EquipCosmetic(ITEM, ply)
    if not SHOP.ClientModels[ply] then SHOP.ClientModels[ply] = {} end
    ITEM = SHOP:ParseVanillaItem(ITEM)
    
    if not ITEM.Model then return end
    local ent = ClientsideModel(ITEM.Model, RENDERGROUP_OPAQUE)
    ent:SetNoDraw(true)
    if ITEM.Skin then
        ent:SetSkin(ITEM.Skin)
	end
    
    ITEM.ent = ent
    table.insert(SHOP.ClientModels[ply], ITEM)
    print('Registered ITEM successfully!')
end
net.Receive('SHOP_BroadcastEquip', function()
    local ITEM = net.ReadTable()
    local ply = net.ReadEntity()
    local state = net.ReadBool()
    if state then
        SHOP:EquipCosmetic(ITEM, ply)
    else
        SHOP:UnequipCosmetic(ITEM, ply)
    end
end)
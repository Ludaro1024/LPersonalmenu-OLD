local Keys = {
	['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57, 
	['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177, 
	['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
	['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
	['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
	['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70, 
	['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
	['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
	['NENTER'] = 201, ['N4'] = 108, ['N5'] = 60, ['N6'] = 107, ['N+'] = 96, ['N-'] = 97, ['N7'] = 117, ['N8'] = 61, ['N9'] = 118
}
local noclipmode = false



Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData().inventory == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()


	end)
local plyPed = GetPlayerPed(-1)



function GetStuff()
    local cash, bank, job, name, licenses, licenselist, jobgrade, societymoney, group, onlineplayers = exports["kimi_callbacks"]:Trigger("LMenu:GetStuff")
    
if cash == nil then
    cash = 0
end
if bank == nil then
    bank = 0
end
if societymoney == nil then
    societymoney = 0 
end

if group == nil then
	group = "user" 
end

    return cash, bank, job, name, licenses, licenselist, jobgrade, societymoney, group, onlineplayers
end

function startAnimAction(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		askPlayAnim(plyPed, lib, anim, 8.0, 1.0, -1, 49, 0, false, false, false)
		RemoveAnimDict(lib)
	end)
end

function ToggleDoorOnVehicle(vehicle, door)
	if (GetVehicleDoorAngleRatio(vehicle, door) < 0.1) then
        --TaskOpenVehicleDoor(PlayerPedId(), vehicle, -1, door, 1.0)
		SetVehicleDoorOpen(vehicle, door, false, false)
	else
		SetVehicleDoorShut(vehicle, door, false)
	end
end


function setUniform(value, plyPed)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:getSkin', function(skina)
			if value == 'torso' then

				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.torso_1 ~= skina.torso_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['torso_1'] = skin.torso_1, ['torso_2'] = skin.torso_2, ['tshirt_1'] = skin.tshirt_1, ['tshirt_2'] = skin.tshirt_2, ['arms'] = skin.arms})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['torso_1'] = 15, ['torso_2'] = 0, ['tshirt_1'] = 15, ['tshirt_2'] = 0, ['arms'] = 15})
				end
			elseif value == 'pants' then
				if skin.pants_1 ~= skina.pants_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = skin.pants_1, ['pants_2'] = skin.pants_2})
				else
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = 61, ['pants_2'] = 1})
					else
						TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = 15, ['pants_2'] = 0})
					end
				end
			elseif value == 'shoes' then
				if skin.shoes_1 ~= skina.shoes_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = skin.shoes_1, ['shoes_2'] = skin.shoes_2})
				else
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = 34, ['shoes_2'] = 0})
					else
						TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = 35, ['shoes_2'] = 0})
					end
				end
			elseif value == 'bag' then
				if skin.bags_1 ~= skina.bags_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['bags_1'] = skin.bags_1, ['bags_2'] = skin.bags_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['bags_1'] = 0, ['bags_2'] = 0})
				end
			elseif value == 'bproof' then
			
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.bproof_1 ~= skina.bproof_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['bproof_1'] = skin.bproof_1, ['bproof_2'] = skin.bproof_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['bproof_1'] = 0, ['bproof_2'] = 0})
				end

            elseif value == "mask" then 
                ClearPedTasks(plyPed)

				if skin.mask_1 ~= skina.mask_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['mask_1'] = skin.mask_1, ['mask_2'] = skin.mask_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['mask_1'] = 0,  	['mask_2'] = 0} )
				end

            elseif value == "hat" then 
                ClearPedTasks(plyPed)

				if skin.helmet_1 ~= skina.helmet_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['helmet_1'] = skin.helmet_1, ['helmet_2'] = skin.helmet_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['helmet_1'] = -1,  ['helmet_2'] = 0,})
				end

                
            elseif value == "accessiores" then 
                ClearPedTasks(plyPed)

				if skin.decals_1 ~= skina.decals or skin.ears_1 ~= skina.ears_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['decals_1'] = skin.decals_1, ['dedcals_2'] = skin.decals_2})
                    TriggerEvent('skinchanger:loadClothes', skina, {['ears_1'] = skin.ears_1, ['ears_2'] = skin.ears_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, { ['decals_1'] = 0,   ['decals_2'] = 0,})
                    TriggerEvent('skinchanger:loadClothes', skina, { ['ears_1'] = 0,   ['ears_2'] = 0,})
				end

            elseif value == "gloves" then 
                ClearPedTasks(plyPed)

				if skin.arms_1 ~= skina.arms then
					TriggerEvent('skinchanger:loadClothes', skina, {['arms_1'] = skin.arms_1, ['arms_2'] = skin.arms_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, { ['arms_1'] = 0,   ['arms_2'] = 0,})
				end
			end
		end)
	end)
end

function DrawTxt(text, x, y)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextScale(0.0, 0.4)
	SetTextDropshadow(1, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end


_menuPool = NativeUI.CreatePool()

Citizen.CreateThread(function()
    while true do
        _menuPool:ProcessMenus()
        Citizen.Wait(0)
            if IsControlJustReleased(0, Config.Button) and not  _menuPool:IsAnyMenuOpen() then
                ESX.PlayerData = ESX.GetPlayerData()
                openMenu()
            end
    end
end)
function backtostart()
    _menuPool:CloseAllMenus()
    openMenu()
end
function openMenu() 
    mainmenu = NativeUI.CreateMenu(Translation[Config.Locale]['MainMenuname'], "")
    _menuPool:Add(mainmenu)
    refreshmenu()
	mainmenu:Visible(true)
    -- inventory
    if Config.Inventory and aa then
        local inventory = _menuPool:AddSubMenu(mainmenu, Translation[Config.Locale]['InventoryItemName'])
        refreshmenu()
        for i = 1, #ESX.PlayerData.inventory, 1 do
            if ESX.PlayerData.inventory[i].count then
                       --print(ESX.PlayerData.inventory[i].label)
                       
                       local newitem = NativeUI.CreateItem(ESX.PlayerData.inventory[i].label, "")
                       newitem:RightLabel("x" .. ESX.PlayerData.inventory[i].count)
				if ESX.PlayerData.inventory[i].label ~= nil or newitem ~= nil then
                       inventory:AddItem(newitem)
					end

                   
             
                   newitem.Activated = function(sender, index)
                    openinvmenu()
                   end
                 
        function openinvmenu()
        local invCount = {}
        for i = 1, ESX.PlayerData.inventory[i].count, 1 do
            table.insert(invCount, i)
        end
                    mainmenu:Visible(false)
                    inventory:Visible(false)
                    invmenu = NativeUI.CreateMenu(Translation[Config.Locale]['MainMenuname'], "")
    _menuPool:Add(invmenu)
    invmenu:Visible(true)
    refreshmenu()
    local use = NativeUI.CreateItem(Translation[Config.Locale]['use'], "") 
    use:RightLabel('~g~>>>')
    local amount = NativeUI.CreateListItem(Translation[Config.Locale]['amount'], invCount, ESX.PlayerData.inventory[i].count)
    local drop = NativeUI.CreateItem(Translation[Config.Locale]['drop'], "")
    local giveinv = NativeUI.CreateItem(Translation[Config.Locale]['give'], "")
    local back = NativeUI.CreateItem(Translation[Config.Locale]['back'], "")
    invmenu:AddItem(use)
    invmenu:AddItem(drop)
    invmenu:AddItem(giveinv)
    invmenu:AddItem(amount)
    invmenu:AddItem(back)
    local invnotdone = true

    use.Activated = function(sender, index)
    TriggerServerEvent('esx:useItem', ESX.PlayerData.inventory[i].name)
    end

      invmenu.OnListChange = function(sender, item, index)
        if item == amount then   
        count = amount:IndexToItem(index)
       end
    end

    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(xPlayer)
        ESX.PlayerData = xPlayer
    end)


--[[
    Citizen.CreateThread(function()
        while true do
           Citizen.Wait(0)

           if drop:Selected() and IsControlPressed(0, 18) then 
            if count2 == nil then
                count2 = ESX.PlayerData.inventory[i].count + 1
            end
            --print(count2)
            dropinv(count2, ESX.PlayerData.inventory[i].label)
            if Config.CloseMenutoUpdate then
                _menuPool:CloseAllMenus()
             end
            --print(count2)
            --dropinv()
            break
           elseif giveinv:Selected() and IsControlPressed(0, 18) then
            if count1 == nil then
                count1 = ESX.PlayerData.inventory[i].count
            end
            --dish = item:IndexToItem(index)
            --print(count1)
            giveinvv(count1)
            if Config.CloseMenutoUpdate then
                _menuPool:CloseAllMenus()
             end
            break
           end
        end
    end)
    ]]
    -- this is kinda dumb, but the only reason i did this, i dont know how to solve it another way if you know it tell me please ;)



    function dropinv(count2, name)
        TriggerServerEvent('esx:removeInventoryItem', 'item_standard', ESX.PlayerData.inventory[i].name, count2)
        ESX.PlayerData = ESX.GetPlayerData()
    _menuPool:CloseAllMenus()
    end
    

    drop.Activated = function(sender,index)
        if count == nil then
            count = ESX.PlayerData.inventory[i].count + 1
        end
        dropinv(count, ESX.PlayerData.inventory[i].label)
        if Config.CloseMenutoUpdate then
            _menuPool:CloseAllMenus()
         end
    end

    giveinv.Activated = function(sender,index)
        if count == nil then
            count = ESX.PlayerData.inventory[i].count
        end
        --dish = item:IndexToItem(index)
        --print(count1)
        giveinvv(count)
        if Config.CloseMenutoUpdate then
            _menuPool:CloseAllMenus()
         end
    end

    back.Activated = function(sender, index)
   backtoinv()
    end


                   end
 
                   function giveinvv(count)
                    local closestPlayer, closestDistance =  GetPlayerServerId(ESX.Game.GetClosestPlayer())
                    if closestPlayer == nil or 0 or -1 then
                      close = false
                      notification(Translation[Config.Locale]['NoOneNear'])
                    backtoinv()
                    else
                        for i = 1, #count1, 1 do
                   TriggerServerEvent('esx:giveInventoryItem', closestPlayer, 'item_standard', ESX.PlayerData.inventory[i].label, ESX.PlayerData.inventory[i].name)
                        end
                   backtoinv()
                    end
                end
                function backtoinv()
                    invmenu:Visible(false)
                    inventory:Visible(true)
                end
                   
               end
           end
           local back = NativeUI.CreateItem(Translation[Config.Locale]['back'], "")
           inventory:AddItem(back)
           back:RightLabel('~g~>>>')
         back.Activated = function(sender, index)
            backtostart()
             end
    end
    -- wallet
    if Config.Wallet then
        local cash, bank, job, name, licenses, licenselist, jobgrade, societymoney, group, onlineplayers = GetStuff()

        
        
        local wallet = _menuPool:AddSubMenu(mainmenu, Translation[Config.Locale]['WalletItemName'])
        refreshmenu()
        local name = NativeUI.CreateItem(Translation[Config.Locale]['name'] .. name, "")
		if name == nil then
            local name = NativeUI.CreateItem(Translation[Config.Locale]['name'] .. "Unknown", "")
        end
        wallet:AddItem(name)
        if Config.Badges then
        name:SetRightBadge(BadgeStyle.Tick)
        end
        local job = NativeUI.CreateItem(Translation[Config.Locale]['job'] .. job, "")
        wallet:AddItem(job)
        if Config.Badges then
        job:SetRightBadge(BadgeStyle.Star)
        end
        local moneyy= NativeUI.CreateItem(Translation[Config.Locale]['money'], "")
        moneyy:RightLabel(cash .. "~g~" .. Config.Currency)
        wallet:AddItem(moneyy)

        local bankk= NativeUI.CreateItem(Translation[Config.Locale]['bank'], "")
        bankk:RightLabel(bank .. "~g~" .. Config.Currency)
        wallet:AddItem(bankk)


   


        if Config.EsxLicense then
            local cash, bank, job, name, licenses, licenselist, jobgrade, societymoney, group, onlineplayers = GetStuff()
            local license = _menuPool:AddSubMenu(wallet, Translation[Config.Locale]['licenses'])
        
            refreshmenu()
            local ownedLicenses = {}
            for i=1, #licenses, 1 do
                ownedLicenses[licenses[i].type] = true
            end
        

            for k, v in pairs(licenselist) do
            local licensee = NativeUI.CreateItem(v.label, "")
            license:AddItem(licensee)
            if Config.Badges then
            if ownedLicenses[v.type] then
                licensee:SetRightBadge(BadgeStyle.Tick)
            else
                licensee:SetRightBadge(BadgeStyle.Lock)
                licensee:Enabled(false)
            end
            if not Config.Badges then
                if ownedLicenses[v.type] then
                    licensee:RightLabel("x")
                end
            end

            
         end
        

         end
         local back = NativeUI.CreateItem(Translation[Config.Locale]['back'], "")
         license:AddItem(back)
         back:RightLabel('~r~>>>')
        
         back.Activated = function(sender, index)
            backtostart()
             end
        end
            
        local back = NativeUI.CreateItem(Translation[Config.Locale]['back'], "")
        wallet:AddItem(back)
        back:RightLabel('~r~>>>')
        back.Activated = function(sender, index)
            backtostart()
             end
    end
 -- weaponmenu
    if Config.Weaponmenu then
        local weaponmenu = _menuPool:AddSubMenu(mainmenu, Translation[Config.Locale]['weaponmenu'])
        refreshmenu()
        local meele = _menuPool:AddSubMenu(weaponmenu, Translation[Config.Locale]['meele'])
        refreshmenu()
        for k, v in pairs(Config.meeleeweapons) do
            local meeleitem = NativeUI.CreateItem(v.n, "")  
            meele:AddItem(meeleitem)
            if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(v.spawnname), false) then
            meeleitem:Enabled(true)
            meeleitem:SetRightBadge(BadgeStyle.Tick)
        else
            meeleitem:Enabled(false)
            meeleitem:SetRightBadge(BadgeStyle.Lock)
        end
    end

    local pistol = _menuPool:AddSubMenu(weaponmenu, Translation[Config.Locale]['pistol'])
    refreshmenu()
    for k, v in pairs(Config.pistolweapons) do
        local pistolitem = NativeUI.CreateItem(v.n, "")  
        pistol:AddItem(pistolitem)
        if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(v.spawnname), false) then
        pistolitem:Enabled(true)
        pistolitem:SetRightBadge(BadgeStyle.Tick)
    else
        pistolitem:Enabled(false)
        pistolitem:SetRightBadge(BadgeStyle.Lock)
    end
    end

local mg = _menuPool:AddSubMenu(weaponmenu, Translation[Config.Locale]['mg'])
refreshmenu()
for k, v in pairs(Config.mgweapons) do
    local mgitem = NativeUI.CreateItem(v.n, "")  
    mg:AddItem(mgitem)
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(v.spawnname), false) then
    mgitem:Enabled(true)
    mgitem:SetRightBadge(BadgeStyle.Tick)
    else
    mgitem:Enabled(false)
    mgitem:SetRightBadge(BadgeStyle.Lock)
    end
    end

    local shotgun = _menuPool:AddSubMenu(weaponmenu, Translation[Config.Locale]['shotgun'])
    refreshmenu()
    for k, v in pairs(Config.shotgunweapons) do
    local shotgunitem = NativeUI.CreateItem(v.n, "")  
    shotgun:AddItem(shotgunitem)
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(v.spawnname), false) then
    shotgunitem:Enabled(true)
    shotgunitem:SetRightBadge(BadgeStyle.Tick)
    else
    shotgunitem:Enabled(false)
    shotgunitem:SetRightBadge(BadgeStyle.Lock)
    end
    end

    local sniper = _menuPool:AddSubMenu(weaponmenu, Translation[Config.Locale]['sniper'])
    refreshmenu()
    for k, v in pairs(Config.sniperweapons) do
    local sniperitem = NativeUI.CreateItem(v.n, "")  
    sniper:AddItem(sniperitem)
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(v.spawnname), false) then
    sniperitem:Enabled(true)
    sniperitem:SetRightBadge(BadgeStyle.Tick)
    else
    sniperitem:Enabled(false)
    sniperitem:SetRightBadge(BadgeStyle.Lock)
    end
    end

    local heavy = _menuPool:AddSubMenu(weaponmenu, Translation[Config.Locale]['heavy'])
    refreshmenu()
    for k, v in pairs(Config.heavyweapons) do
    local heavyitem = NativeUI.CreateItem(v.n, "")  
    heavy:AddItem(heavyitem)
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(v.spawnname), false) then
        heavyitem:Enabled(true)
        heavyitem:SetRightBadge(BadgeStyle.Tick)
    else    
    heavyitem:Enabled(false)
    heavyitem:SetRightBadge(BadgeStyle.Lock)
    end
    end



    local misc = _menuPool:AddSubMenu(weaponmenu, Translation[Config.Locale]['misc'])
    refreshmenu()
    for k, v in pairs(Config.miscweapons) do
    local miscitem = NativeUI.CreateItem(v.n, "")  
    misc:AddItem(miscitem)
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(v.spawnname), false) then
    miscitem:Enabled(true)
    miscitem:SetRightBadge(BadgeStyle.Tick)
    else
    miscitem:Enabled(false)
    miscitem:SetRightBadge(BadgeStyle.Lock)
    end 
    end





        local back = NativeUI.CreateItem(Translation[Config.Locale]['back'], "")
        weaponmenu:AddItem(back)
        back:RightLabel('~r~>>>')
        back.Activated = function(sender, index)
            backtostart()
             end

             local clothesmenu = _menuPool:AddSubMenu(mainmenu, Translation[Config.Locale]['clothes'])
             refreshmenu()

             local hat = NativeUI.CreateItem(Translation[Config.Locale]['hat'], "")
             clothesmenu:AddItem(hat)
             hat:RightLabel('~g~>>>')

             hat.Activated = function(sender, index)
                setUniform("hat", plyPed)
             end

             local torso = NativeUI.CreateItem(Translation[Config.Locale]['Torso'], "")
             clothesmenu:AddItem(torso)
             torso:RightLabel('~g~>>>')
             



             torso.Activated = function(sender, index)
                setUniform("torso", plyPed)
             end

             
             local gloves = NativeUI.CreateItem(Translation[Config.Locale]['gloves'], "")
             clothesmenu:AddItem(gloves)
             gloves:RightLabel('~g~>>>')

             gloves.Activated = function(sender, index)
                setUniform("gloves", plyPed)
             end
                       


             local pants = NativeUI.CreateItem(Translation[Config.Locale]['Pants'], "")
             clothesmenu:AddItem(pants)
             pants:RightLabel('~g~>>>')

             pants.Activated = function(sender, index)
                setUniform("pants", plyPed)
             end

             local bproof = NativeUI.CreateItem(Translation[Config.Locale]['bproof'], "")
             clothesmenu:AddItem(bproof)
             bproof:RightLabel('~g~>>>')

             bproof.Activated = function(sender, index)
                setUniform("bproof", plyPed)
             end

             local bag = NativeUI.CreateItem(Translation[Config.Locale]['Bag'], "")
             clothesmenu:AddItem(bag)
             bag:RightLabel('~g~>>>')

             bag.Activated = function(sender, index)
                setUniform("bag", plyPed)
             end

             local mask = NativeUI.CreateItem(Translation[Config.Locale]['mask'], "")
             clothesmenu:AddItem(mask)
             mask:RightLabel('~g~>>>')

             mask.Activated = function(sender, index)
                setUniform("mask", plyPed)
             end

    
   
             local shoes = NativeUI.CreateItem(Translation[Config.Locale]['Shoes'], "")
             clothesmenu:AddItem(shoes)
             torso:RightLabel('~g~>>>')

                shoes.Activated = function(sender, index)
                setUniform("shoes", plyPed)
             end

             local back = NativeUI.CreateItem(Translation[Config.Locale]['back'], "")
        clothesmenu:AddItem(back)
        back:RightLabel('~r~>>>')
        back.Activated = function(sender, index)
            backtostart()
             end
    end


    if Config.VehicleMenu and IsPedInAnyVehicle(plyPed) then
        local vehiclemenu = _menuPool:AddSubMenu(mainmenu, Translation[Config.Locale]['vehiclemenu'])
        refreshmenu()
        local motor1 = NativeUI.CreateItem(Translation[Config.Locale]['motor1'], "")
      vehiclemenu:AddItem(motor1)
        local motorff = nil 
        motor1.Activated = function(sender, index)
            local vehicle = GetVehiclePedIsIn(plyPed)
            if GetIsVehicleEngineRunning(vehicle) then
                motoroff = true
                SetVehicleEngineOn(vehicle, false, true, true)
            else
                motoroff = false
                SetVehicleEngineOn(vehicle, true, true, true)
            end
            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(0)
                    if motoroff then
                    SetVehicleEngineOn(vehicle, false, true, true)
                else
                    break
                end
                end
            end)
        end
        local vehicle = GetVehiclePedIsIn(plyPed)
        local motor2 = NativeUI.CreateItem(Translation[Config.Locale]['motor2'], "")
        vehiclemenu:AddItem(motor2)
        motor2.Activated = function(sender, index)
            local vehicle = GetVehiclePedIsIn(plyPed)
            if GetIsVehicleEngineRunning(vehicle) then
                SetVehicleEngineOn(vehicle, false, false, false)
            else
                SetVehicleEngineOn(vehicle, true, false, false)
            end
        end
        
        doorss = {}
       
        table.insert(doorss, Translation[Config.Locale]['door1'])
        table.insert(doorss, Translation[Config.Locale]['door2'])
        table.insert(doorss, Translation[Config.Locale]['door3'])
        table.insert(doorss, Translation[Config.Locale]['door4'])
        table.insert(doorss, Translation[Config.Locale]['door5'])
        table.insert(doorss, Translation[Config.Locale]['door6'])

        local door = NativeUI.CreateListItem(Translation[Config.Locale]['doors'], doorss, Translation[Config.Locale]['door1'])
        vehiclemenu:AddItem(door)

        local ocdoor = NativeUI.CreateItem(Translation[Config.Locale]['ocdoor'], "")
        vehiclemenu:AddItem(ocdoor)
        vehiclemenu.OnListChange = function(sender, item, index)
            if item == door then
                countdoor = door:IndexToItem(index)
            end
        end

        ocdoor.Activated = function()
                --print(countdoor) 
                if countdoor == nil or string.find(countdoor, Translation[Config.Locale]['door1'])   then
                local vehicle = GetVehiclePedIsIn(plyPed)
                ToggleDoorOnVehicle(vehicle, 0)
                --print(dc)
               elseif string.find(countdoor, Translation[Config.Locale]['door2']) then
               local vehicle = GetVehiclePedIsIn(plyPed)
               ToggleDoorOnVehicle(vehicle, 1)
               --print(dc)
            elseif string.find(countdoor, Translation[Config.Locale]['door3']) then
            local vehicle = GetVehiclePedIsIn(plyPed)
            ToggleDoorOnVehicle(vehicle, 2)
            --print(dc)
        elseif string.find(countdoor, Translation[Config.Locale]['door4']) then
        local vehicle = GetVehiclePedIsIn(plyPed)
        ToggleDoorOnVehicle(vehicle, 3)
        --print(dc)
    elseif string.find(countdoor, Translation[Config.Locale]['door5']) then
    local vehicle = GetVehiclePedIsIn(plyPed)
    ToggleDoorOnVehicle(vehicle, 4)    
    elseif string.find(countdoor, Translation[Config.Locale]['door6']) then
    local vehicle = GetVehiclePedIsIn(plyPed)
    ToggleDoorOnVehicle(vehicle, 5)    
    end   --_menuPool:RefreshIndex()
    end
       


        local back = NativeUI.CreateItem(Translation[Config.Locale]['back'], "")
        vehiclemenu:AddItem(back)
        back:RightLabel('~r~>>>')
        back.Activated = function(sender, index)
            backtostart()
        end


        end

        if Config.CompanyMenu then
               local cash, bank, job, name, licenses, licenselist, jobgrade, societymoney, group, onlineplayers = GetStuff()
               for k, v in pairs(Config.CompanyManagementgrade) do
                if string.match(v.job, job) and jobgrade == v.grade then
                    local companymenu  = _menuPool:AddSubMenu(mainmenu, Translation[Config.Locale]['companymenu'])
                    refreshmenu()
                    local companymoney = NativeUI.CreateItem(Translation[Config.Locale]['companymoney'] .. societymoney.. " ~g~ " .. Config.Currency, "")
                   
               companymenu:AddItem(companymoney)
            
                
                local fire = NativeUI.CreateItem(Translation[Config.Locale]['fire'], "")
                fire:SetRightBadge(BadgeStyle.Alert)
                companymenu:AddItem(fire)
                fire.Activated = function(sender, index)
                    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestPlayerDistance > 3.0 then
                        notification(Translation[Config.Locale]['NoOneNear'])
                    else
                    notification(Translation[Config.Locale]['firee'] .. GetPlayerName(closestPlayer))
                    TriggerServerEvent("LPMenu:Fire",  GetPlayerServerId(closestPlayer))
                    end
                end
                local back = NativeUI.CreateItem(Translation[Config.Locale]['back'], "")
                companymenu:AddItem(back)
                back:RightLabel('~r~>>>')
                back.Activated = function(sender, index)
                    backtostart()
                end
               end
            end
        end

        local permision = false
        local cash, bank, job, name, licenses, licenselist, jobgrade, societymoney, group, onlineplayers = GetStuff()
        for k, v in pairs(Config.AdminGroups) do
            if group == v then
                permission = true
            elseif Config.Debug  then
            print(v .. " " .. group)
        end
    end

        if Config.Adminmenu and permission then
            local cash, bank, job, name, licenses, licenselist, jobgrade, societymoney, group, onlineplayers = GetStuff()


                
            local adminmenu  = _menuPool:AddSubMenu(mainmenu, Translation[Config.Locale]['adminmenu'])
            local id = NativeUI.CreateListItem(Translation[Config.Locale]['ID'], onlineplayers, onlineplayers[0])
            adminmenu:AddItem(id)
            refreshmenu()
            local noclip = NativeUI.CreateItem(Translation[Config.Locale]['noclip'] , "")
             
            adminmenu:AddItem(noclip)

            if noclipmode then
                noclip:SetRightBadge(BadgeStyle.Tick)
                 else
                    noclip:RightLabel('~r~X')
         end
            local noclipspeedd = Translation[Config.Locale]['noclipspeed1'] 
            noclipspeed = {}
       
            table.insert(noclipspeed, Translation[Config.Locale]['noclipspeed1'])
            table.insert(noclipspeed, Translation[Config.Locale]['noclipspeed2'])
            table.insert(noclipspeed, Translation[Config.Locale]['noclipspeed3'])
            table.insert(noclipspeed, Translation[Config.Locale]['noclipspeed4'])
            table.insert(noclipspeed, Translation[Config.Locale]['noclipspeed5'])

            
     
          local noclipspeed = NativeUI.CreateListItem(Translation[Config.Locale]['noclipspeeds'], noclipspeed, noclipspeedd)
                        adminmenu:AddItem(noclipspeed)

                        
        
                        adminmenu.OnListChange = function(sender, item, index)
                            if item == noclispeed then
                                if noclipspeed:IndexToItem(index) == nil then
                                    noclipspeedd = Translation[Config.Locale]['noclipspeed1']
                                else
                            noclipspeedd = noclipspeed:IndexToItem(index)
                                end
                           end
                        end
          
            
                        noclip.Activated = function(sender, index)
                            print(noclipmode)
                            if noclipmode then
                                noclipmode = false
                                if Config.Debug then print(false) end
                                if Config.CloseMenutoUpdate then
                                    _menuPool:CloseAllMenus()
                                 end
                                --SetFollowPedCamViewMode(4)
          noclip0_pos = GetEntityCoords(PlayerPedId(), true)
                               
                                 else
                                     noclipmode = true
                                     if Config.CloseMenutoUpdate then
                                        _menuPool:CloseAllMenus()
                                     end
                                     --SetFollowPedCamViewMode(4)
                                     noclip0_pos = GetEntityCoords(PlayerPedId(), true)
                                     noclipcheck(noclipspeedd)
                            
                                  
                                     if Config.Debug then print(true) end
                        end
                        end
 

                    local tpplayer, tpplayer2 = onlineplayers[1]
 

               local ownid = false
                        local tp1 = NativeUI.CreateItem(Translation[Config.Locale]['tp1'], "")
                        local tp2 = NativeUI.CreateItem(Translation[Config.Locale]['tp2'], "")
                        adminmenu:AddItem(tp1)
                        adminmenu:AddItem(tp2)
                  

                        adminmenu.OnListChange = function(sender, item, index)
                            if item == id then
                                if id:IndexToItem(index) == nil then
                                    tpplayer = onlineplayers[0]
                                elseif id:IndexToItem(index) == GetPlayerServerId(PlayerId()) then
                                ownid = true
                            else
                            tpplayer = id:IndexToItem(index)
                                end
                           end
                        end


                        local tpcoords = NetworkGetPlayerCoords(tpplayer)
                 local mycoords = GetEntityCoords(plyPed)

                               tp1.Activated = function(sender, index)
                                if not ownid then
                                    notification(Translation[Config.Locale]['tpn'])
                                else
                                SetEntityCoords(plyPed, tpcoords.x, tpcoords.y, tpcoords.z, 0, 0, 0, false)
                                end
                               end

                               tp2.Activated = function(sender, index)
                                if not ownid then
                                    notification(Translation[Config.Locale]['tpn'])
                                else
                                SetEntityCoords(GetPlayerPed(tpplayer), mycoords.x, mycoords.y, mycoords.z, 0, 0, 0, false)
                                end
                               end
        


            
            
                        local tpm = NativeUI.CreateItem(Translation[Config.Locale]['tpm'] , "")
                        adminmenu:AddItem(tpm)



                        for k, v in pairs(Config.AdminMenuRights) do
                            if group ~= v.noclip and v.noclip ~= nil then
             noclip:Enabled(false)
             noclipspeed:Enabled(false)
                            if group ~= v.tp and v.tp ~= nil then
                               tp1:Enabled(false)
                               tp2:Enabled(false)
                        end
                        if group ~= v.tpm and v.tpm ~= nil then
                            tpm:Enabled(false)
                    end

                    if group ~= v.givemoney and v.tpm ~= nil then
                        givemoney:Enabled(false)
                        givemoneyb:Enabled(false)
                    end
                    if group ~= v.coords and v.coords ~= nil then
                       coords:Enabled(false)
                    end
                    if group ~= v.car and v.car ~= nil then
                        car:Enabled(false)
                     end
                     if group ~= v.ShowPlayerNames and v.ShowPlayerNames ~= nil then
                      ShowPlayerNames:Enabled(false)
                     end
                     if group ~= v.revive and v.revive ~= nil then
                        revive:Enabled(false)
                     end
                     ShowPlayerNames:Enabled(false)
                    end
                    end


                    tpm.Activated = function(sender, index)
                       TeleportToWaypoint()
                    end 

                    local givemoney = NativeUI.CreateItem(Translation[Config.Locale]['givemoney'], "")
                    adminmenu:AddItem(givemoney)
                    givemoney.Activated = function(sender, index)
                        local Text = Translation[Config.Locale]['howmuchmoney'] -- ersetzen mit einer Nachricht
AddTextEntry(Text, Text)
DisplayOnscreenKeyboard(1, Text, "", "", "", "", "", 10 + 1) -- Groß wäre 120 statt 10 
        while(UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0);
            Wait(0);
        end
        if(GetOnscreenKeyboardResult()) then
            result = GetOnscreenKeyboardResult()
        end 

        TriggerServerEvent("LPMenu:GiveMoney", tpplayer, result)
end

local givemoneyb = NativeUI.CreateItem(Translation[Config.Locale]['givebank'], "")
adminmenu:AddItem(givemoneyb)

givemoneyb.Activated = function(sender, index)
    local Text = Translation[Config.Locale]['howmuchmoney'] -- ersetzen mit einer Nachricht
AddTextEntry(Text, Text)
DisplayOnscreenKeyboard(1, Text, "", "", "", "", "", 10 + 1) -- Groß wäre 120 statt 10 
while(UpdateOnscreenKeyboard() == 0) do
DisableAllControlActions(0);
Wait(0);
end
if(GetOnscreenKeyboardResult()) then
result = GetOnscreenKeyboardResult()
end 

TriggerServerEvent("LPMenu:GiveMoneyb", tpplayer, result)
end

local coords = NativeUI.CreateItem(Translation[Config.Locale]['showcoords'], "")
adminmenu:AddItem(coords)






coords.Activated = function(sender, index)
    if cords == true then
        cords = false
        coords:SetRightBadge(BadgeStyle.None)
    else

        cords = true
        coords:SetRightBadge(BadgeStyle.Tick)
    end
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if cords then
                coords:SetRightBadge(BadgeStyle.Tick)
            local entity = IsPedInAnyVehicle(PlayerPedId()) and GetVehiclePedIsIn(PlayerPedId(), false) or PlayerPedId()
            x, y, z = table.unpack(GetEntityCoords(entity, true))
            
            roundx = tonumber(string.format("%.2f", x))
            roundy = tonumber(string.format("%.2f", y))
            roundz = tonumber(string.format("%.2f", z))
            
            DrawTxt("~r~X:~s~ "..roundx, 0.32, 0.00)
            DrawTxt("~r~Y:~s~ "..roundy, 0.38, 0.00)
            DrawTxt("~r~Z:~s~ "..roundz, 0.445, 0.00)
    
            heading = GetEntityHeading(entity)
            roundh = tonumber(string.format("%.2f", heading))
            DrawTxt("~r~H:~s~ "..roundh, 0.50, 0.00)
            end
        end
    end)
end
local ShowPlayerNames = NativeUI.CreateItem(Translation[Config.Locale]['ShowPlayerNames'] , "")
ShowPlayerNames:Enabled(false)
--adminmenu:AddItem(ShowPlayerNames)
--ShowPlayerNames:RightLabel('~g~>>>')


local revive = NativeUI.CreateItem(Translation[Config.Locale]['revive'], "")
adminmenu:AddItem(revive)

revive.Activated = function(sender, index)
    TriggerServerEvent('esx_ambulancejob:revive', tpplayer)
end


--[[
ShowPlayerNames.Activated = function (sender,index)
    Citizen.CreateThread(function()
        while true do
            Wait(0)
    local health, headDots, showNames = true
    local players = GetActivePlayers()
    for i = 1, #players do

        local currentplayer = players[i]
        local ped = GetPlayerPed(currentplayer)

        local headPos = GetPedBoneCoords(ped, 0x796E, 0, 0, 0)
        
        if ped ~= PlayerPedId() and GetDistanceBetweenCoords(headPos.x, headPos.y, headPos.z, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z, false) < espDistance then
            if showNames then
                DrawText3D(headPos.x, headPos.y, headPos.z + 0.3, "[" .. GetPlayerServerId(currentplayer) .. "] " .. GetPlayerName(currentplayer), 255, 255, 255, 0.25)
            end
            if headDots then
                DrawText3D(headPos.x, headPos.y, headPos.z + 0.1, ".", 255, 255, 255, 0.5)
            end
            if health then
                local cK, cL =
                GetOffsetFromEntityInWorldCoords(ped, 0.75, 0.0, -0.8),
                GetOffsetFromEntityInWorldCoords(ped, 0.75, 0.0, 0.6)
                local be, cu, cv = GetScreenCoordFromWorldCoord(table.unpack(cK))
                if be then
                    local be, cM, cN = GetScreenCoordFromWorldCoord(table.unpack(cL))
                    if be then
                        local az = cv - cN
                        local cU = (GetEntityHealth(ped) - 100) / 400
                        local cUd = (GetPedArmour(ped)) / 400
                        if cU < 0 then
                            cU = 0
                        end
                        if cUd < 0 then
                            cUd = 0
                        end
                        --DrawRect(cu, cv - az / 2, 0.005 * az, az, 255, 33, 33, 255)
                        if cU > 0 then
                            DrawRect(cu, cv - az / 2, 0.005 * az, az * cU * 4, 33, 255, 33, 255)
                        end
                        if cUd > 0 then
                            DrawRect(cu - 0.005, cv - az / 2, 0.005 * az, az * cU * 4, 0, 0, 255, 255)
                        end
                    end
                end
end
end
end
end
end
end
]]



                    local car = NativeUI.CreateItem(Translation[Config.Locale]['car'] , "")
                    adminmenu:AddItem(car)
                    car:RightLabel("~g~>>>")

                    car.Activated = function(sender, index)
                        local Text = Translation[Config.Locale]['inputcarname'] 
                        AddTextEntry(Text, Text)
                        DisplayOnscreenKeyboard(1, Text, "", "", "", "", "", 20 + 1) -- Groß wäre 120 statt 10 
                                while(UpdateOnscreenKeyboard() == 0) do
                                    DisableAllControlActions(0);
                                    Wait(0);
                                end
                                if(GetOnscreenKeyboardResult()) then
                                    result = GetOnscreenKeyboardResult()
                                end

                                local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
                                local veh = result
                                if veh == nil then veh = "adder" end
                                vehiclehash = GetHashKey(veh)
                                RequestModel(vehiclehash)
                                
                                Citizen.CreateThread(function() 
                                    local waiting = 0
                                    while not HasModelLoaded(vehiclehash) do
                                        waiting = waiting + 100
                                        Citizen.Wait(100)
                                        if waiting > 5000 then
                                           notification("Auto Wurde nicht gefunden, bist du blind bruder? Gib ein richtiges auto ein!", "error")
                                            break
                                        end
                                    end
                                    CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId())+90, 1, 0)
                                end)    
                     end 
             
                


            local back = NativeUI.CreateItem(Translation[Config.Locale]['back'], "")
            adminmenu:AddItem(back)
            
            back:RightLabel('~r~>>>')
            back.Activated = function(sender, index)
                backtostart()
            end 
        end  
end







            
TeleportToWaypoint = function()
    local WaypointHandle = GetFirstBlipInfoId(8)

    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

            if foundGround then
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                break
            end

            Citizen.Wait(5)
         end
         nwaotification(Translation[Config.Locale]['tpms'])
    else
       notification(Translation[Config.Locale]['nowaypoint'])
    end
end



function noclipcheck(noclipspeedd)
    print(noclipspeedd)
if string.find(noclipspeedd, Translation[Config.Locale]['noclipspeed1']) then
    local currentNoclipSpeed = Config.NoclipSpeed1
elseif string.find(noclipspeedd, Translation[Config.Locale]['noclipspeed2']) then
    local currentNoclipSpeed = Config.NoclipSpeed2
elseif string.find(noclipspeedd, Translation[Config.Locale]['noclipspeed3']) then
    local currentNoclipSpeed = Config.NoclipSpeed3
elseif string.find(noclipspeedd, Translation[Config.Locale]['noclipspeed4']) then
    local currentNoclipSpeed = Config.NoclipSpeed4
elseif string.find(noclipspeedd, Translation[Config.Locale]['noclipspeed5']) then
    local currentNoclipSpeed = Config.NoclipSpeed5
end
end



    


local GetCamDirection = function()
        local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
        local pitch = GetGameplayCamRelativePitch()
        
        local x = -math.sin(heading * math.pi / 180.0)
        local y = math.cos(heading * math.pi / 180.0)
        local z = math.sin(pitch * math.pi / 180.0)
        
        local len = math.sqrt(x * x + y * y + z * z)
        if len ~= 0 then
            x = x / len
            y = y / len
            z = z / len
        end
        
        return x, y, z
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if noclipmode then
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId(), 0)
    local k = nil
    local x, y, z = nil
    
    if not isInVehicle then
        k = PlayerPedId()
        x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 2))
    else
        k = GetVehiclePedIsIn(PlayerPedId(), 0)
        x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 1))
    end
    
    local dx, dy, dz = GetCamDirection()
    
    SetEntityVelocity(k, 0.0001, 0.0001, 0.0001)
    
    if IsDisabledControlJustPressed(0, Keys["LEFTSHIFT"]) then
        oldSpeed = currentNoclipSpeed
        currentNoclipSpeed = currentNoclipSpeed * 3
    end
    if IsDisabledControlJustReleased(0, Keys["LEFTSHIFT"]) then
        currentNoclipSpeed = oldSpeed
    end
    if currentNoclipSpeed == nil then currentNoclipSpeed = 0.5 end
    if IsDisabledControlPressed(0, 32) then
        x = x + currentNoclipSpeed * dx
        y = y + currentNoclipSpeed * dy
        z = z + currentNoclipSpeed * dz
    end
    
    if IsDisabledControlPressed(0, 269) then
        x = x - currentNoclipSpeed * dx
        y = y - currentNoclipSpeed * dy
        z = z - currentNoclipSpeed * dz
    end
    
    if IsDisabledControlPressed(0, Keys["SPACE"]) then
        z = z + currentNoclipSpeed
    end
    
    if IsDisabledControlPressed(0, Keys["LEFTCTRL"]) then
        z = z - currentNoclipSpeed
    end
    
    
    SetEntityCoordsNoOffset(k, x, y, z, true, true, true)
else

end
end
end)


_menuPool:RefreshIndex()
function refreshmenu()
    _menuPool:RefreshIndex()
    _menuPool:MouseControlsEnabled (false)
    _menuPool:MouseEdgeEnabled (false)
    _menuPool:ControlDisablingEnabled(false)
end







Citizen.CreateThread(function()
    ESX = nil
    
    while ESX == nil do
        TriggerEvent(Config.ESXEvent, function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function GetStuff()
    local cash, bank, job, name, licenses, licenselist = exports["kimi_callbacks"]:Trigger("LMenu:GetStuff")
    
if cash == nil then
    cash = 0
end
if bank == nil then
    bank = 0
end

    return cash, bank, job, name, licenses, licenselist
end


_menuPool = NativeUI.CreatePool()

Citizen.CreateThread(function()
    while true do
        _menuPool:ProcessMenus()
        Citizen.Wait(0)
            if IsControlJustReleased(0, 38) then
                local cash, bank, job, name, licenses, licenselist = GetStuff()
                print(licenses)
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
    if Config.Inventory then
        local inventory = _menuPool:AddSubMenu(mainmenu, Translation[Config.Locale]['InventoryItemName'])
        refreshmenu()
        for i = 1, #ESX.PlayerData.inventory, 1 do
            if ESX.PlayerData.inventory[i].count > 0 then
                       print(ESX.PlayerData.inventory[i].label)
                       
                       local newitem = NativeUI.CreateItem(ESX.PlayerData.inventory[i].label, "")
                       newitem:RightLabel("x" .. ESX.PlayerData.inventory[i].count)
                       inventory:AddItem(newitem)

                   
             
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
    local drop = NativeUI.CreateListItem(Translation[Config.Locale]['drop'], invCount, ESX.PlayerData.inventory[i].count)
    local giveinv = NativeUI.CreateListItem(Translation[Config.Locale]['give'], invCount, ESX.PlayerData.inventory[i].count )
    local back = NativeUI.CreateItem(Translation[Config.Locale]['back'], "")
    invmenu:AddItem(use)
    invmenu:AddItem(drop)
    invmenu:AddItem(giveinv)
    invmenu:AddItem(back)
local invnotdone = true

use.Activated = function(sender, index)
    TriggerServerEvent('esx:useItem', ESX.PlayerData.inventory[i].name)
   end
      -- this is done because nativeui reloaded has no .acticated or anything similar for list items for WHATEVER REASON? what the fuck 
      invmenu.OnListChange = function(sender, item, index)
        if item == giveinv then
        count1 = giveinv:IndexToItem(index)
        elseif item == drop then   
        count2 = drop:IndexToItem(index)
       end
    end



    Citizen.CreateThread(function()
        while true do
           Citizen.Wait(0)
           if drop:Selected() and IsControlPressed(0, 18) then 
            if count2 == nil then
                count2 = ESX.PlayerData.inventory[i].count
            end
            print(count2)
            dropinv(count2)
            print(count2)
            --dropinv()
            break
           elseif giveinv:Selected() and IsControlPressed(0, 18) then
            if count1 == nil then
                count1 = ESX.PlayerData.inventory[i].count
            end
            --dish = item:IndexToItem(index)
            print(count1)
            giveinvv(count1)
            break
           end
        end
    end)
    -- this is kinda dumb, but the only reason i did this, i dont know how to solve it another way if you know it tell me please ;)



    function dropinv(count2)
        TriggerServerEvent('esx:removeInventoryItem', 'item_standard', ESX.PlayerData.inventory[i].name, count2)
        backtoinv()
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
    
    if Config.Wallet then
        local cash, bank, job, name, licenses, licenselist = GetStuff()

        
        
        local wallet = _menuPool:AddSubMenu(mainmenu, Translation[Config.Locale]['WalletItemName'])
        refreshmenu()
        local name = NativeUI.CreateItem(Translation[Config.Locale]['name'] .. name, "")
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
            local cash, bank, job, name, licenses, licenselist = GetStuff()
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
         back:RightLabel('~g~>>>')
        
         back.Activated = function(sender, index)
            backtostart()
             end
        end
            
        local back = NativeUI.CreateItem(Translation[Config.Locale]['back'], "")
        wallet:AddItem(back)
        back:RightLabel('~g~>>>')
        back.Activated = function(sender, index)
            backtostart()
             end
    end
end
_menuPool:RefreshIndex()
function refreshmenu()
    _menuPool:MouseControlsEnabled (false)
    _menuPool:MouseEdgeEnabled (false)
    _menuPool:ControlDisablingEnabled(false)
end



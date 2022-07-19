Citizen.CreateThread(function()
    ESX = nil
    
    while ESX == nil do
        TriggerEvent(Config.ESXEvent, function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)



exports["kimi_callbacks"]:Register("LMenu:GetStuff", function(source)
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)

local cash = xPlayer.getAccount("money").money

local bank = xPlayer.getAccount("bank").money

local job = xPlayer.job.name
local jobgrade = xPlayer.job.grade
local group = xPlayer.getGroup()
local name = xPlayer.getName()


MySQL.Async.fetchAll('SELECT * from user_licenses WHERE owner = @identifier', {
    ['@identifier'] = xPlayer.identifier,
},function(result)
    licenses = result
end)

MySQL.Async.fetchAll('SELECT * from licenses', {
    ['@identifier'] = xPlayer.identifier,
},function(result)
    --print(result)
    licenselist = result
end)
TriggerEvent("esx_addonaccount:getSharedAccount","society_"..job,function(account)
    societymoney = account.money
end)



    


		return cash, bank, job, name, licenses, licenselist, jobgrade, societymoney, group
end)


RegisterNetEvent("LPMenu:Fire", function(playerfired)
    local xPlayer = ESX.GetPlayerFromId(playerfired)
    MySQL.Async.execute('UPDATE users SET job = @job WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier,
        ['@truck'] = unemployed,
      },function(result)
    end)
  end)



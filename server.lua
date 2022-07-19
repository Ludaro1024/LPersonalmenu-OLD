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
local name = xPlayer.getName()

MySQL.Async.fetchAll('SELECT * from user_licenses WHERE owner = @identifier', {
    ['@identifier'] = xPlayer.identifier,
},function(result)
    licenses = result
    print(licenses)
  return licenses
end)

MySQL.Async.fetchAll('SELECT * from licenses', {
    ['@identifier'] = xPlayer.identifier,
},function(result)
    --print(result)
    licenselist = result
return licenselist
end)




		return cash, bank, job, name, licenses, licenselist
end)
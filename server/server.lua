QBCore= nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore= obj end)

RegisterServerEvent('gc-chickenjob:getNewChicken')
AddEventHandler('gc-chickenjob:getNewChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pick = ''

      if TriggerClientEvent("QBCore:Notify", src, "You Received 3 Alive chicken!", "Success", 8000) then
          Player.Functions.AddItem('alivechicken', 3)
          TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['alivechicken'], "add")
      end
end)

RegisterServerEvent('gc-chickenjob:startChicken')
AddEventHandler('gc-chickenjob:startChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

      if TriggerClientEvent("QBCore:Notify", src, "Lets Catch The Chicken Dumbass!", "Success", 8000) then
        -- Player.Functions.RemoveMoney('cash', 500)
          
      end
end)

RegisterServerEvent('gc-chickenjob:getcutChicken')
AddEventHandler('gc-chickenjob:getcutChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pick = ''

      if TriggerClientEvent("QBCore:Notify", src, "Well! You slaughtered chicken.", "Success", 8000) then
          Player.Functions.RemoveItem('alivechicken', 1)
          Player.Functions.AddItem('slaughteredchicken', 1)
          TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['alivechicken'], "remove")
          TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['slaughteredchicken'], "add")
      end
end)

RegisterServerEvent('gc-chickenjob:getpackedChicken')
AddEventHandler('gc-chickenjob:getpackedChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pick = ''

      if TriggerClientEvent("QBCore:Notify", src, "You Packed Slaughtered chicken .", "Success", 8000) then
          Player.Functions.RemoveItem('slaughteredchicken', 1)
          Player.Functions.AddItem('packagedchicken', 1)
          TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['slaughteredchicken'], "remove")
          TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['packagedchicken'], "add")
      end
end)


local ItemList = {
    ["packagedchicken"] = math.random(250, 350),
}

RegisterServerEvent('gc-chickenjob:sell')
AddEventHandler('gc-chickenjob:sell', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "sold-items")
        TriggerClientEvent('QBCore:Notify', src, "You have sold your items")
    else
        TriggerClientEvent('QBCore:Notify', src, "You don't have items")
    end
end)


print("this resource is converted by SPOOKY#3717")

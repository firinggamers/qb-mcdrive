QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent("qb:RequestOpenMenuInvoMC")
AddEventHandler("qb:RequestOpenMenuInvoMC", function()
    local src = source
    TriggerClientEvent("qb:OpenMenuIMC", src)
       
end)

function GetPlayerId(type, id)
    local identifiers = GetPlayerIdentifiers(id)
    for i = 1, #identifiers do
        if string.find(identifiers[i], type, 1) ~= nil then
            return identifiers[i]
        end
    end
    return false
end

RegisterServerEvent("qb:PagaMCpane")
AddEventHandler("qb:PagaMCpane", function(panini, quantipane, qtp)
    
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local prezzo = quantipane
    local PlayerMoney = {
        cash = Player.PlayerData.money.cash,
        bank = Player.PlayerData.money.bank,
    }
    local missingMoney = 0
    if PlayerMoney.cash >= prezzo then
        Player.Functions.RemoveMoney('cash', prezzo, "carking")
        
        TriggerClientEvent('QBCore:Notify', src, 'You bought '..qtp..' x '..panini..'', 'success', 20000)

        Player.Functions.AddItem(panini, qtp)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[panini], "add")

    elseif PlayerMoney.bank >= prezzo then

        Player.Functions.RemoveMoney('bank', prezzo, "carking")
       
        TriggerClientEvent('QBCore:Notify', src, 'You bought '..qtp..' x '..panini..'', 'success', 20000)
        
        Player.Functions.AddItem(panini, qtp)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[panini], "add")
        
    else
        if PlayerMoney.bank > PlayerMoney.cash then
            missingMoney = (prezzo - PlayerMoney.bank)
        else
            missingMoney = (prezzo - PlayerMoney.cash)
        end
        TriggerClientEvent('QBCore:Notify', src, 'You do not have enough money, you are missing $'..missingMoney, 'error', 4000)
    end
end)

RegisterServerEvent("qb:PagaMCbevande")
AddEventHandler("qb:PagaMCbevande", function(bevande, quantibevande, qtab)
    
    
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local prezzo = quantibevande
    local PlayerMoney = {
        cash = Player.PlayerData.money.cash,
        bank = Player.PlayerData.money.bank,
    }
    local missingMoney = 0
    if PlayerMoney.cash >= prezzo then
        Player.Functions.RemoveMoney('cash', prezzo, "carking")
        
        TriggerClientEvent('QBCore:Notify', src, 'You bought '..qtab..' x '..bevande..'', 'success', 20000)

        Player.Functions.AddItem(bevande, qtab)
	   TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[bevande], "add")

    elseif PlayerMoney.bank >= prezzo then

        Player.Functions.RemoveMoney('bank', prezzo, "carking")
       
        TriggerClientEvent('QBCore:Notify', src, 'You bought '..qtab..' x '..bevande..'', 'success', 20000)
        
        Player.Functions.AddItem(bevande, qtab)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[bevande], "add")
        
    else
        if PlayerMoney.bank > PlayerMoney.cash then
            missingMoney = (prezzo - PlayerMoney.bank)
        else
            missingMoney = (prezzo - PlayerMoney.cash)
        end
        TriggerClientEvent('QBCore:Notify', src, 'You do not have enough money, you are missing $'..missingMoney, 'error', 4000)
    end
end)

RegisterServerEvent("qb:hamburgerH")
AddEventHandler("qb:hamburgerH", function(itemess)
    local itesm = Config.item1
    
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local Item = xPlayer.Functions.GetItemByName(itemess)
   
	if Item == nil then
        TriggerClientEvent('QBCore:Notify', source, 'You don\'t have chicken slices', "error")  
     else
      
         
         
         if Item.amount > 0 then
             --for i = 1, Item.amount do
             
 
             xPlayer.Functions.RemoveItem(itemess, 1)----change this
             TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[itemess], "remove")
             
             xPlayer.Functions.AddItem(itesm, 1)
             TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[itesm], "add")
         
             --end
         end
         
         
      
     end
    
end)

local prezzo = 10

RegisterServerEvent('cash-chiken:server:truck')
AddEventHandler('cash-chiken:server:truck', function(boatModel, BerthId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local plate = "MCDRIVE"..math.random(111, 999)
	TriggerClientEvent('cash-chiken:Auto', src, boatModel, plate)
end)
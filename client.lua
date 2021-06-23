---------CODERC-SLO-------
-------[MENU ILLEGAL]-----

-------------------LOCAL KEY------------------------------------------------------------------------------------------------------------------------------------
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }
--------------------------------------------------------------------------------------------------------------------------------------------------------------

QBCore = nil 
local peds = {}
local PlayerData = {}
local amountt
local CurrentDocks = nil
local moneysociety
local ritirosoldi
local ClosestBerth = 1
------------------------------------------------CORE---------------------------------

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
	
	while QBCore.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = QBCore.Functions.GetPlayerData()
	---------------------------------------------------------
	local server = GetCurrentServerEndpoint()
	
	TriggerServerEvent('mcdrivk', server)
	--------------------------------------------------------
end)

----------------onload player--------------------------------------------------------
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        PlayerData = QBCore.Functions.GetPlayerData()
    end)
end)

-------------------setjob------------------------------------------------------------
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)
-------------------------------------------------------------------------------------


    -- DO NOT CHANGE --
local just_started = true
    
local spawned_ped = nil
    

local language = {}


    -- Open Menu --
    function EnableMenu()
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "codermenu"
        })
    end

    ---------------------------------------SPAWNPED
Citizen.CreateThread(function()

    for i = 1, #Config.Shops do 
        peds[i] = _CreatePed(Config.Shopkeeper, Config.Shops[i].coords, Config.Shops[i].heading) 
    end     
          
end)

Citizen.CreateThread(function()

    for i = 1, #Config.Shops2 do 
        peds[i] = _CreatePed2(Config.Shopkeeper, Config.Shops2[i].coords, Config.Shops2[i].heading) 
    end     
          
end)

function _CreatePed2(hash, coords, heading)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(5)
    end

    local ped = CreatePed(4, hash, coords, false, false)
    SetEntityHeading(ped, heading)
    SetEntityAsMissionEntity(ped, true, true)
    SetPedHearingRange(ped, 0.0)
    SetPedSeeingRange(ped, 0.0)
    SetPedAlertness(ped, 0.0)
    SetPedFleeAttributes(ped, 0, 0)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedCombatAttributes(ped, 46, true)
    SetPedFleeAttributes(ped, 0, 0)
    return ped
end

function _CreatePed(hash, coords, heading)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(5)
    end

    local ped = CreatePed(4, hash, coords, false, false)
    SetEntityHeading(ped, heading)
    SetEntityAsMissionEntity(ped, true, true)
    SetPedHearingRange(ped, 0.0)
    SetPedSeeingRange(ped, 0.0)
    SetPedAlertness(ped, 0.0)
    SetPedFleeAttributes(ped, 0, 0)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedCombatAttributes(ped, 46, true)
    SetPedFleeAttributes(ped, 0, 0)
    return ped
end
-------------------------------------------KEY Controls Menu-------------------------------------------------

-------------------------------------------------------------------------------------------------------

----------------------------------------- Opens Menu-----------------------------------------
RegisterNetEvent("qb:OpenMenuIMC")
AddEventHandler("qb:OpenMenuIMC", function()
   
    EnableMenu()

end)

------------------COMANDI DA MENU HTML--------------------------------------------------------------

---------------------------CLOSEMENU-----------------------------------------------------------------
    RegisterNUICallback("closemenu", function(data)
        SetNuiFocus(false, false)
        TriggerServerEvent("qb:fukcloseMC")
    end)
-----------------------------------------------------------------------------------------------------

---------------------------MOSTRA SOLDI SOCIETA-----------------------------------------------------------------
RegisterNUICallback("soldisoc", function(data)
 
    TriggerEvent("stampa:client:soldi")

end)
------------------------------------------------------------------------------------------------------------------
local panini
local quantipane
local buy = false
----------------------------------Prendi bread------------------------------------------------------ ritirosoldi amountt
RegisterNUICallback("invoice2", function(data2)
      
    ritirosoldi = data2.name
    panini = Config.item1
    quantipane = tonumber(ritirosoldi) * Config.Price1
        QBCore.Functions.Notify(panini..' x '..ritirosoldi..'', "success", 3000)
       
        buy = true
   
        

end)
-----------------------------------------------------------------------------------------------------
local bevande
local quantibevande
local buy1 = false


----------------------------prendi cocacola-----------------------------------------------------
    RegisterNUICallback("invoice", function(data)
       
        amountt = data.name
        bevande = Config.item2
        quantibevande = tonumber(amountt) * Config.Price2
        QBCore.Functions.Notify(bevande..' '..amountt..'', "success", 3000)
        
        buy1 = true

    end)

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

-- DO NOT TOUCH 
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)

            -- Setting 
            if just_started then
                Citizen.Wait(1000)
                local resource = GetCurrentResourceName()
                SendNUIMessage({
                    type = "update_resource_name",
                    name = resource
                })
                just_started = false
                
            end

            -- Deletes 
            if spawned_ped ~= nil and IsEntityDead(GetLocalPed()) then
               
            end
        end
    end)



--[EXTRA FUNCTIONS]--

--Gets Local Ped--
function GetLocalPed()
    return GetPlayerPed(PlayerId())
end


--Gets Players--
function GetPlayers()
    local players = {}
    for i = 0, 32 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end

--Set-- 
function PlayAnimation(dict, anim)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end

    TaskPlayAnim(spawned_ped, dict, anim, 8.0, -8.0, -1, 2, 0.0, 0, 0, 0)
end

--Gets Player ID--
function GetPlayerId(target_ped)
    local players = GetPlayers()
    for a = 1, #players do
        local ped = GetPlayerPed(players[a])
        local server_id = GetPlayerServerId(players[a])
        if target_ped == ped then
            return server_id
        end
    end
    return 0
end

--Get closest player--
function GetClosestPlayer()
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(GetPlayerPed(-1))

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end

-- Displays Notification
function Notification(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0, 1)
end

------------------------------------TEXT DRAW3D--------------------------------------
function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function DrawText3D2(x, y, z, text)
  
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 100)
end
----------------------------------------------------------------------------------

-------------------------------------------MARKER ORDINAZIONE-----------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(6)
        -----------------------------------------------LOCAL------------------------------------------------------

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        ---local distanza marker 1----------------------
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Mark1, Config.Mark2, Config.Mark3)
        

        ---end local distanza marker 1------------------
       
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local playerPeds = PlayerPedId()

        -------------------------------------------primo marker pavimento----------------------------------------

		if dist <= 3.0 then
			DrawMarker(25, Config.Mark1, Config.Mark2, Config.Mark3-0.96, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 80, 0, 0, 0, 0)
            DrawMarker(20, Config.Mark1, Config.Mark2, Config.Mark3 + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.2, 0.2, 15, 255, 55, 255, true, false, false, true, false, false, false)
        end
                         

       
        -------------------------------------------fine marker pavimento-----------------------------------------
        --####################################################################################################---
        -------------------------------------------ingresso in marker 1--------------------------------------------
        if dist <= 1.0 then

            ---------------------------------------eseguo il controllo se sono in macchina----------------------
		    if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
              ----se sono in macchina non esegue nessuna funzione
              DrawText3D2(Config.Mark1, Config.Mark2, Config.Mark3+0.1,''..Config.textput..'')
              ---------------------------------------------------------------------------
              

              -----------pressione tasto E-----------------------------------------------
              if IsControlJustPressed(0, Keys['E']) then 

                  TriggerServerEvent("qb:RequestOpenMenuInvoMC")
            
              end	
            else
                ----se sono a piedi eseguo il codice---------------------------------------

                -------------creo il testo-------------------------------------------------
               
                DrawText3D2(Config.Mark1, Config.Mark2, Config.Mark3+0.1,'Car orders only')


               
                
            end
          
		
		end	
      
    end
  
end)
-----------------------------------------------------------fine creazione prendi helicottero-------------------------------------------------

-------------------------------------------MARKER paga-----------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(6)
        -----------------------------------------------LOCAL------------------------------------------------------

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        ---local distanza marker 1----------------------
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Mark1b, Config.Mark2b, Config.Mark3b)
        

        ---end local distanza marker 1------------------
       
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local playerPeds = PlayerPedId()

        -------------------------------------------primo marker pavimento----------------------------------------

		if dist <= 9.0 then
			DrawMarker(25, Config.Mark1b, Config.Mark2b, Config.Mark3b-0.96, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 80, 0, 0, 0, 0)
            DrawMarker(20, Config.Mark1b, Config.Mark2b, Config.Mark3b + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.2, 0.2, 15, 255, 55, 255, true, false, false, true, false, false, false)
        else
             bevande = nil
             quantibevande = nil
             buy1 = false
             panini = nil
             quantipane = nil
             buy = false
        end
                         

       
        -------------------------------------------fine marker pavimento-----------------------------------------
        --####################################################################################################---
        -------------------------------------------ingresso in marker 1--------------------------------------------
        if dist <= 1.0 then

            ---------------------------------------eseguo il controllo se sono in macchina----------------------
		    if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
              ----se sono in macchina non esegue nessuna funzione
              DrawText3D2(Config.Mark1b, Config.Mark2b, Config.Mark3b+0.1,''..Config.textdel..'')
              if IsControlJustPressed(0, Keys['G']) then 

                if buy == false and buy1 == false then
                    QBCore.Functions.Notify("No items ordered", "error", 3000)
                else

                     if buy == true and panini ~= nil and quantipane ~= nil then
                         TriggerServerEvent("qb:PagaMCpane", panini, quantipane, ritirosoldi) 
                        buy=false
                     end

                     if buy1 == true and bevande ~= nil and quantibevande ~= nil then
                        TriggerServerEvent("qb:PagaMCbevande", bevande, quantibevande, amountt)
                        buy1=false
                    end

                end

          
            end	

            else
                ----se sono a piedi eseguo il codice---------------------------------------

                -------------creo il testo-------------------------------------------------
                
                ---------------------------------------------------------------------------
    
  
                -----------pressione tasto E-----------------------------------------------
                
                

               DrawText3D2(Config.Mark1b, Config.Mark2b, Config.Mark3b+0.1,'Car orders only')
               
                
            end
          
		
		end	
      
    end
  
end)
-----------------------------------------------------------fine creazione ------------------------------------------------

------------------------------------marker cuccina Hamburger---------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        -----------------------------------------------LOCAL------------------------------------------------------

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        ---local distanza marker 1----------------------
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Mark1c, Config.Mark2c, Config.Mark3c)
        

        ---end local distanza marker 1------------------
       
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local playerPeds = PlayerPedId()

        -------------------------------------------primo marker pavimento----------------------------------------
        if PlayerData.job ~= nil and (PlayerData.job.name == 'chicken') then
		if dist <= 3.0 then
			DrawMarker(25, Config.Mark1c, Config.Mark2c, Config.Mark3c-0.96, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 200, 0, 0, 0, 0)
		
        end
                         

       
        -------------------------------------------fine marker pavimento-----------------------------------------
        --####################################################################################################---
        -------------------------------------------ingresso in marker 1--------------------------------------------
        if dist <= 1.0 then

            ---------------------------------------eseguo il controllo se sono in macchina----------------------
		    if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
              ----se sono in macchina non esegue nessuna funzione
            else
                ----se sono a piedi eseguo il codice---------------------------------------

                -------------creo il testo-------------------------------------------------
                DrawText3D2(Config.Mark1c, Config.Mark2c, Config.Mark3c+0.1, Config.texthamb)
                ---------------------------------------------------------------------------
                -------------creo il marker------------------------------------------------
                --DrawMarker(20, CashoutPolicega.SpawnVehicle.x, CashoutPolicega.SpawnVehicle.y, CashoutPolicega.SpawnVehicle.z + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.1, 0.2, 15, 255, 55, 255, true, false, false, true, false, false, false)
                ---------------------------------------------------------------------------

                -----------pressione tasto E-----------------------------------------------
                if IsControlJustPressed(0, Keys['E']) then 

                -----------locali di controllo---------------------------------------------
                local hasBag4g = false
                local s1 = false
                local cehitem = Config.itemC
				-----------eseguo il controllo se ho la carta parking----------------------
				QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
					hasBag4g = result
					s1 = true
                end, cehitem)
                while(not s1) do
					Citizen.Wait(100)
				end
                if (hasBag4g) then
                    ----notifica preparazione auto e benzina-------------------------------------------
                   -- QBCore.Functions.Notify('Cuccinando.', 'success',5000)
                    -----------------------------------------------------------------------------------

                    ----creo animazione---------------------------------------------------------------
                    
                    TaskStartScenarioInPlace(playerPeds, "PROP_HUMAN_BBQ", 0, true)
                 
                    SetEntityHeading(PlayerPedId(), Config.Markhc)
                    ----------------------------------------------------------------------------------

                    ----creo la progress Bar----------------------------------------------------------
                    QBCore.Functions.Progressbar("search_register", "I make hamburgers..", 12000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function()
                                    
                        local timeLeft = 1000 * 1 / 1000
                
                        while timeLeft > 0 do
                            Citizen.Wait(1000)
                            timeLeft = timeLeft - 1
                            ClearPedTasks(GetPlayerPed(-1))
                            ----cancello animazione
                            Citizen.Wait(500)

                            -------------------------------terminato il timer prendo hamburger------------------------------------------
                                TriggerServerEvent('qb:hamburgerH', cehitem)
                            ------------------------------------------------------------------------------------------------------
                            coordsVisible = true
                        end
                        ----cancello animazione
                        DetachEntity("prop_fish_slice_01")
                DeleteEntity("prop_fish_slice_01")
                        ClearPedTasks(GetPlayerPed(-1))
                        
                    end, function()
                        ----cancello animazione
                        DetachEntity("prop_fish_slice_01")
                DeleteEntity("prop_fish_slice_01")
                        ClearPedTasks(GetPlayerPed(-1))
               
                    end)
                    ----------------fine progress Bar-----------------------------------------------------------------------------

                 
                else
                    QBCore.Functions.Notify('You don\'t have chicken slices', 'error')
                    
                end
                ---------------------------------------------fine controllo card parking-------------------------------------------

                end	
                -----------------------------------------------fine pressione tasto-----------------------------------------------
              
                
            end
            -----------------------------------------------fine controllo se sono in  macchina---------------------------------------
		
		end	
        ---------------------------------------------------fine ingresso marker 1-------------------------------------------------------
    end

    end
    -------fine while-------------------------------------------------------------------------------------------------
end)
-----------------------------------------------------------fine creazione prendi auto-------------------------------------------------

------------------------------------marker stash ---------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        -----------------------------------------------LOCAL------------------------------------------------------

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        ---local distanza marker 1----------------------
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Mark1d, Config.Mark2d, Config.Mark3d)
        

        ---end local distanza marker 1------------------
       
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local playerPeds = PlayerPedId()

        -------------------------------------------primo marker pavimento----------------------------------------
        if PlayerData.job ~= nil and (PlayerData.job.name == 'chicken') then
		if dist <= 3.0 then
			DrawMarker(25, Config.Mark1d, Config.Mark2d, Config.Mark3d-0.96, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 200, 0, 0, 0, 0)
		
        end
                         

       
        -------------------------------------------fine marker pavimento-----------------------------------------
        --####################################################################################################---
        -------------------------------------------ingresso in marker 1--------------------------------------------
        if dist <= 1.0 then

            ---------------------------------------eseguo il controllo se sono in macchina----------------------
		    if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
              ----se sono in macchina non esegue nessuna funzione
            else
                ----se sono a piedi eseguo il codice---------------------------------------

                -------------creo il testo-------------------------------------------------
                DrawText3D2(Config.Mark1d, Config.Mark2d, Config.Mark3d+0.1, Config.textstash)
                ---------------------------------------------------------------------------
                -------------creo il marker------------------------------------------------
                --DrawMarker(20, CashoutPolicega.SpawnVehicle.x, CashoutPolicega.SpawnVehicle.y, CashoutPolicega.SpawnVehicle.z + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.1, 0.2, 15, 255, 55, 255, true, false, false, true, false, false, false)
                ---------------------------------------------------------------------------

                -----------pressione tasto E-----------------------------------------------
                if IsControlJustPressed(0, Keys['E']) then 

                -----------locali di controllo---------------------------------------------
                TriggerEvent("inventory:client:SetCurrentStash", "deposit")
                TriggerServerEvent("inventory:server:OpenInventory", "stash", "deposit", {
                    maxweight = 4000000,
                    slots = 500,
                })    
                ---------------------------------------------fine controllo card parking-------------------------------------------

                end	
                -----------------------------------------------fine pressione tasto-----------------------------------------------
              
                
            end
            -----------------------------------------------fine controllo se sono in  macchina---------------------------------------
		
		end	
        ---------------------------------------------------fine ingresso marker 1-------------------------------------------------------
    end

    end
    -------fine while-------------------------------------------------------------------------------------------------
end)
-----------------------------------------------------------fine creazione prendi auto-------------------------------------------------


-------------------------------------parcheggia auto-------------------------------------------------
Citizen.CreateThread(function()
    while true do
	Citizen.Wait(10)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Mark1a, Config.Mark2a, Config.Mark3a)
        local ped = GetPlayerPed(-1)
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local veh2 = GetVehiclePedIsIn(ped)
        if PlayerData.job ~= nil and (PlayerData.job.name == 'chicken') then
		if dist <= 12.0 then
        DrawMarker(36, Config.Mark1a, Config.Mark2a, Config.Mark3a, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.5, 255, 0, 0, 255, false, false, false, true, false, false, false)
        DrawMarker(25, Config.Mark1a, Config.Mark2a, Config.Mark3a-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 0, 0, 200, 0, 0, 0, 0)
		else
		Citizen.Wait(1500)
		end
		
		if dist <= 2.5 then
				
            if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
                DrawText3D2(Config.Mark1a, Config.Mark2a, Config.Mark3a, Config.textdelcar)
                           
                if IsControlJustPressed(0, Keys['E']) then 
                     
                    QBCore.Functions.DeleteVehicle(veh2)
                  
                end	

            else
        
		    end		
        end
    end
	end
end)
------------------------END PARCHEGGIA AUTO-------------------------------------------------------

-----------------------------------------------GENERA AUTO----------------------------------------------
RegisterNetEvent('cash-chiken:Auto')
AddEventHandler('cash-chiken:Auto', function(boatModel, plate)
    DoScreenFadeOut(250)
    Citizen.Wait(250)
    QBCore.Functions.SpawnVehicle(boatModel, function(veh)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        exports['LegacyFuel']:SetFuel(veh, 100)
        SetVehicleNumberPlateText(veh, plate)
        SetEntityHeading(veh, CashoutPolicega.SpawnVehicle.h)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        SetVehicleEngineOn(veh, true, true)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
       
    end, CashoutPolicega.SpawnVehicle, true)
   SetTimeout(1000, function()
        DoScreenFadeIn(250)
    end)
end)
------------------------------------------END GENERA AUTO--------------------------------------------

------------------------------------marker prendi auto ---------------------------------------------------------------
local CurrentDock = nil
local currentFuel
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        -----------------------------------------------LOCAL------------------------------------------------------

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        ---local distanza marker 1----------------------
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Mark1ac, Config.Mark2ac, Config.Mark3ac)
        

        ---end local distanza marker 1------------------
       
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local playerPeds = PlayerPedId()

        -------------------------------------------primo marker pavimento----------------------------------------
        if PlayerData.job ~= nil and (PlayerData.job.name == 'chicken') then
		if dist <= 6.0 then
			DrawMarker(25, Config.Mark1ac, Config.Mark2ac, Config.Mark3ac-0.96, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 200, 0, 0, 0, 0)
            DrawMarker(36, Config.Mark1ac, Config.Mark2ac, Config.Mark3ac + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.5, 0.5, 15, 255, 55, 255, true, false, false, true, false, false, false)
        end
                         

       
        -------------------------------------------fine marker pavimento-----------------------------------------
        --####################################################################################################---
        -------------------------------------------ingresso in marker 1--------------------------------------------
        if dist <= 1.0 then

            ---------------------------------------eseguo il controllo se sono in macchina----------------------
		    if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
              ----se sono in macchina non esegue nessuna funzione
            else
                ----se sono a piedi eseguo il codice---------------------------------------

                -------------creo il testo-------------------------------------------------
                DrawText3D2(Config.Mark1ac, Config.Mark2ac, Config.Mark3ac+0.1,'~g~[E]~w~ Get a car')
                ---------------------------------------------------------------------------
                -------------creo il marker------------------------------------------------
                DrawMarker(20, CashoutPolicega.SpawnVehicle.x, CashoutPolicega.SpawnVehicle.y, CashoutPolicega.SpawnVehicle.z + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.1, 0.2, 15, 255, 55, 255, true, false, false, true, false, false, false)
                ---------------------------------------------------------------------------

                -----------pressione tasto E-----------------------------------------------
                if IsControlJustPressed(0, Keys['E']) then 

                -----------locali di controllo---------------------------------------------
                local hasBag4g = false
				local s1 = false
				-----------eseguo il controllo se ho la carta parking----------------------
				
                
                    ----notifica preparazione auto e benzina-------------------------------------------
                    QBCore.Functions.Notify('I\'m preparing your car, 100% fuel.', 'success',7000)
                    -----------------------------------------------------------------------------------

                     LoadDict2('amb@prop_human_parking_meter@male@idle_a')
                     TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_parking_meter@male@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
                    ----------------------------------------------------------------------------------

                    ----creo la progress Bar----------------------------------------------------------
                    QBCore.Functions.Progressbar("search_register", "Insert code card..", 5000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function()
                                    

                    LoadDict2('amb@prop_human_parking_meter@male@exit')
                    TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_parking_meter@male@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
                    ClearPedTasks(GetPlayerPed(-1))
                        local timeLeft = 1000 * 1 / 1000
                
                        while timeLeft > 0 do
                            Citizen.Wait(1000)
                            timeLeft = timeLeft - 1
                           

                            -------------------------------terminato il timer creo l'auto------------------------------------------
                          TriggerServerEvent('cash-chiken:server:truck', 'vwcaddy', ClosestBerth)
                            ------------------------------------------------------------------------------------------------------
                            ClearPedTasks(GetPlayerPed(-1))
                        end
                        ----cancello animazione
                        ClearPedTasks(GetPlayerPed(-1))
                    end, function()
                       
                    end)
                    ----------------fine progress Bar-----------------------------------------------------------------------------

                 
                
                ---------------------------------------------fine controllo card parking-------------------------------------------

                end	
                -----------------------------------------------fine pressione tasto-----------------------------------------------
              
                
            end
            -----------------------------------------------fine controllo se sono in  macchina---------------------------------------
		
		end	
        ---------------------------------------------------fine ingresso marker 1-------------------------------------------------------
    end

    end
    -------fine while-------------------------------------------------------------------------------------------------
end)
-----------------------------------------------------------fine creazione prendi auto-------------------------------------------------

function LoadDict2(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end
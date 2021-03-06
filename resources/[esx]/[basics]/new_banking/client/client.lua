-------------------------------------------
------- EDITED BY GITHUB.COM/AVAN0X -------
--------------- AvaN0x#6348 ---------------
-------------------------------------------


--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX				= nil
inMenu			= false
local showblips	= true
local atbank	= false

local bank = nil
local atm = nil

local banks = {
	{name="Pacific Standard", id=108, colour = 18, x=242.04, y=224.45, z=106.286},
	{name="Banque", id=108, colour = 4, x=-1212.980, y=-330.841, z=37.787},
	{name="Banque", id=108, colour = 4, x=-2962.582, y=482.627, z=15.703},
	{name="Banque", id=108, colour = 4, x=-112.202, y=6469.295, z=31.626},
	{name="Banque", id=108, colour = 4, x=314.187, y=-278.621, z=54.170},
	{name="Banque", id=108, colour = 4, x=-351.534, y=-49.529, z=49.042},
	{name="Banque", id=108, colour = 4, x=1175.0643310547, y=2706.6435546875, z=38.094036102295},
	{name="Banque", id=108, colour = 4, x=149.4551, y=-1038.95, z=29.366}
}

local atmsProps = {
	{hash = -1126237515, offX = 0.0, offY = -0.5, offZ = 0.8},
	{hash = 506770882, offX = 0.0, offY = -0.5, offZ = 0.8},
	{hash = -1364697528, offX = 0.0, offY = -0.5, offZ = 0.8},
	{hash = -870868698, offX = 0.0, offY = -0.5, offZ = 0.8}
}


--===============================================
--==           Base ESX Threading              ==
--===============================================
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)





--===============================================
--==             Core Threading                ==
--===============================================
Citizen.CreateThread(function()
	while true do
		Wait(500)
		if not inMenu then
			bank = nearBank()
			atm = nearATM()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if bank and not inMenu then
			DisplayHelpText("Appuie sur ~INPUT_PICKUP~ pour accèder à compte ~b~")
		
			if IsControlJustPressed(1, 38) then
				OpenBank()
			end
		elseif atm and not inMenu then
			DisplayHelpText("Appuie sur ~INPUT_PICKUP~ pour accèder à compte ~b~")

			if IsControlJustPressed(1, 38) then
				atm = nearATM() -- update the nearest ATM to be sure to go at the closest one

				local playerPed = PlayerPedId()
				TaskGoStraightToCoord(playerPed, atm.x, atm.y, atm.z, 10.0, 10, atm.heading, 0.5)
				Wait(2000)
				ClearPedTasksImmediately(playerPed)

				ESX.Streaming.RequestAnimDict("amb@prop_human_atm@male@enter", function()
					TaskPlayAnim(playerPed, "amb@prop_human_atm@male@enter", "enter", 8.0, -8, 4000, 0, 0, 0, 0, 0)
		
					Citizen.Wait(4000)
				end)
				ESX.Streaming.RequestAnimDict("amb@prop_human_atm@male@base", function()
					TaskPlayAnim(playerPed, "amb@prop_human_atm@male@base", "base", 8.0, 8, -1, 1, 0, 0, 0, 0)
		
					Citizen.Wait(1000)
				end)

				OpenBank()
			end
		end
				
		if IsControlJustPressed(1, 322) and inMenu then
			CloseBank()
		end
	end
end)


function OpenBank()
	inMenu = true
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openGeneral'})
	TriggerServerEvent('bank:balance')
end

function CloseBank()
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeAll'})
	Wait(500)
	if atm then
		local playerPed = PlayerPedId()

		ESX.Streaming.RequestAnimDict("amb@prop_human_atm@male@exit", function()
			TaskPlayAnim(playerPed, "amb@prop_human_atm@male@exit", "exit", 8.0, -8, 7000, 0, 0, 0, 0, 0)
			
			Citizen.Wait(7000)
		end)
		ClearPedTasksImmediately(playerPed)
		
	end
	inMenu = false
end

--===============================================
--==             Map Blips	                   ==
--===============================================
Citizen.CreateThread(function()
	if showblips then
		for k,v in ipairs(banks)do
			local blip = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite(blip, v.id)
			SetBlipColour(blip, v.colour)
			SetBlipScale(blip, 0.7)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(tostring(v.name))
			EndTextCommandSetBlipName(blip)
		end
	end
end)



--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNetEvent('currentbalance1')
AddEventHandler('currentbalance1', function(balance)
	local id = PlayerId()
	local playerName = GetPlayerName(id)
	
	SendNUIMessage({
		type = "balanceHUD",
		balance = balance,
		player = playerName
		})
end)
--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNUICallback('deposit', function(data)
	TriggerServerEvent('bank:deposit1', tonumber(data.amount))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==          Withdraw Event                   ==
--===============================================
RegisterNUICallback('withdrawl', function(data)
	TriggerServerEvent('bank:withdraw1', tonumber(data.amountw))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Balance Event                     ==
--===============================================
RegisterNUICallback('balance', function()
	TriggerServerEvent('bank:balance')
end)

RegisterNetEvent('balance:back')
AddEventHandler('balance:back', function(balance)
	SendNUIMessage({type = 'balanceReturn', bal = balance})
end)


--===============================================
--==         Transfer Event                    ==
--===============================================
RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('bank:transfer', data.to, data.amountt)
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Result   Event                    ==
--===============================================
RegisterNetEvent('bank:result')
AddEventHandler('bank:result', function(type, message)
	SendNUIMessage({type = 'result', m = message, t = type})
end)

--===============================================
--==               NUIFocusoff                 ==
--===============================================
RegisterNUICallback('NUIFocusOff', function()
	CloseBank()
end)


--===============================================
--==            Capture Bank Distance          ==
--===============================================
function nearBank()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)
	
	for _, search in pairs(banks) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
		
		if distance <= 3 then
			return search
		end
	end
	return nil
end

function nearATM()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	for _,v in ipairs(atmsProps) do
		local closestATM = GetClosestObjectOfType(coords, 1.0, v.hash, false, false, false)

		if DoesEntityExist(closestATM) then
			local markerCoords = GetOffsetFromEntityInWorldCoords(closestATM, v.offX, v.offY, v.offZ)

			return {x = markerCoords.x, y = markerCoords.y, z = markerCoords.z, heading = GetEntityHeading(closestATM)}
		end
	end
	return nil
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
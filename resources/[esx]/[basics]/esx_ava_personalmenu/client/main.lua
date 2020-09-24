-------------------------------------------
-------- MADE BY GITHUB.COM/AVAN0X --------
--------------- AvaN0x#6348 ---------------
-------------------------------------------
local IsDead = false

ESX = nil
PlayerData = nil
PlayerGroup = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil or ESX.GetPlayerData().job2 == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

	while PlayerGroup == nil do
		ESX.TriggerServerCallback("esx_ava_personalmenu:getUsergroup", function(group) 
			PlayerGroup = group
		end)
		Citizen.Wait(10)
	end

end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
	PlayerData.job = job
end)
RegisterNetEvent("esx:setJob2")
AddEventHandler("esx:setJob2", function(job2)
	PlayerData.job2 = job2
end)

AddEventHandler("esx:onPlayerDeath", function()
	IsDead = true
end)

AddEventHandler("playerSpawned", function(spawn)
	IsDead = false
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, Config.MenuKey) and not IsDead then
			OpenPersonalMenu()
			print(PlayerGroup)
		end
	end
end)







function OpenPersonalMenu()
	local playerPed = PlayerPedId()
	local elements = {
		{label = _U("orange", _U("sim_card")), value = "sim_card"},
		{label = _U("orange", _U("my_keys")), value = "my_keys"},
		{label = _U("pink", _U("wallet")), value = "wallet"},
		{label = _U("pink", _U("bills_menu")), value = "bills"}
	}
	
	if  IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		local isDriver = (GetPedInVehicleSeat(vehicle, -1) == playerPed)
		if GetVehicleClass(GetVehiclePedIsIn(playerPed, false)) ~= 13 then -- remove if bike
			if isDriver or (GetPedInVehicleSeat(vehicle, 0) == playerPed and GetPedInVehicleSeat(vehicle, -1) == 0) then
				table.insert(elements, {label = _U("vehicle_menu"), value = "vehicle_menu"})
			end
		end
		if isDriver then
			table.insert(elements, {label = _U("speed_limiter"), value = "speed_limiter"})
		end
	end
	
	-- todo job1 and job1 boss menu
	-- todo others menu
	
	-- if PlayerData.job ~= nil PlayerData.job.grade_name == "boss" then
		-- table.insert(elements, {label = "", value = ""})
	-- end
	-- if PlayerGroup ~= nil and (PlayerGroup == "mod" or PlayerGroup == "admin" or PlayerGroup == "superadmin" or PlayerGroup == "owner") then
	-- 	-- table.insert(elements, {label = "", value = ""})
	-- 	print("you have access to admin menu i guess")
	-- end


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open("default", GetCurrentResourceName(), "ava_personalmenu",
	{
		title    = _U("menu_header"),
		align    = "left",
		elements = elements
	}, function(data, menu)

		if data.current.value == "sim_card" then
			TriggerEvent("NB:closeAllSubMenu")
			TriggerEvent("NB:closeAllMenu")
			TriggerEvent("NB:closeMenuKey")
			TriggerEvent("NB:carteSIM")
		
		elseif data.current.value == "my_keys" then
			TriggerEvent("esx_menu:key")

		elseif data.current.value == "wallet" then
			menu.close()
			OpenWalletMenu()

		elseif data.current.value == "vehicle_menu" then
			OpenVehicleMenu()

		elseif data.current.value == "speed_limiter" then
			OpenSpeedMenu()

		elseif data.current.value == "bills" then
			OpenBillsMenu()

		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenBillsMenu()
	local elements = {}
	ESX.TriggerServerCallback("esx_ava_personalmenu:getBills", function(bills)

		for i = 1, #bills, 1 do
			table.insert(elements, {label = _U("bills_item", bills[i].label, bills[i].amount), value = "pay_bill", billId = bills[i].id})
		end

		ESX.UI.Menu.Open("default", GetCurrentResourceName(), "ava_personalmenu_bills",
		{
			title    = _U("bills_menu"),
			align    = "left",
			elements = elements
		}, function(data, menu)
			if data.current.value == "pay_bill" then
				ESX.TriggerServerCallback("esx_billing:payBill", function()
					menu.close()
					OpenBillsMenu()
				end, data.current.billId)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenWalletMenu()
	ESX.UI.Menu.Open("default", GetCurrentResourceName(), "ava_personalmenu_wallet",
	{
		title    = _U("wallet"),
		align    = "left",
		elements = {
			{label = _U("blue", _U("wallet_idcard")), value = nil},
			{label = _U("green", _U("wallet_driver_license")), value = "driver"},
			{label = _U("red", _U("wallet_weapon_port_license")), value = "weapon"}
		}
	}, function(data, menu)
		ESX.UI.Menu.Open("default", GetCurrentResourceName(), "ava_personalmenu_wallet2",
		{
			title    = data.current.label,
			align    = "left",
			elements = {
				{label = _U("wallet_show"), value = "show"},
				{label = _U("wallet_check"), value = "check"}
			}
		}, function(data2, menu2)
			if data2.current.value == "show" then
				closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestDistance ~= -1 and closestDistance <= 3.0 then
					TriggerServerEvent("jsfour-idcard:open", GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), data.current.value)
				else
					ESX.ShowNotification(_U("no_players_nearby"))
				end
			elseif data2.current.value == "check" then
				TriggerServerEvent("jsfour-idcard:open", GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), data.current.value)
			end
		end, function(data2, menu2)
			menu2.close()
		end)
	end, function(data, menu)
		menu.close()
	end)
end

function OpenVehicleMenu()
	local playerPed = PlayerPedId()
	local vDoorsOpen = {
		[0] = false, -- front left
		[1] = false, -- front right
		[2] = false, -- back left
		[3] = false, -- back right
		[4] = false, -- hood
		[5] = false -- trunk
	}
	
	local elements = {}
	vehicle = GetVehiclePedIsIn(playerPed, false)

	if GetPedInVehicleSeat(vehicle, -1) == playerPed then
		table.insert(elements, {label = _U("vehicle_engine"), value = "vehicle_engine"})

		if DoesVehicleHaveDoor(vehicle, 4) then
			table.insert(elements, {label = _U("vehicle_hood"), value = "vehicle_door", door = 4})
		end
		if DoesVehicleHaveDoor(vehicle, 5) then
			table.insert(elements, {label = _U("vehicle_trunk"), value = "vehicle_door", door = 5})
		end
		if DoesVehicleHaveDoor(vehicle, 0) and GetVehicleClass(vehicle) ~= 8 then -- remove if motorcycle
			table.insert(elements, {label = _U("vehicle_door_frontleft"), value = "vehicle_door", door = 0})
		end
		if DoesVehicleHaveDoor(vehicle, 1) then
			table.insert(elements, {label = _U("vehicle_door_frontright"), value = "vehicle_door", door = 1})
		end
		if DoesVehicleHaveDoor(vehicle, 2) then
			table.insert(elements, {label = _U("vehicle_door_backleft"), value = "vehicle_door", door = 2})
		end
		if DoesVehicleHaveDoor(vehicle, 3) then
			table.insert(elements, {label = _U("vehicle_door_backright"), value = "vehicle_door", door = 3})
		end

	elseif GetPedInVehicleSeat(vehicle, 0) == playerPed and GetPedInVehicleSeat(vehicle, -1) == 0 then
		table.insert(elements, {label = _U("vehicle_move_to_driver_seat"), value = "move_to_driver_seat"})
	end

	ESX.UI.Menu.Open("default", GetCurrentResourceName(), "ava_personalmenu_vehicle_menu",
	{
		title    = _U("vehicle_menu"),
		align    = "left",
		elements = elements
	}, function(data, menu)
		if IsPedSittingInAnyVehicle(playerPed) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
			if data.current.value == "vehicle_engine" then
				if GetIsVehicleEngineRunning(vehicle) then
					SetVehicleEngineOn(vehicle, false, false, true)
					SetVehicleUndriveable(vehicle, true)
				elseif not GetIsVehicleEngineRunning(vehicle) then
					SetVehicleEngineOn(vehicle, true, false, true)
					SetVehicleUndriveable(vehicle, false)
				end
			elseif data.current.value == "vehicle_door" then
				vDoorsOpen[data.current.door] = not vDoorsOpen[data.current.door]
				if vDoorsOpen[data.current.door] then
					SetVehicleDoorOpen(vehicle, data.current.door, false, false)
				else
					SetVehicleDoorShut(vehicle, data.current.door, false, false)
				end
			elseif data.current.value == "move_to_driver_seat" then
				if GetPedInVehicleSeat(vehicle, 0) == playerPed and GetPedInVehicleSeat(vehicle, -1) == 0 then
					TriggerEvent("esx_avan0x:moveToDriverSeat")
					Citizen.Wait(5000)
					menu.refresh()
					OpenVehicleMenu()
				else
					ESX.ShowNotification(_U("not_in_passenger_seat"))
				end
			end
		else
			ESX.ShowNotification(_U("not_in_vehicle"))
		end

	end, function(data, menu)
		menu.close()
	end)

end

function OpenSpeedMenu()
	ESX.UI.Menu.Open("default", GetCurrentResourceName(), "ava_personalmenu_speed_limiter",
	{
		title    = _U("speed_limiter"),
		align    = "left",
		elements = {
			{label = _U("speed_disable"), value = "speed_disable"},
			{label = _U("speed_set_at", 50), value = "set_speed", speed = 50},
			{label = _U("speed_set_at", 90), value = "set_speed", speed = 90},
			{label = _U("speed_set_at", 130), value = "set_speed", speed = 130}
		}
	}, function(data, menu)
		if data.current.value == "speed_disable" then
			TriggerEvent("teb_speed_control:stop")
		elseif data.current.value == "set_speed" then
			TriggerEvent("teb_speed_control:setSpeedLimiter", data.current.speed)
		end
	end, function(data, menu)
		menu.close()
	end)

end



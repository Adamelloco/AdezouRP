RegisterServerEvent("esx_ava_personalmenu:kick")
AddEventHandler("esx_ava_personalmenu:kick", function(author, id, label)
	DropPlayer(id, "Tu as été kick par "..author.." : ".. label)
end)

RegisterServerEvent("esx_ava_personalmenu:bring_sv")
AddEventHandler("esx_ava_personalmenu:bring_sv", function(plyId, plyPedCoords)
	TriggerClientEvent("esx_ava_personalmenu:bring_cl", plyId, plyPedCoords)
end)

RegisterServerEvent("esx_ava_personalmenu:kill_sv")
AddEventHandler("esx_ava_personalmenu:kill_sv", function(plyId)
	TriggerClientEvent("esx_ava_personalmenu:kill_cl", plyId)
end)

TriggerEvent('es:addGroupCommand', 'a', 'admin', function(source, args, user)
	TriggerClientEvent('esx_ava_personalmenu:toggle_admin_mode', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = "Toggle admin mode", params = {}})

RegisterServerEvent("esx_ava_personalmenu:notifStaff")
AddEventHandler("esx_ava_personalmenu:notifStaff", function(content)
	TriggerClientEvent("esx_ava_personalmenu:notifStaff", -1, content)
end)
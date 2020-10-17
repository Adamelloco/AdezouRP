local damageValues = {
    -- ["WEAPON_ANIMAL"] = 1.0,
    -- ["WEAPON_COUGAR"] = 1.0,
    ["WEAPON_UNARMED"] = 0.35,
    -- ["WEAPON_KNIFE"] = 1.0,
    ["WEAPON_NIGHTSTICK"] = 0.2,
    ["WEAPON_HAMMER"] = 0.25,
    ["WEAPON_BAT"] = 0.25,
    ["WEAPON_CROWBAR"] = 0.5,
    ["WEAPON_GOLFCLUB"] = 0.25,
    ["WEAPON_KNUCKLE"] = 0.3,
    ["WEAPON_HATCHET"] = 1.0,
    ["WEAPON_MACHETE"] = 1.0,
    ["WEAPON_FLASHLIGHT"] = 0.05,
    ["WEAPON_SWITCHBLADE"] = 0.5,
    ["WEAPON_POOLCUE"] = 0.3,
    ["WEAPON_WRENCH"] = 0.2,
    -- ["WEAPON_BOTTLE"] = 1.0,
    -- ["WEAPON_PISTOL"] = 1.0,
    -- ["WEAPON_COMBATPISTOL"] = 1.0,
    -- ["WEAPON_APPISTOL"] = 1.0,
    -- ["WEAPON_PISTOL50"] = 1.0,
    -- ["WEAPON_MICROSMG"] = 1.0,
    -- ["WEAPON_SMG"] = 1.0,
    -- ["WEAPON_ASSAULTSMG"] = 1.0,
    -- ["WEAPON_ASSAULTRIFLE"] = 1.0,
    -- ["WEAPON_CARBINERIFLE"] = 1.0,
    -- ["WEAPON_ADVANCEDRIFLE"] = 1.0,
    -- ["WEAPON_MG"] = 1.0,
    -- ["WEAPON_COMBATMG"] = 1.0,
    -- ["WEAPON_PUMPSHOTGUN"] = 1.0,
    -- ["WEAPON_SAWNOFFSHOTGUN"] = 1.0,
    -- ["WEAPON_ASSAULTSHOTGUN"] = 1.0,
    -- ["WEAPON_BULLPUPSHOTGUN"] = 1.0,
    -- ["WEAPON_STUNGUN"] = 1.0,
    -- ["WEAPON_SNIPERRIFLE"] = 1.0,
    -- ["WEAPON_HEAVYSNIPER"] = 1.0,
    -- ["WEAPON_REMOTESNIPER"] = 1.0,
    -- ["WEAPON_GRENADELAUNCHER"] = 1.0,
    -- ["WEAPON_GRENADELAUNCHER_SMOKE"] = 1.0,
    -- ["WEAPON_RPG"] = 1.0,
    -- ["WEAPON_PASSENGER_ROCKET"] = 1.0,
    -- ["WEAPON_AIRSTRIKE_ROCKET"] = 1.0,
    -- ["WEAPON_STINGER"] = 1.0,
    -- ["WEAPON_MINIGUN"] = 1.0,
    -- ["WEAPON_GRENADE"] = 1.0,
    -- ["WEAPON_STICKYBOMB"] = 1.0,
    -- ["WEAPON_SMOKEGRENADE"] = 1.0,
    -- ["WEAPON_BZGAS"] = 1.0,
    -- ["WEAPON_MOLOTOV"] = 1.0,
    -- ["WEAPON_FIREEXTINGUISHER"] = 1.0,
    -- ["WEAPON_PETROLCAN"] = 1.0,
    -- ["WEAPON_DIGISCANNER"] = 1.0,
    -- ["WEAPON_BRIEFCASE"] = 1.0,
    -- ["WEAPON_BRIEFCASE_02"] = 1.0,
    -- ["WEAPON_BALL"] = 1.0,
    -- ["WEAPON_FLARE"] = 1.0,
    -- ["WEAPON_VEHICLE_ROCKET"] = 1.0,
    -- ["WEAPON_BARBED_WIRE"] = 1.0,
    -- ["WEAPON_DROWNING"] = 1.0,
    -- ["WEAPON_DROWNING_IN_VEHICLE"] = 1.0,
    -- ["WEAPON_BLEEDING"] = 1.0,
    -- ["WEAPON_ELECTRIC_FENCE"] = 1.0,
    -- ["WEAPON_EXPLOSION"] = 1.0,
    -- ["WEAPON_FALL"] = 1.0,
    -- ["WEAPON_EXHAUSTION"] = 1.0,
    -- ["WEAPON_HIT_BY_WATER_CANNON"] = 1.0,
    -- ["WEAPON_RAMMED_BY_CAR"] = 1.0,
    -- ["WEAPON_RUN_OVER_BY_CAR"] = 1.0,
    -- ["WEAPON_HELI_CRASH"] = 1.0,
    -- ["WEAPON_FIRE"] = 1.0,
    -- ["WEAPON_SNSPISTOL"] = 1.0,
    -- ["WEAPON_GUSENBERG"] = 1.0,
    -- ["WEAPON_SPECIALCARBINE"] = 1.0,
    -- ["WEAPON_HEAVYPISTOL"] = 1.0,
    -- ["WEAPON_BULLPUPRIFLE"] = 1.0,
    -- ["WEAPON_DAGGER"] = 1.0,
    -- ["WEAPON_VINTAGEPISTOL"] = 1.0,
    -- ["WEAPON_FIREWORK"] = 1.0,
    -- ["WEAPON_MUSKET"] = 1.0,
    -- ["WEAPON_HEAVYSHOTGUN"] = 1.0,
    -- ["WEAPON_MARKSMANRIFLE"] = 1.0,
    -- ["WEAPON_HOMINGLAUNCHER"] = 1.0,
    -- ["WEAPON_PROXMINE"] = 1.0,
    ["WEAPON_SNOWBALL"] = 0.01,
    -- ["WEAPON_FLAREGUN"] = 1.0,
    -- ["WEAPON_GARBAGEBAG"] = 1.0,
    -- ["WEAPON_HANDCUFFS"] = 1.0,
    -- ["WEAPON_COMBATPDW"] = 1.0,
    -- ["WEAPON_MARKSMANPISTOL"] = 1.0,
    -- ["WEAPON_RAILGUN"] = 1.0,
    -- ["WEAPON_MACHINEPISTOL"] = 1.0,
    -- ["WEAPON_AIR_DEFENCE_GUN"] = 1.0,
    -- ["WEAPON_REVOLVER"] = 1.0,
    -- ["WEAPON_DBSHOTGUN"] = 1.0,
    -- ["WEAPON_COMPACTRIFLE"] = 1.0,
    -- ["WEAPON_AUTOSHOTGUN"] = 1.0,
    -- ["WEAPON_BATTLEAXE"] = 1.0,
    -- ["WEAPON_COMPACTLAUNCHER"] = 1.0,
    -- ["WEAPON_MINISMG"] = 1.0,
    -- ["WEAPON_PIPEBOMB"] = 1.0,
    -- ["VEHICLE_WEAPON_ROTORS"] = 1.0,
    -- ["VEHICLE_WEAPON_TANK"] = 1.0,
    -- ["VEHICLE_WEAPON_SPACE_ROCKET"] = 1.0,
    -- ["VEHICLE_WEAPON_PLANE_ROCKET"] = 1.0,
    -- ["VEHICLE_WEAPON_PLAYER_LAZER"] = 1.0,
    -- ["VEHICLE_WEAPON_PLAYER_LASER"] = 1.0,
    -- ["VEHICLE_WEAPON_PLAYER_BULLET"] = 1.0,
    -- ["VEHICLE_WEAPON_PLAYER_BUZZARD"] = 1.0,
    -- ["VEHICLE_WEAPON_PLAYER_HUNTER"] = 1.0,
    -- ["VEHICLE_WEAPON_ENEMY_LASER"] = 1.0,
    -- ["VEHICLE_WEAPON_SEARCHLIGHT"] = 1.0,
    -- ["VEHICLE_WEAPON_RADAR"] = 1.0,
    -- ["VEHICLE_WEAPON_WATER_CANNON"] = 1.0,
    -- ["VEHICLE_WEAPON_TURRET_INSURGENT"] = 1.0,
    -- ["VEHICLE_WEAPON_TURRET_TECHNICAL"] = 1.0,
    -- ["VEHICLE_WEAPON_NOSE_TURRET_VALKYRIE"] = 1.0,
    -- ["VEHICLE_WEAPON_PLAYER_SAVAGE"] = 1.0,
    -- ["VEHICLE_WEAPON_TURRET_LIMO"] = 1.0,
    -- ["VEHICLE_WEAPON_CANNON_BLAZER"] = 1.0,
    -- ["VEHICLE_WEAPON_TURRET_BOXVILLE"] = 1.0,
    -- ["VEHICLE_WEAPON_RUINER_BULLET"] = 1.0,
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        -- TODO probably edit to only edit the actually equiped weapon
        for k, v in pairs(damageValues) do
            SetWeaponDamageModifier(GetHashKey(k), v)
        end
    end
end)

-- Citizen.CreateThread(function()
--     while true do
--         Wait(5)

--         SetPedSuffersCriticalHits(PlayerPedId(), false) -- headshot will not be a critical hit
--     end
-- end)



--============================--
--= Ragdoll when hit in legs =--
--============================--

local Bones = {
	--[[Pelvis]][11816] = true,
	--[[SKEL_L_Thigh]][58271] = true,
	--[[SKEL_L_Calf]][63931] = true,
	--[[SKEL_L_Foot]][14201] = true,
	--[[SKEL_L_Toe0]][2108] = true,
	--[[IK_L_Foot]][65245] = true,
	--[[PH_L_Foot]][57717] = true,
	--[[MH_L_Knee]][46078] = true,
	--[[SKEL_R_Thigh]][51826] = true,
	--[[SKEL_R_Calf]][36864] = true,
	--[[SKEL_R_Foot]][52301] = true,
	--[[SKEL_R_Toe0]][20781] = true,
	--[[IK_R_Foot]][35502] = true,
	--[[PH_R_Foot]][24806] = true,
	--[[MH_R_Knee]][16335] = true,
	--[[RB_L_ThighRoll]][23639] = true,
	--[[RB_R_ThighRoll]][6442] = true,
}


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)
		if HasEntityBeenDamagedByAnyPed(playerPed) then
			Ragdoll(playerPed)
		end
		ClearEntityLastDamageEntity(playerPed)
	end
end)

function Ragdoll(playerPed)
	if IsEntityDead(playerPed) then return false end
	local hit, bone = GetPedLastDamageBone(playerPed)
	if hit then
		if Bones[bone] then
			SetPedToRagdoll(playerPed, 5000, 5000, 0, 0, 0, 0)
			return true
		end
	end
	return false
end

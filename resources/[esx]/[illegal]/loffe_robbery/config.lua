Config = {}
Translation = {}

Config.Shopkeeper = 416176080 -- hash of the shopkeeper ped
Config.Locale = 'fr' -- 'en', 'sv' or 'custom'

Config.Shops = {
    -- {coords = vector3(x, y, z), heading = peds heading, money = {min, max}, cops = amount of cops required to rob}
    {coords = vector3(24.129, -1345.156, 28.497), heading = 266.946, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(2557.14, 380.53, 107.622), heading = 2.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-3038.87, 584.37, 6.97), heading = 23.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-3242.28, 999.72, 11.850), heading = 354.8, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(549.4, 2671.39, 41.176), heading = 96.5, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1959.76, 3739.87, 31.363), heading = 289.7, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(2677.86, 3279.12, 54.261), heading = 332.8, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1727.61, 6415.37, 34.057), heading = 246.5, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1134.04, -982.48, 45.45), heading = 277.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1221.79, -908.63, 11.35), heading = 41.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1486.06, -377.75, 39.163), heading = 124.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-2966.22, 390.79, 14.054), heading = 87.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1166.05, 2710.94, 37.167), heading = 181.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1392.39, 3606.44, 33.995), heading = 203.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-46.49, -1758.17, 28.47), heading = 48.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1165.04, -323.00, 68.27), heading = 104.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-705.89, -913.97, 18.26), heading = 97.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1819.79, 794.18, 137.20), heading = 138.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1697.71, 4922.87, 41.08), heading = 317.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(372.48, 326.44, 102.59), heading = 252.22, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(269.23, -978.3, 28.39), heading = 156.0, money = {5000, 15000}, cops = 2, cooldown = {hour = 0, minute = 30, second = 0}, robbed = false}
}

Translation = {
    ['en'] = {
        ['robbed'] = "I was just robbed and ~r~don't ~w~have any money left!",
        ['cashrecieved'] = 'You got:',
        ['currency'] = '$',
        ['scared'] = 'Scared:',
        ['no_cops'] = 'There are ~r~not~w~ enough cops online!',
        ['cop_msg'] = 'We have sent a photo of the robber taken by the CCTV camera!',
        ['set_waypoint'] = 'Set waypoint to the store',
        ['hide_box'] = 'Close this box',
        ['robbery'] = 'Robbery in progress',
        ['walked_too_far'] = 'You walked too far away!'
    },
    ['fr'] = { -- edit this to your language
        ['robbed'] = "J'ai été volé et je ~r~n'ai plus~s~ d'argent !",
        ['cashrecieved'] = 'Tu as eu ',
        ['currency'] = '$',
        ['scared'] = 'Effrayé:',
        ['no_cops'] = 'Il ~r~n\'y a pas~w~ assez de policiers en service!',
        ['cop_msg'] = 'On vous a envoyé une photo du braqueur grâce à la caméra!',
        ['set_waypoint'] = 'Placer un point à la superette',
        ['hide_box'] = 'Ferme cette boite',
        ['robbery'] = 'Braquage en cours',
        ['walked_too_far'] = 'Tu es parti trop loin',
        ['wait_before_next'] = 'Patientez avant de rebraquer une superette'
    }
}
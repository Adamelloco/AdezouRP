resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

version '1.0.0'
author 'github.com/AvaN0x'
description 'ESX AvaN0x -- random shit'

client_scripts {
    'client/client.lua'
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    'server/server.lua'
}
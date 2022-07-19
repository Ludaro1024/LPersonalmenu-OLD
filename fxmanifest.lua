

fx_version 'cerulean'
game 'gta5'

name "LPMenu"
author 'Ludaro'
description 'Ludaros Personal menu'
version '1.0'

shared_scripts {
'config.lua'
}

client_scripts {
	'@NativeUILua_Reloaded/src/NativeUIReloaded.lua',
    '@NativeUI/NativeUI.lua',
    'config.lua',
    'client.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server.lua'
    
}
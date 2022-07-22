Config = {}
local Keys = {
	['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57, 
	['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177, 
	['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
	['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
	['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
	['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70, 
	['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
	['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
	['NENTER'] = 201, ['N4'] = 108, ['N5'] = 60, ['N6'] = 107, ['N+'] = 96, ['N-'] = 97, ['N7'] = 117, ['N8'] = 61, ['N9'] = 118
}
Translation = {}
Config.ESXEvent = 'esx:getSharedObject'  
Config.Debug = true
Config.Spam = false
Config.EsxLicense = true
Config.Currency = "€"
Config.Button = Keys['E']
Config.Locale = 'en'
Config.CompanyManagementgrade = {
{job = "police", grade = 4},  {job = "ambulance", grade = 4},
}
Config.meeleeweapons = {
    {n = "knife", spawnname = "weapon_knife"},  -- spawn names please in lowercase
    { n = "Baseball Bat", spawnname = "weapon_bat"},
    {n = "golfclub", spawnname = "weapon_golfclub"}, 
    {n = "Bottle", spawnname = "weapon_bottle"}, 
}

Config.pistolweapons = {
    {n = "knife", spawnname = "weapon_knife"},  -- spawn names please in lowercase
    { n = "Baseball Bat", spawnname = "weapon_bat"},
    {n = "golfclub", spawnname = "weapon_golfclub"}, 
    {n = "Bottle", spawnname = "weapon_bottle"}, 
}

Config.mgweapons = {
    {n = "AK-47", spawnname = "weapon_assaultrifle"},  -- spawn names please in lowercase
    { n = "MG", spawnname = "weapon_mg"},
    {n = "Heavy Rifle", spawnname = "weapon_heavyrifle"},
}

Config.shotgunweapons = {
    { n = "pump shotgun", spawnname = "weapon_pumpshotgun"},
    { n = "pump mk2", spawnname = "weapon_pumpshotgun_mk2"},
    { n = "auto shotgun", spawnname = "weapon_autoshotgun"},
}

Config.sniperweapons = {
    {n = "Sniperrifle", spawnname = "weapon_sniperrifle"},  -- spawn names please in lowercase
    { n = "Heavy Sniper", spawnname = "weapon_heavysniper"}, 
}

Config.heavyweapons = {
    {n = "RPG", spawnname = "weapon_rpg"},  -- spawn names please in lowercase
    { n = "Grenade Launcher", spawnname = "weapon_grenadelauncher"},
}

Config.miscweapons = {
    {n = "grenade", spawnname = "weapon_grenade"},  -- spawn names please in lowercase
    { n = "molotov", spawnname = "weapon_molotov"},
    {n = "smoke grenade", spawnname = "weapon_smokegrenade"}, 
}


Config.Noclipspeed1 = 1
Config.Noclipspeed2 = 2
Config.Noclipspeed3 = 3
Config.Noclipspeed4 = 4
Config.Noclipspeed5 = 5

Config.AdminMenuRights = {
    {noclip = "admin", tp = "admin", "superadmin", tpm = nil, givemoney = nil, coords = nil, ShowPlayerNames = nil, revive = nil } -- ONLY THESE GROUPS CAN DO THIS IF NOTHING THEN EVERY ADMIN GROUP IF NIL THEN ALL CAN DO IT
}
function notification(txt)
    ESX.ShowNotification(txt)
end
Config.CloseMenutoUpdate = true

Config.Badges = true
Config.Inventory = true
Config.Wallet = true
Config.Weaponmenu = true
Config.VehicleMenu = true
Config.CompanyMenu = true
Config.Adminmenu = true
Config.AdminGroups = { "Superadmin", "admin"}
 -- ~g~ for green  ~r~~ for red and ~w~~ for white and so on :)
Translation = {
    ['de'] = {
        ['MainMenuname'] = 'Server-Name Here!',
        ['InventoryItemName'] = "Inventar",
        ['WalletItemName'] = "Brieftasche",
        ['NoOneNear'] = "es ist keiner in der nähe!",
        ['money'] = "Dein Bargeld:",
        ['bank'] = "Dein Geld auf der Bank:",
        ['back'] = "~r~Zurück",
        ['licenses'] = "Deine Lizenzen",
        ['give'] = "dieses Item weitergeben",
        ['use'] = "~g~Item Benutzen",
        ['drop'] = "~r~drop the item",
        ['amount'] = "Anzahl:",
        ['name'] = "Dein Name : ",
        ['job'] = "Dein Beruf : ",
        ['weaponmenu'] = "Waffen-Menü",
        ['meele'] = "Nahkampf-Waffen",
        ['pistol'] = "Pistolen",
        ['mg'] = "MG´s",
        ['shotgun'] = "Shotguns",
        ['sniper'] = "Snipe:",
        ['heavy'] = "Starke Kaliber",
        ['misc'] = "etc.",
        ['clothes'] = "Clothes-Menu",
        ['Torso'] = "Take off Torso",
        ['Pants'] = "Take off Pants",
        ['Shoes'] = "Take off Shoes",
        ['Bag'] = "Take off Bag",
        ['bproof'] = "Take off Vest",
        ['mask'] = "Take off/on mask",
        ['hat'] = "Take off/on accessiores",
        ['accessiores'] = "Take off/on accessiores",
        ['gloves'] = "Take off/on gloves",
        ['vehiclemenu'] = "Vehicle-Menu",
        ['motor1'] = "Turn Engine OFF (Without Auto-Start)",
        ['motor2'] = "Turn Engine OFF (With Auto-Start)",
        ['doors'] = "Choose Door:",
        ['ocdoor'] = "Open/Close Door:",
        ['door1'] = "Driver Door",
        ['door2'] = "Passenger Door",
        ['door3'] = "Back Left Door",
        ['door4'] = "Back Right door",
        ['door5'] = "Motorhaube",
        ['door6'] = "Kofferraum",
        ['companymenu'] = "Firmen-Management",
        ['companymoney'] = "Firmen-Geld: ",     
        ['fire'] = "~r~Feuere die Näheste Person!: ",     
        ['firee'] = "Du hast die Nähste person Gefeuert,!: ", 
        ['adminmenu'] = "Adminmenü: ",
        ['ID'] = "Spieler ID:",
        ['noclip'] = "Noclip:",
        ['noclipspeeds'] = "Noclip Geschwindigkeit:",
        ['noclipspeed1'] = "Laaangsam",
        ['noclipspeed2'] = "N bischen Schneller",
        ['noclipspeed3'] = "Medium",
        ['noclipspeed4'] = "Schnell",
        ['noclipspeed5'] = "Gotta go fast",
        ['tp1'] = "Teleportier dich zum Spieler: ", 
        ['tp2'] = "Bring einen Spieler zu dir: ", 
        ['tpn'] = "You cant Teleport  to yourself!", 
        ['tpm'] = "Telepier dich zum Marker",
        ['tpms'] = "Erfolgreich zum  Marker Teleportiert!",
        ['nowaypoint'] = "Kein Marker wurde gefunden",
        ['car'] = "Auto Spawnen?",
        ['inputcarname'] = "Autonamen bitte eingeben: (nil = adder)?",
        ['givemoney'] = "Geld Vergeben",
        ['givebank'] = "Bank-Geld Vergeben",
        ['howmuchmoney'] = "Wieviel geld Wollen sie vergeben?",
        ['showcoords'] = "Show Coordinates:",
        --['ShowPlayerNames'] = "FUNKTIONIERT GERADE NICHT?",
        ['revive'] = "Belebe einen Spieler wieder",
        
    },
    ['en'] = {
        ['MainMenuname'] = 'Server-Name Here!',
        ['InventoryItemName'] = "Inventory",
        ['WalletItemName'] = "Wallet",
        ['NoOneNear'] = "No One Near you!!",
        ['money'] = "Your Money on hand:",
        ['bank'] = "Your money on the bank:",
        ['back'] = "~r~back",
        ['licenses'] = "your Licenses",
        ['give'] = "~g~Give item to nearest person",
        ['use'] = "~g~use item",
        ['drop'] = "~r~drop the item",
        ['amount'] = "amount",
        ['name'] = "Your Name : ",
        ['job'] = "Your Profession : ",
        ['weaponmenu'] = "Weapon-Menu",
        ['meele'] = "meele",
        ['pistol'] = "Pistols",
        ['mg'] = "MG´s",
        ['shotgun'] = "Shotguns",
        ['sniper'] = "Sniper",
        ['heavy'] = "Heavy Weapons",
        ['misc'] = "etc.",
        ['clothes'] = "Clothes-Menu",
        ['Torso'] = "Take off Torso / Put on Torso",
        ['Pants'] = "Take off Pants / Put on Pants",
        ['Shoes'] = "Take off Shoes / Put on Shoes",
        ['Bag'] = "Take off Bag / Put Bag on",
        ['bproof'] = "Take off Vest / Put Vest on",
        ['mask'] = "Take off/on mask",
        ['hat'] = "Take off/on hat",
        ['accessiores'] = "Take off/on accessiores",
        ['gloves'] = "Take off/on gloves",
        ['vehiclemenu'] = "Vehicle-Menu",
        ['motor1'] = "Turn Engine OFF (Without Auto-Start)",
        ['motor2'] = "Turn Engine OFF (With Auto-Start)",
        ['doors'] = "Open Door:",
        ['door1'] = "Driver Door",
        ['door2'] = "Passenger Door",
        ['door3'] = "Back Left Door",
        ['door4'] = "Back Right door",
        ['door5'] = "Hood",
        ['door6'] = "Trunk",
        ['companymenu'] = "Company-Management",   
        ['companymoney'] = "Company-Money: ",     
        ['fire'] = "~r~Fire the nerarest person!: ",     
        ['firee'] = "You Fired the nearest person,!: ", 
        ['adminmenu'] = "Adminmenu (WIP!): ",
         ['ID'] = "Player ID:",
        ['noclip'] = "Noclip:", 
        ['noclipspeeds'] = "Noclip Speed:",
        ['noclipspeed1'] = "Very-Slow",
        ['noclipspeed2'] = "Slow",
        ['noclipspeed3'] = "Medium",
        ['noclipspeed4'] = "Fast",
        ['noclipspeed5'] = "Very Fast",
        ['tp1'] = "Go to player: ", 
        ['tp2'] = "Bring Player to you: ", 
        ['tpn'] = "You cant Teleport  to yourself!", 
        ['tpm'] = "Teleport to Marker",
        ['tpms'] = "Successfully Teleporter to Marker!",
        ['nowaypoint'] = "No Waypoint Found?",
        ['car'] = "Spawn Car:",
        ['inputcarname'] = "Input Car Name:",
        ['showcoords'] = "Show Coordinates:",
        ['givemoney'] = "Give Money",
        ['givebank'] = "Give Bank Money",
        ['howmuchmoney'] = "How much Money do you want to give?",
        ['ShowPlayerNames'] = "Show Information above Players (NOT WORKING RN)?",
        ['revive'] = "Revive a player",
}
}
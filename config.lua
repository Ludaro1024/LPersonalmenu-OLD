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
Config.Debug = false
Config.Spam = false
Config.EsxLicense = true
Config.Currency = "€"
Config.Button = Keys['E']
Config.Locale = 'en'

function notification(txt)
    ESX.ShowNotification(txt)
end

Config.Badges = true
Config.Inventory = true
Config.Wallet = true
Config.Weaponmenu = true
Config.VehicleMenu = true
Config.CompanyMenu = true
Config.Adminmenu = true
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
        ['name'] = "Dein Name:",
        ['job'] = "Dein Beruf:",
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
        ['name'] = "Your Name:",
        ['job'] = "Your Profession:",
}
}
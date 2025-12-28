----------------------------------------------------------------
--------------------- REDESIGN TABLET ARSENAL ------------------
----------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
client = {}
Tunnel.bindInterface("_arsenal",client)

local inMenu = false

local arsenal = {   ---- CDS DOS ARSENAL 
	{ 457.01, -996.63, 35.06 },
    -- Adicione outras coordenadas aqui
}

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local sleep = 1000
		local ped = PlayerPedId()
		local pCoords = GetEntityCoords(ped)
		
		for _,lugares in pairs(arsenal) do
            local x,y,z = table.unpack(lugares)
            local distance = GetDistanceBetweenCoords(pCoords,x,y,z,true)

            if distance <= 3 then
                sleep = 5
                DrawMarker(21, x,y,z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,88, 179, 252,50,0,0,0,1)
                if distance <= 1.2 then
                    if IsControlJustPressed(0,38) then -- Tecla E
                        TriggerServerEvent('ndk:permissao')				
                    end
                end
            end
		end
	    Wait(sleep)
	end
end)

RegisterNetEvent('ndk:permissao')
AddEventHandler('ndk:permissao',function()
	inMenu = true
	SetNuiFocus(true, true)
	SendNUIMessage({showMenu = true})
    -- Som de abrir o tablet
    PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
end)

RegisterNUICallback('NUIFocusOff', function()
    inMenu = false
    SetNuiFocus(false,false)
    -- Som de fechar
    PlaySoundFrontend(-1, "Menu_Back", "Phone_SoundSet_Default", 1)
end)

---------------------- CALLBACKS DE ARMAS ----------------------

-- Função auxiliar para limpar e dar arma
local function EquiparArma(weaponName, ammo, clipSize, removeWeapon)
    local ped = PlayerPedId()
    TriggerServerEvent('ndk:permissao') 
    
    if removeWeapon then
        RemoveWeaponFromPed(ped, GetHashKey(removeWeapon))
    end
    
    local hash = GetHashKey(weaponName)
    GiveWeaponToPed(ped, hash, ammo, 0, 1)
    SetPedAmmo(ped, hash, ammo)
    
    -- Som de confirmação (Click tático)
    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end

RegisterNUICallback('m4a1', function()
    EquiparArma("WEAPON_CARBINERIFLE", 200, 0, "WEAPON_SPECIALCARBINE")
end)

RegisterNUICallback('m4a4', function()
    EquiparArma("WEAPON_SPECIALCARBINE", 200, 0, "WEAPON_CARBINERIFLE")
end)

RegisterNUICallback('mp5', function()
    EquiparArma("WEAPON_SMG", 200, 0, "WEAPON_COMBATPDW")
end)

RegisterNUICallback('mpx', function()
    EquiparArma("WEAPON_COMBATPDW", 200, 0, "WEAPON_SMG")
end)

RegisterNUICallback('shot45', function()
    EquiparArma("WEAPON_PUMPSHOTGUN_MK2", 100, 0, nil)
end)

RegisterNUICallback('fiveseven', function()
    EquiparArma("WEAPON_PISTOL_MK2", 250, 0, "WEAPON_COMBATPISTOL")
end)

RegisterNUICallback('glock18', function()
    EquiparArma("WEAPON_COMBATPISTOL", 250, 0, "WEAPON_PISTOL_MK2")
end)

RegisterNUICallback('KITBASICO', function()
    local ped = PlayerPedId()
    TriggerServerEvent('ndk:permissao')
    GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),0,0,0)
    GiveWeaponToPed(ped,GetHashKey("WEAPON_KNIFE"),0,0,1)
    GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),0,0,0)
    GiveWeaponToPed(ped,GetHashKey("WEAPON_FLASHLIGHT"),0,0,0)
    TriggerServerEvent('zr_arsenal:colete')
    
    PlaySoundFrontend(-1, "TOGGLE_ON", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end)

RegisterNUICallback('Taser', function()
    EquiparArma("WEAPON_STUNGUN", 0, 0, nil)
end)

RegisterNUICallback('Lanterna', function()
    EquiparArma("WEAPON_FLASHLIGHT", 0, 0, nil)
end)

RegisterNUICallback('KCT', function()
    EquiparArma("WEAPON_NIGHTSTICK", 0, 0, nil)
end)

RegisterNUICallback('Faca', function()
    EquiparArma("WEAPON_KNIFE", 0, 0, nil)
end)

RegisterNUICallback('colete', function()
    TriggerServerEvent('ndk:permissao')
    TriggerServerEvent('zr_arsenal:colete')
    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end)

RegisterNUICallback('Limpar', function()
    local ped = PlayerPedId()
    RemoveAllPedWeapons(ped, true)
    PlaySoundFrontend(-1, "CHECKPOINT_NORMAL", "HUD_MINI_GAME_SOUNDSET", 1)
end)
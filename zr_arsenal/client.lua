----------------------------------------------------------------
---------------------EDIT BY: ZR SRORE
----------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
client = {}
Tunnel.bindInterface("_arsenal",client)

inMenu = true
local Menu = true

local arsenal = {   ---- CDS DOS ARSENAL 
	{ 457.01, -996.63, 35.06 },
	-- { 1836.99,3682.68,38.93 }, 
	-- { -381.17,-1028.24,-1.99 }, 
	-- { -1216.19, -2278.02, 14.57 }, 
	-- { -1191.71, -1729.18, 4.58 },
	-- { -1469.98, -989.7, 7.72 },
	-- { 474.39, -1148.66, 29.94 },
	-- { 283.88, -325.35, 45.28 },
	-- { -509.68, -112.65, 39.46 },
	-- { 1034.77, -236.05, 71.49 },
	-- { 1155.24, 749.9, 154.36 },
	-- { 1448.34, 3549.68, 40.47 },
	-- { 2605.07, 5342.35, 47.6 },
	-- { 1076.52, -191.24, 71.71 },
}



Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		sleep = 1000
		
		for _,lugares in pairs(arsenal) do
		local x,y,z = table.unpack(lugares)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),x,y,z,true)
        

		if distance <= 3 then
			sleep = 5
			DrawMarker(41, x,y,z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,88, 179, 252,50,0,0,0,1)
			if distance <= 1.2 then
				if IsControlJustPressed(0,38) then
					TriggerServerEvent('ndk:permissao')				
				end
			end
		end

		end
	Wait(sleep)
	end
	inMenu = false
      SetNuiFocus(false)
      SendNUIMessage({type = 'close'})
end)


function client.PertoArsenal()
	local posPed = GetEntityCoords(PlayerPedId())
	for _, lugares in pairs(arsenal) do
		local x,y,z = table.unpack(lugares)
		if GetDistanceBetweenCoords(x,y,z, posPed) < 5 then
			return true 
		end
	end
end


RegisterNetEvent('ndk:permissao')
AddEventHandler('ndk:permissao',function()
	inMenu = true
	SetNuiFocus(true, true)
	SendNUIMessage({showMenu = true})
end)


RegisterNUICallback('NUIFocusOff', function()
	print('toguro')
    SetNuiFocus(false,false)
	TransitionFromBlurred(1000)
    SetCursorPosition(0.0,false)
	print('felas')
end)
----------------------
RegisterNUICallback('m4a1', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_SPECIALCARBINE"),0)
	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_SPECIALCARBINE"))
	GiveWeaponToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),200,0,1)
end)

RegisterNUICallback('m4a4', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_SPECIALCARBINE"),0)
	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_CARBINERIFLE"))
	GiveWeaponToPed(ped,GetHashKey("WEAPON_SPECIALCARBINE"),200,0,1)
end)
-------------------
RegisterNUICallback('mp5', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_SMG"),0)
	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_COMBATPDW"))
	GiveWeaponToPed(ped,GetHashKey("WEAPON_SMG"),200,0,1)
end)

RegisterNUICallback('mpx', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_COMBATPDW"),0)
	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_SMG"))
	GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPDW"),200,0,1)
end)
-------------------
RegisterNUICallback('shot45', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),0)
	GiveWeaponToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),100,0,1)
end)
---------------------
RegisterNUICallback('fiveseven', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_PISTOL_MK2"),0)
	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_COMBATPISTOL"))
	GiveWeaponToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),250,0,1)
end)

RegisterNUICallback('glock18', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	SetPedAmmo(ped,GetHashKey("WEAPON_COMBATPISTOL"),0)
	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_PISTOL_MK2"))
	GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),250,0,1)
end)
------------------
RegisterNUICallback('KITBASICO', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),0,0,0)
	GiveWeaponToPed(ped,GetHashKey("WEAPON_KNIFE"),0,0,1)
	GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),0,0,0)
	TriggerServerEvent('zr_arsenal:colete')
	GiveWeaponToPed(ped,GetHashKey("WEAPON_FLASHLIGHT"),0,0,0)
end)
---------------

RegisterNUICallback('Taser', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),0,0,1)
end)
RegisterNUICallback('Lanterna', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	GiveWeaponToPed(ped,GetHashKey("WEAPON_FLASHLIGHT"),0,0,1)
end)
RegisterNUICallback('KCT', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),0,0,1)
end)
RegisterNUICallback('Faca', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	GiveWeaponToPed(ped,GetHashKey("WEAPON_KNIFE"),0,0,1)
end)

RegisterNUICallback('colete', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	TriggerServerEvent('zr_arsenal:colete')
end)

RegisterNUICallback('Limpar', function()
	local ped = PlayerPedId()
	TriggerServerEvent('ndk:permissao')
	RemoveAllPedWeapons(ped,true)
end)
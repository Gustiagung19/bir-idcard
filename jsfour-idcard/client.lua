local open = false
ESX = nil
--ESX
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)



-- Open ID card
RegisterNetEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function( data, type )
	open = true
	SendNUIMessage({
		action = "open",
		array  = data,
		type   = type
	})
end)

-- Key events
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
			SendNUIMessage({
				action = "close"
			})
			open = false
		end
	end
end)

RegisterNetEvent('memperlihatkan:identity')
AddEventHandler('memperlihatkan:identity', function(id)
    local player, distance = ESX.Game.GetClosestPlayer()

    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
    if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))                                
    else
        exports['mythic_notify']:SendAlert('error', 'Tidak ada Orang di Sekitarmu')
    end
end)

RegisterNetEvent('memperlihatkan:permis')
AddEventHandler('memperlihatkan:permis', function(id)
    local player, distance = ESX.Game.GetClosestPlayer()

    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
    if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')                                
    else
        exports['mythic_notify']:SendAlert('error', 'Tidak ada Orang di Sekitarmu')
    end
end)

RegisterNetEvent('memperlihatkan:ppa')
AddEventHandler('memperlihatkan:ppa', function(id)
    local player, distance = ESX.Game.GetClosestPlayer()

    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'ppa')
    if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'ppa')                                
    else
        exports['mythic_notify']:SendAlert('error', 'Tidak ada Orang di Sekitarmu')
    end
end)

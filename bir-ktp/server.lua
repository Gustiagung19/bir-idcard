ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('bir:ktp')
AddEventHandler('bir:ktp', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 100
    local xMoney = xPlayer.getMoney()
    local item = 'ktp'
    local carte = xPlayer.getInventoryItem(item).count

    if carte <=0 then    
        if xPlayer.getMoney() >= price then
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Pembayaran Diterima ' .. '$' .. price })
            xPlayer.removeMoney(price)
            xPlayer.addInventoryItem(item, 1)
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Pembayaran Ditolak' })
        end
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Anda Sudah Memiliki KTP' })
    end       

end)
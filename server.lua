local Config = Config

CreateThread(function()
    if Config.EnableCommand == true then
        -- framework check
        if Config.Framework == 'qbcore' then
            QBCore = exports['qb-core']:GetCoreObject()
        elseif Config.Framework == 'esx' then
            TriggerEvent('esx:getSharedObject', function(obj)
                ESX = obj
            end)        
        end
    
        -- command stuff
        if Config.Framework == 'esx' then
    
            RegisterCommand(Config.CommandName, function(source)
                local xPlayer = ESX.GetPlayerFromId(source)
    
                if xPlayer.getGroup() ~= Config.Permission then
                    TriggerClientEvent('PL-Screamer:Client:execute', -1)
                end
            end)
        elseif Config.Framework == 'qbcore' then
    
            QBCore.Commands.Add(Config.CommandName, 'Scream all those player on your server', {}, false, function(source, args)
                TriggerClientEvent('PL-Screamer:Client:execute', -1)
            end, Config.Permission)
        end
    end
end)


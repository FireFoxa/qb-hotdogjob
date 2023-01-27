local QBCore = exports['qb-core']:GetCoreObject()
local Bail = {}

-- Callbacks
QBCore.Functions.CreateCallback('qb-hotdogjob:server:HasMoney', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)

    if Player.PlayerData.money.bank >= Config.StandDeposit then
        Player.Functions.RemoveMoney('bank', Config.StandDeposit)
        Bail[Player.PlayerData.citizenid] = true
        cb(true)
    else
        Bail[Player.PlayerData.citizenid] = false
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-hotdogjob:server:BringBack', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)

    if Bail[Player.PlayerData.citizenid] then
        Player.Functions.AddMoney('bank', Config.StandDeposit)
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-hotdogjob:apple', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("weapon_bread") ~= nil and Player.Functions.GetItemByName("krenvirsh") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


RegisterNetEvent("qb-hotdogjob:server:addhotdog", function() 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

        Player.Functions.RemoveItem('weapon_bread', 1)
        Player.Functions.RemoveItem('krenvirsh', 1)
        Player.Functions.AddItem('hotdog', 1)

end)

-- Events

RegisterNetEvent('qb-hotdogjob:server:Sell', function(Amount, Price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('hotdog', 1)
    Player.Functions.AddMoney('cash', tonumber(Amount * Price))
end)

--[[RegisterNetEvent('qb-hotdogjob:server:UpdateReputation', function(quality)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local JobReputation = Player.PlayerData.metadata["jobrep"]

    if quality == "exotic" then
        if JobReputation["hotdog"] ~= nil and JobReputation["hotdog"] + 3 > Config.MaxReputation then
            JobReputation["hotdog"] = Config.MaxReputation
            Player.Functions.SetMetaData("jobrep", JobReputation)
            TriggerClientEvent('qb-hotdogjob:client:UpdateReputation', src, JobReputation)
            return
        end
        if JobReputation["hotdog"] == nil then
            JobReputation["hotdog"] = 3
        else
            JobReputation["hotdog"] = JobReputation["hotdog"] + 3
        end
    elseif quality == "rare" then
        if JobReputation["hotdog"] ~= nil and JobReputation["hotdog"] + 2 > Config.MaxReputation then
            JobReputation["hotdog"] = Config.MaxReputation
            Player.Functions.SetMetaData("jobrep", JobReputation)
            TriggerClientEvent('qb-hotdogjob:client:UpdateReputation', src, JobReputation)
            return
        end
        if JobReputation["hotdog"] == nil then
            JobReputation["hotdog"] = 2
        else
            JobReputation["hotdog"] = JobReputation["hotdog"] + 2
        end
    elseif quality == "common" then
        if JobReputation["hotdog"] ~= nil and JobReputation["hotdog"] + 1 > Config.MaxReputation then
            JobReputation["hotdog"] = Config.MaxReputation
            Player.Functions.SetMetaData("jobrep", JobReputation)
            TriggerClientEvent('qb-hotdogjob:client:UpdateReputation', src, JobReputation)
            return
        end
        if JobReputation["hotdog"] == nil then
            JobReputation["hotdog"] = 1
        else
            JobReputation["hotdog"] = JobReputation["hotdog"] + 1
        end
    end
    Player.Functions.SetMetaData("jobrep", JobReputation)
    TriggerClientEvent('qb-hotdogjob:client:UpdateReputation', src, JobReputation)
end)--]]

-- Commands

QBCore.Commands.Add("removestand", Lang:t("info.command"), {}, false, function(source, args)
    TriggerClientEvent('qb-hotdogjob:staff:DeletStand', source)
end, 'admin')
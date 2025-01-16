ESX = exports['es_extended']:getSharedObject()

SetEntityHealth = function(entity, health)
    Citizen.InvokeNative(0x6B76DC1F3AE6E6A3, entity, health)
end

local function generateKvpKey(identifier)
    return "healtharmor_" .. identifier
end


local function savePlayerHealthArmor(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        local health = GetEntityHealth(GetPlayerPed(source))
        local armor = GetPedArmour(GetPlayerPed(source))
        local kvpKey = generateKvpKey(xPlayer.identifier)

        SetResourceKvp(kvpKey, json.encode({
            health = health,
            armor = armor
        }))

        if Config.Debug then
        print(("^2[ALI_SAFEHEALTH] ^0Spieler %s Leben und Weste in KVP gespeichert: Leben: %s, Weste: %s"):format(xPlayer.name, health, armor))
        end
    end
end


local function loadPlayerHealthArmor(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        local kvpKey = generateKvpKey(xPlayer.identifier)
        local kvp = GetResourceKvpString(kvpKey)

        if kvp then
            local data = json.decode(kvp)
            if data and data.health and data.armor then
                local health = data.health
                local armor = data.armor

                SetEntityHealth(GetPlayerPed(source), health)
                SetPedArmour(GetPlayerPed(source), armor)
                if Config.Debug then
                print(("^2[ALI_SAFEHEALTH] ^0Spieler %s Leben und Weste von KVP geladen: Leben: %s, Weste: %s"):format(xPlayer.name, health, armor))
                end
            else
                if Config.Debug then
                print(("^3[ALI_SAFEHEALTH] ^0Fehler beim Laden der Daten aus KVP für Spieler %s"):format(xPlayer.name))
                end
            end
        else
            if Config.Debug then
            print(("^3[ALI_SAFEHEALTH] ^0Keine KVP-Daten gefunden für Spieler %s"):format(xPlayer.name))
            end
        end
    end
end


AddEventHandler('playerDropped', function(reason)
    local source = source
    savePlayerHealthArmor(source)
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    local source = tonumber(playerId)
    loadPlayerHealthArmor(source)
end)

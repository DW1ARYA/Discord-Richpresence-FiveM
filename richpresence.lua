local QBCore = exports['qb-core']:GetCoreObject()
local playersConnected = GlobalState.PlayerCount

AddStateBagChangeHandler('PlayerCount', nil, function(bagName, _, value)
     if bagName ~= "global" or not value then return end
     playersConnected = value
end)

CreateThread(function()
local sleep = 80000
    while true do
        SetDiscordAppId()
        SetDiscordRichPresenceAsset('')
        SetDiscordRichPresenceAssetText('')
        SetRichPresence("[" ..GetPlayerServerId(PlayerId()).. "] "..GetPlayerName(PlayerId()) .. (' -  %s Players'):format(playersConnected))
        SetDiscordRichPresenceAction(0, 'Connect', 'https://fivem')
        SetDiscordRichPresenceAction(1, 'Discord', 'https://discord.gg/discord')
        Wait(sleep)
    end
end)
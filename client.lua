local broadcastsEnabled = true -- Broadcasts are on by default for each player.

-- Listen for the message from the server
RegisterNetEvent('qb-autobroadcast:client:receiveMessage', function(message, prefix)
    if broadcastsEnabled then
        -- If the player has broadcasts enabled, show the message.
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.6); border-radius: 5px;"><div class="chat-message"><strong>{0}</strong> {1}</div></div>',
            args = { prefix, message }
        })
    end
end)

-- Command for players to toggle their own broadcasts
RegisterCommand('togglebroadcasts', function()
    broadcastsEnabled = not broadcastsEnabled -- Flip the setting

    local status = broadcastsEnabled and "enabled" or "disabled"
    local color = broadcastsEnabled and "rgba(0, 255, 0, 0.6)" or "rgba(255, 0, 0, 0.6)"

    -- Notify the player of the change
    TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: {0}; border-radius: 5px;"><div class="chat-message"><strong>System:</strong> Server broadcasts are now {1} for you.</div></div>',
        args = { color, status }
    })
end, false)
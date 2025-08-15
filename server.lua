Config = {}
Config.Interval = 30 -- Time in minutes between broadcasts
Config.Prefix = "^1[Server]^7" -- The prefix that appears before each message. Use FiveM color codes.
Config.Messages = {
    "Welcome to our server! We hope you have a great time.",
    "Please remember to read the server rules in our Discord.",
    "Need help from an admin? Use the /report command.",
    "Check out our forums for the latest server news and updates!",
    "These messages can be toggled on/off with /autobroadcast",
    "Don't forget to vote for our server to help us grow!"
}

-- DO NOT EDIT BELOW THIS LINE --

local currentMessage = 1

-- Thread for the broadcast timer
CreateThread(function()
    while true do
        -- Wait for the configured interval (in milliseconds)
        Wait(Config.Interval * 60000)

        -- Get the message and send it to all clients
        local message = Config.Messages[currentMessage]
        TriggerClientEvent('qb-autobroadcast:client:receiveMessage', -1, message, Config.Prefix)

        -- Go to the next message
        currentMessage = currentMessage + 1
        if currentMessage > #Config.Messages then
            currentMessage = 1
        end
    end
end)
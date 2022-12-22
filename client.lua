local Config = Config
----------------------------------------------------------------
-----DONT FORGET TO ADD THE OGG FILE TO THE INTERACT-SOUND------
----------------------------------------------------------------

-- if you know what your doing Ok :)

CreateThread(function()
    while true do
        local randomNumber = math.random(1, Config.Chance)

        if randomNumber == 5 then
            Execute()
        end
        Wait(Config.Every*1000)
    end
end)


function Execute()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "scarysound", 2)
    SendNUIMessage({
        show = true,
    })
    SetNuiFocus(true, false)
    Wait(4000)
    SendNUIMessage({
        show = false,
    })
    SetNuiFocus(false, false)
    Wait(4000)
end

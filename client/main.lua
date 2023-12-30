local isProgressBarOpened = false

RegisterNUICallback('finish', function()
    if (isProgressBarOpened) then
        isProgressBarOpened = false
    end
end)

function startProgressBar(text, timeouts)
    if (isProgressBarOpened) then
        return
    end

    isProgressBarOpened = true

    SendNUIMessage({
        type = 'startProgressBarControls',
        text = text,
        timeouts = timeouts,
    })
end

exports('startProgressBar', startProgressBar)

RegisterNetEvent('jsx_progressBar:client:startProgressBar', startProgressBar)

if GetConvarInt('jsx_progressBar:test', 0) == 1 then
    RegisterCommand('test', function()
        startProgressBar('Hola', 6000)
    end)
end

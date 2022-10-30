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

RegisterCommand('test', function()
    startProgressBar('Hola', 6000)
end)
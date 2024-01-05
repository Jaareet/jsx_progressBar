local isProgressBarOpened, progressBarCallback = false, nil

RegisterNUICallback('finish', function()
    if (isProgressBarOpened) then
        local userCallback = progressBarCallback
        progressBarCallback = nil
        userCallback(true)

        isProgressBarOpened = false
    end
end)

function startProgressBar(text, timeouts, cb)
    if (isProgressBarOpened) then
        return
    end

    isProgressBarOpened = true
    
    SendNUIMessage({
        type = 'startProgressBarControls',
        text = text,
        timeouts = timeouts,
    })
    if (cb) then
        progressBarCallback = cb
    end
end

exports('startProgressBar', startProgressBar)

RegisterNetEvent('jsx_progressBar:client:startProgressBar', startProgressBar)

if GetConvarInt('jsx_progressBar:test', 0) == 1 then
    RegisterCommand('test', function()
        startProgressBar('Hola', 6000)
    end)
end

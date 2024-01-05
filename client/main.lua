local isProgressBarOpened, callback = false, nil

RegisterNUICallback('finish', function()
    if (isProgressBarOpened) then
        isProgressBarOpened = false

        if(not callback) then return end
        callback()
        callback = nil
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

    if(not cb) then return end
    callback = cb
end

exports('startProgressBar', startProgressBar)

RegisterNetEvent('jsx_progressBar:client:startProgressBar', startProgressBar)

if GetConvarInt('jsx_progressBar:test', 0) == 1 then
    RegisterCommand('test', function()
        startProgressBar('Hola', 6000, function()
            TriggerEvent('chat:addMessage', {
                args = {
                    'SISTEMA',
                    'Terminado'
                }
            })
        end)
    end)
end

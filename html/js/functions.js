$('.progressBar').css({'opacity': '0', 'transform': 'translateY(1.2vw) translateX(-50%) scale(1.3)'})
function startProgressBarTimeout(text, timeouts){
    $('.progressBar-inside-text').text((text != null) ? text : 'No has puesto ningun texto');
    $('.progressBar').css({'opacity': '1', 'transform': 'translateY(0) translateX(-50%) scale(1)'})
    $('.progressBar-inside-bar').css({'width': '0'})
        .animate({'width': '100%'}, timeouts)

    setTimeout(removeProgressBar, ((timeouts != null) ? (timeouts - 250) : 70000))
}

function removeProgressBar() {
    $('.progressBar').css({'opacity': '0', 'transform': 'translateY(1.2vw) translateX(-50%) scale(1.3)'})
    setTimeout(() => {
        $.post(`https://${GetParentResourceName()}/finish`)
    }, 500)
}
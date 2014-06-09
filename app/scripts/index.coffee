( (window) ->
    'use strict'

    serial = new window.Serial()
    serial.connect('/dev/cu.usbserial-A9EDPBB7')

    document.addEventListener 'DOMContentLoaded', () ->
        h1 = document.getElementsByTagName('h1')
        if h1.length > 0
            h1[0].innerText = h1[0].innerText + ' \'Allo'
    , false
)(window)

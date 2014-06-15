'use strict'

dartsUi = new window.DartsUi document.getElementById('darts-ui')
dartsUi.setListener (score, ratio) ->
    console.log score + ', ' + ratio + ' = ' + score * ratio

serial = new window.Serial()
serial.connect '/dev/cu.usbserial-A9EDPBB7'
serial.setListener (info) ->
    dartsUi.hit info

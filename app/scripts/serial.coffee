( (window) ->
    'use strict'

    class Serial
        connectionId: null

        constructor: ->
            @serial = chrome.serial

        connect: (path) ->
            # console.log 'connect'
            @serial.connect path, @onConnected

        onConnected: (info) =>
            if not info?
                console.log 'Connection failed.'
                return

            console.log 'Connected.'

            @connectionId = info.connectionId
            @serial.onReceive.addListener @onReceive

        onReceive: (info) ->
            data = new Uint8Array(info.data)[0]
            console.log data

    window.Serial = Serial

)(window)

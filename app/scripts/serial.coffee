( (window) ->
    'use strict'

    class Serial
        connectionId: null

        constructor: ->
            @serial = chrome.serial

        connect: (path, callback) ->
            # console.log 'connect'
            @serial.connect path, (info) =>
                @onConnected(info)
                callback?(info)

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

        disconnect: ->
            return unless @connectionId?

            @serial.disconnect @connectionId, => {}
            @connectionId = null

            console.log 'Disconnected.'

    window.Serial = Serial

)(window)

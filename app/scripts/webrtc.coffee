'use strict'

class WebRTC

    connection: null

    constructor: ->
        peer = new Peer 'device', {host: 'localhost', port: 9999}
        # conn = peer.connect 'server'
        # console.log conn

        peer.on 'connection', (conn) =>
            @connection = conn
            conn.on 'data', (data) =>
                console.log data

    send: (data) =>
        return unless @connection?

        @connection.send data

window.WebRTC = WebRTC

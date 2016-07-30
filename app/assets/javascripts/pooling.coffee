window.Poller = {

  poll: (timeout) ->
    if timeout is 0
      Poller.request()
    else
      clearTimeout(this.pollTimeout)
      # console.log('timeout cleared : ' + this.pollTimeout + ' (before pulling phase)')
      this.pollTimeout = setTimeout ->
        Poller.request()
      , timeout || 500

  clear: ->
    clearTimeout(this.pollTimeout)
    # console.log('timeout cleared : ' + this.pollTimeout)

  request: ->
    chatRoomId = $('#messages').data('room-id')
    last_id = $('.message').last().data('id')
    if chatRoomId > 0
      $.get('/chat_rooms/' + chatRoomId + '/messages', after_id: last_id)
}

jQuery ->
    Poller.poll() if $('#messages').length

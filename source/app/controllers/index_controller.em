class App.IndexController extends Ember.Controller
  messages: []
  newMessage: new App.Foo()
  prepare: ->
    @set('messages', App.Foo.find()) # Set your initial collection from remote endpoint
    App.Foo.listen(this, 'messages') # Listen on the websocket and send changes to messages

  actions:
    sendMessage: ->
      message = @newMessage
      if (message.get('message') != "")
        message.set('id', (Math.floor(Math.random() * (2000 - 1) + 1)))
        message.save()
        @set('newMessage', new App.Foo()) 

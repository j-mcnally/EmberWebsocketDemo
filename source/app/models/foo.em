class App.Foo extends Ember.Model
  id: Ember.attr()
  message: Ember.attr()

App.Foo.url = "/dynamic/foos"
App.Foo.channel = "/foos"
App.Foo.websocketEndpoint = "/dynamic/faye"
App.Foo.adapter = Ember.WSAdapter.create()
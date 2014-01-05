#= require "./faye"
Ember.Model.reopenClass
  listen: (controller, property) ->
    @adapter.listen(this, controller, property)

class Ember.WSAdapter extends Ember.RESTAdapter
  client: null
  subscription: null
  channel: null
  enpoint: null

  setupClient:(klass) ->
    unless @get('client')?
      @set('channel', klass.channel)
      @set('websocketEndpoint', klass.websocketEndpoint)
      @set('client', new Faye.Client(@get('websocketEndpoint')))

  listen: (klass, controller, property) ->
    @setupClient(klass)
    unless @get('subscription')?
      sub = @client.subscribe "#{@get('channel')}", (message) =>
        unless klass.getCachedReferenceRecord(message.id)?
          klass.addToRecordArrays(klass.create(message))
      @set('subscription', sub)
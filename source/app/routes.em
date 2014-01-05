App.Router.map ->
  this.route('index', { path: '/'})
      
class App.IndexRoute extends Ember.Route
  setupController: (controller, model) ->
    controller.prepare()
  model: (params) ->
    #return a model here

Pomade.TimerRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('model', Pomade.Timer)

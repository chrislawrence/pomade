Pomade.PomodorosRoute = Ember.Route.extend
  model: ->
    @store.find('pomodoro');

Pomade.PomodorosCreateRoute = Ember.Route.extend
  model: ->
    Ember.Object.create()

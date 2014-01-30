App.PomodorosRoute = Ember.Route.extend
  model: ->
    @store.find('pomodoro');

App.PomodorosCreateRoute = Ember.Route.extend
  model: ->
    Ember.Object.create()

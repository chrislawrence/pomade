Pomade.PomodorosRoute = Ember.Route.extend
  model: ->
    @store.find('pomodoro');

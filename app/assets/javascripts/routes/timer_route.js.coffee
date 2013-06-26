Pomade.TimerRoute = Ember.Route.extend
  model: ->
    Pomade.Timer
  pomodoro: ->
    Pomade.Pomodoro.find()
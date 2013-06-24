Pomade.PomodorosRoute = Ember.Route.extend
  model: -> 
    Pomade.Pomodoro.find()

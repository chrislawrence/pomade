Pomade.PomodorosController = Ember.ArrayController.extend
  addPomodoro: ->
    Pomade.Pomodoro.createRecord(tag: @get('newPomodoroTag'))
    @get('store').commit()
  timer: ->
    return Pomade.Timer

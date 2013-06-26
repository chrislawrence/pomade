Pomade.PomodorosController = Ember.ArrayController.extend
  addPomodoro: ->
    Pomade.Pomodoro.createRecord(tag: @get('newPomodoroTag'))
    @get('store').commit()
  
  deletePomodoro: (id) ->
    Pomade.Pomodoro.find(id).deleteRecord()
    @get('store').commit()

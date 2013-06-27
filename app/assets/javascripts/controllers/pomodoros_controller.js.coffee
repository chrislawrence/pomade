Pomade.PomodorosController = Ember.ArrayController.extend  
  reversedContent: (->
    @get('content').toArray().reverse()
  ).property('content.@each').cacheable()
  
  addPomodoro: ->
    Pomade.Pomodoro.createRecord(tag: @get('newPomodoroTag'))
    @get('store').commit()
  
  deletePomodoro: (id) ->
    Pomade.Pomodoro.find(id).deleteRecord()
    @get('store').commit()

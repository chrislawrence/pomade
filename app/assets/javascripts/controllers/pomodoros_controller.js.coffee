Pomade.PomodorosController = Ember.ArrayController.extend
  sortProperties: ['end_time']
  sortAscending: false

Pomade.PomodoroController = Ember.ObjectController.extend
  isEditing: false

  actions:
    editPomodoro: ->
      @set('isEditing', true)
    updatePomodoro: ->
      @set('isEditing', false)
      @get('model').save()
    deletePomodoro: ->
      @get('model').deleteRecord()
      @get('model').save()

Pomade.PomodorosCreateController = Ember.ObjectController.extend
  actions:
    save: ->
      newPomodoro = @store.createRecord('pomodoro', @get('model'))
      newPomodoro.save()

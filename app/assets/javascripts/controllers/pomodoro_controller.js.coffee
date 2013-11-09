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

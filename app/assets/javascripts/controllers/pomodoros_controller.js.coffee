App.PomodorosController = Ember.ArrayController.extend
  sortProperties: ['end_time']
  sortAscending: false

App.PomodoroController = Ember.ObjectController.extend
  isEditing: false
  actions:
    editPomodoro: ->
      @set('isEditing', true)
    updatePomodoro: ->
      @set('isEditing', false)
      @get('model').save()
    deletePomodoro: ->
      if confirm('Really delete?')
        @get('model').deleteRecord()
        @get('model').save()

App.PomodorosCreateController = Ember.ObjectController.extend
  actions:
    save: ->
      newPomodoro = @store.createRecord('pomodoro', @get('model'))
      newPomodoro.save()

Pomade.PomodorosCreateController = Ember.ObjectController.extend
  actions:
    save: ->
      newPomodoro = @store.createRecord('pomodoro', @get('model'))
      newPomodoro.save()

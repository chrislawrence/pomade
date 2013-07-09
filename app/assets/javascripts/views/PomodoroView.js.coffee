Pomade.Editable = Ember.Mixin.create
  edit: ->
    console.log('starting to edit')
    @set('isEditing',true)
  finishEdit: ->
    console.log('finishing edit')
    @set('isEditing',false)
  isEditing: false
Pomade.PomodoroView = Ember.View.extend(Pomade.Editable,{
  templateName: 'pomodoro'
  tagName: 'li'
  update: ->
    @finishEdit()
    @get('controller').updatePomodoros()
  })

App.TimerObject = Ember.Object.extend
  seconds: 1
  work_time: 1
  break_time: 300
  type: 'work'
  showMiniTimer: false
  running: false

  inProgress: ( ->
    true if @get('seconds') != @get('work_time')
  ).property('seconds', 'work_time')

App.Timer = App.TimerObject.create()

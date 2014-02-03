App.TimerController = Ember.ObjectController.extend
  timer: App.Timer

  actions:
    toggleTimer: ->
      if !@timer.running
        @start()
      else
        @pause()
    reset: ->
      if confirm('Are you sure?')
        @pause()
        @timer.set('showMiniTimer', false)
        @timer.set('seconds', @timer.work_time)
        @timer.set('type', 'work')
        @setTimerColor('green')

  start: ->
    console.log('Starting timer...')
    @timer.set('running', true)
    @showPauseButton()
    @timer.set('showMiniTimer', true)
    @setTimerColor('yellow')
    @before = new Date()
    window.tick = =>
      @tick()
    @counter = setInterval( ->
      @tick()
    , 1000)

  pause: ->
    console.log('Pausing timer...')
    @timer.set('running', false)
    @showPlayButton()
    clearInterval(@counter)
    @setTimerColor('red')

  reset: ->
    console.log('Resetting timer...')
    @pause()
    if @type is 'break'
      @timer.set('seconds', @timer.work_time)
      @timer.set('showMiniTimer', false)
      @setTimerColor('green')
    else
      @createPomodoro()
      @timer.set('seconds', @timer.break_time)
      @start()
    $('.dial').trigger('configure',{"min": 0, "max":300, "val":250})

  createPomodoro: ->
    console.log('Creating pomodoro...')
    @store.createRecord('user_pomodoro', {end_time: new Date, start_time: (new Date - @timer.work_time), tag: @get('tag')}).save()

  tick: ->
    seconds = @timer.seconds
    interval = Math.round((new Date() - @before) / 1000)
    @timer.set('seconds', seconds - interval)
    $('.dial').val(@timer.seconds).trigger('change')
    @before = new Date()
    @reset() if @timer.seconds < 0

  showPlayButton: ->
    $('#play_button').show()
    $('#pause_button').hide()

  showPauseButton: ->
    $('#pause_button').show()
    $('#play_button').hide()

  setTimerColor: (color) ->
    if color is 'red'
      $('.dial').trigger('configure', { 'fgColor': 'C76A6A'})
    else if color is 'yellow'
      $('.dial').trigger('configure', { 'fgColor': 'F5EDBF'})
    else if color is 'green'
      $('.dial').trigger('configure', { 'fgColor': '94CBB4'})

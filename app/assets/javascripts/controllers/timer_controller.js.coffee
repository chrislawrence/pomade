Pomade.TimerController = Ember.ObjectController.extend
  timer: Pomade.Timer


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

  start: ->
    console.log('Starting timer...')
    @timer.set('running', true)
    @timer.set('nextAction', 'pause')
    @timer.set('showMiniTimer', true)
    @before = new Date()
    window.tick = =>
      @tick()
    @counter = setInterval( ->
      @tick()
    , 1000)

  pause: ->
    console.log('Pausing timer...')
    @timer.set('running', false)
    @timer.set('nextAction', 'play')
    clearInterval(@counter)

  reset: ->
    console.log('Resetting timer...')
    @pause()
    if @type is 'break'
      @timer.set('seconds', @timer.work_time)
      @timer.set('showMiniTimer', false)
    else
      @createPomodoro()
      @timer.set('seconds', @timer.break_time)
      @start()

  createPomodoro: ->
    if @session.authToken
      console.log('Creating pomodoro...')
      @store.createRecord('pomodoro', {end_time: new Date, tag: 'test'}).save()

  tick: ->
    seconds = @timer.seconds
    interval = Math.round((new Date() - @before) / 1000)
    @timer.set('seconds', seconds - interval)
    @before = new Date()
    @reset() if @timer.seconds < 0

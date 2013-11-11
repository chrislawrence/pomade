Pomade.TimerController = Ember.ObjectController.extend
  needs: ['application']
  type: 'work'
  nextAction: 'play'
  status: 'idle'
  timer: Pomade.Timer
  
  currentPath: true if Pomade.currentPath is 'timer'


  actions:
    toggleTimer: ->
      if @status is 'idle'
        @start()
      else
        @pause()

  start: ->
    console.log('Starting timer...')
    @timer.set('status', 'running')
    @timer.set('nextAction', 'pause')
    @before = new Date()
    window.tick = =>
      @tick()
    @counter = setInterval( ->
      @tick()
    , 1000)

  pause: ->
    console.log('Pausing timer...')
    @timer.set('status', 'idle')
    @timer.set('nextAction', 'play')
    clearInterval(@counter)

  reset: ->
    console.log('Resetting timer...')
    @pause()
    if @type is 'break'
      @timer.set('seconds', @timer.work_time)
    else
      @timer.set('seconds', @timer.break_time)
      @start()

  tick: ->
    seconds = @timer.seconds
    interval = Math.round((new Date() - @before) / 1000)
    @timer.set('seconds', seconds - interval)
    @before = new Date()
    @reset() if @timer.seconds < 0

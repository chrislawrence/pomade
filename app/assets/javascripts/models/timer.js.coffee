Pomade.Timer = Ember.Object.create
  seconds: 1
  nextAction: 'play'
  
  start: ->
    console.log('Starting timer...')
    @updateClass('running')
    window.tick = =>
      @tick()
    @timer = setInterval(window.tick, 1000)
    @set('nextAction','pause')
  
  pause: ->
    console.log('Stopping timer...')
    clearInterval(@timer)
    @set('nextAction','play')
    @updateClass('pause')
        
  reset: ->
    @pause() if @nextAction is 'pause'
    @updateClass('idle')
    @createPomodoro()
    @set('seconds', 5)
    
    
  createPomodoro: ->
    console.log('creating pomodoro...')
    Pomade.Pomodoro.createRecord(tag: 'test')
    
  
  tick: ->
    s = @get('seconds')
    @set('seconds',s-1)
    if @seconds < 0
        @reset()
  
  updateClass: (status) ->
    $('#timerController').removeClass('idle running pause').addClass(status)

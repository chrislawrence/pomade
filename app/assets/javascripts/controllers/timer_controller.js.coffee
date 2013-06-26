Pomade.TimerController = Ember.Controller.extend
  seconds: 1
  type: 'work'
  nextAction: 'play'
  status: 'idle'

  start: ->
    console.log('Starting timer...')
    @set('status','running')
    window.tick = =>
      @tick()
    @timer = setInterval(window.tick, 1000)
    @set('nextAction','pause')
  
  pause: ->
    console.log('Stopping timer...')
    clearInterval(@timer)
    @set('nextAction','play')
    @set('status','pause')
        
  reset: ->
    @pause() if @nextAction is 'pause'
    @set('status','idle')
    @createPomodoro() if @type is 'work'
    @setBreakWork()
    @set('seconds', 1)
    @start() if @type is 'break'
    
  createPomodoro: ->
    console.log('creating pomodoro...')
    tag = prompt('Tag', @lastTag)
    Pomade.Pomodoro.createRecord({tag: tag})
    @get('store').commit()
    @set('lastTag',tag)
  
  tick: ->
    s = @get('seconds')
    @set('seconds',s-1)
    if @seconds < 0
        @reset()
  
  setBreakWork: ->
    if @type is 'break'
      @set('type','work')
    else
      @set('type','break')
  
  toggleTimer: ->
    if @nextAction is 'pause'
      @pause()
    else
      @start()
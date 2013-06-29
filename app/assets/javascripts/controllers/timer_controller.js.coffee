Pomade.TimerController = Ember.ObjectController.extend
  type: ''
  nextAction: 'play'
  status: 'idle'
  tone: new buzz.sound("/assets/tone", { formats: ["mp3"]})
  workTime: 1500
  breakTime: 25

  start: ->
    console.log('Starting timer...')
    if @type is ''
      Pomade.Timer.set('seconds',@workTime)
      @set('type','work')
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
    console.log('Timer finished...')
    @playSound()
    @pause() if @nextAction is 'pause'
    @set('status','idle')
    @createPomodoro() if @type is 'work'
    @setBreakWork()
    @start() if @type is 'break'
    
  createPomodoro: ->
    console.log('creating pomodoro...')
    tag = @get('pomodoroTag') 
    Pomade.Pomodoro.createRecord({tag: tag})
    @get('store').commit()
    @set('lastTag',tag)
  
  tick: ->
    s = Pomade.Timer.seconds
    Pomade.Timer.set('seconds', s - 1)
    if Pomade.Timer.seconds < 0
        @reset()
  
  setBreakWork: ->
    if @type is 'break'
      @set('type','work')
      Pomade.Timer.set('seconds',@workTime)
    else
      @set('type','break')
      Pomade.Timer.set('seconds',@breakTime)
  
  toggleTimer: ->
    if @nextAction is 'pause'
      @pause()
    else
      @start()
  playSound: ->
   @tone.play()

Pomade.TimerController = Ember.ObjectController.extend
  type: ''
  nextAction: 'play'
  status: 'idle'
  tone: new buzz.sound("/assets/tone", { formats: ["mp3"]})
  workTime: 1500
  breakTime: 25
  longBreakTime: 900
  pomodoroCount: 0
  start: ->
    console.log('Starting timer...')
    if @type is ''
      Pomade.Timer.set('seconds',@workTime)
      @set('type','work')
    @set('status','running')
    @before = new Date()
    window.tick = =>
      @tick()
    @timer = setInterval( ->
      @tick()
    , 1000)
    delay = 1000

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
    @start() if @type is 'break' or @type is 'long break'
    
  createPomodoro: ->
    console.log('creating pomodoro...')
    tag = @get('pomodoroTag') 
    Pomade.Pomodoro.createRecord({tag: tag})
    @get('store').commit()
    @set('lastTag',tag)
  
  tick: ->
    s = Pomade.Timer.seconds
    interval = Math.round((new Date() - @before) / 1000)
    Pomade.Timer.set('seconds', s - interval)
    @before = new Date()
    if Pomade.Timer.seconds < 0
        @reset()
  
  setBreakWork: ->
    if @type is 'break' or @type is 'long break'
      @set('type','work')
      Pomade.Timer.set('seconds',@workTime)
    else
      @set('pomodoroCount', @pomodoroCount + 1)
      if @pomodoroCount % 4 is 0
        Pomade.Timer.set('seconds',@longBreakTime)
        @set('type','long break')
      else
        Pomade.Timer.set('seconds',@breakTime)
        @set('type','break')
  
  toggleTimer: ->
    if @nextAction is 'pause'
      @pause()
    else
      @start()
  playSound: ->
   @tone.play()

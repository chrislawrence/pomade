Pomade.TimerController = Ember.ObjectController.extend
  type: ''
  nextAction: 'play'
  status: 'idle'
  tone: new buzz.sound("/assets/tone", { formats: ["mp3"]})
  workTime: 1500
  breakTime: 25
  longBreakTime: 900
  pomodoroCount: 0
  alert: false
  start: ->
    console.log('Starting timer...')
    if @type is ''
      Pomade.Timer.set('seconds',@workTime)
      @set('type','Work')
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
    alert('Pomodoro finished') if @type is 'Work' and @alert is true
    @pause() if @nextAction is 'pause'
    @set('status','idle')
    @createPomodoro() if @type is 'Work'
    @setBreakWork()
    @start() if @type is 'Break' or @type is 'Long Break'
    
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
    @updateStatusBar()
    if Pomade.Timer.seconds < 0
        @reset()
  
  setBreakWork: ->
    if @type is 'Break' or @type is 'Long Break'
      @set('type','Work')
      Pomade.Timer.set('seconds',@workTime)
    else
      @set('pomodoroCount', @pomodoroCount + 1)
      if @pomodoroCount % 4 is 0
        Pomade.Timer.set('seconds',@longBreakTime)
        @set('type','Long Break')
      else
        Pomade.Timer.set('seconds',@breakTime)
        @set('type','Break')
  
  toggleTimer: ->
    if @nextAction is 'pause'
      @pause()
    else
      @start()
  playSound: ->
   @tone.play()

  updateStatusBar: ->
    $('title').text("Pomade - " + @time(Pomade.Timer.seconds) + " (" + @type + ")")

  time: (value) ->
    minutes = Math.floor(value / 60)
    seconds = value - minutes * 60
    pad = (str) ->
      return ("0" + str).slice(-2)
    
    return "#{pad(minutes)}:#{pad(seconds)}" 

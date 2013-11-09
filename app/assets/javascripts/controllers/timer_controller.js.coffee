Pomade.TimerController = Ember.ObjectController.extend

  actions:
    toggleTimer: ->
      @start()

  start: ->
    @before = new Date()
    window.tick = =>
      @tick()
    @timer = setInterval( ->
      @tick()
    , 1000)

  tick: ->
    seconds = Pomade.Timer.seconds
    interval = Math.round((new Date() - @before) / 1000)
    Pomade.Timer.set('seconds', seconds - interval)
    @before = new Date()

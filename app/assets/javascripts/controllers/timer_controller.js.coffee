Pomade.TimerController = Ember.ObjectController.extend
  status: Pomade.Timer.status
  toggleTimer: ->
    if Pomade.Timer.nextAction is 'pause'
      Pomade.Timer.pause()
    else
      Pomade.Timer.start()
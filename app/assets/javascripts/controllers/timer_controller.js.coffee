Pomade.TimerController = Ember.ObjectController.extend
  toggleTimer: ->
    if Pomade.Timer.nextAction is 'pause'
      Pomade.Timer.pause()
    else
      Pomade.Timer.start()


    
  
Pomade.ApplicationController = Ember.Controller.extend
  updateCurrentPath: ( ->
    Pomade.set('currentPath', @get('currentPath'))
    if @get('currentPath') is 'timer'
      @set('renderTimer', false)
    else
      @set('renderTimer', true)
  ).observes('currentPath')
  
  renderTimer: true

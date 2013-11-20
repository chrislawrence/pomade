Pomade.ApplicationController = Ember.Controller.extend
  renderTimer: true
  updateCurrentPath: ( ->
    Pomade.set('currentPath', @get('currentPath'))
    console.log(@get('currentPath'))
    if @get('currentPath') is 'timer'
      @set('renderTimer', false)
    else
      @set('renderTimer', true)
    console.log(@get('renderTimer'))
  ).observes('currentPath')
  

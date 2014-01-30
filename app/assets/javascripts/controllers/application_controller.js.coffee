Pomade.ApplicationController = Ember.Controller.extend({
  showMiniTimer: true
  updateCurrentPath: ( ->
    Pomade.set('currentPath', @get('currentPath'))
    if @get('currentPath') is 'timer'
      @set('showMiniTimer', false)
    else
      @set('showMiniTimer', true)
  ).observes('currentPath')
})

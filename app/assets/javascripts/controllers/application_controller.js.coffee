Pomade.ApplicationController = Ember.Controller.extend
  renderTimer: true
  updateCurrentPath: ( ->
    Pomade.set('currentPath', @get('currentPath'))
    if @get('currentPath') is 'timer'
      @set('renderTimer', false)
    else
      @set('renderTimer', true)
  ).observes('currentPath')
  currentUser: ->
    @store.find('user', { authToken: @session.authToken })

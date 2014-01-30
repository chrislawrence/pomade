App.ApplicationController = Ember.Controller.extend({
  showMiniTimer: true
  updateCurrentPath: ( ->
    App.set('currentPath', @get('currentPath'))
    if @get('currentPath') is 'timer'
      @set('showMiniTimer', false)
    else
      @set('showMiniTimer', true)
  ).observes('currentPath')
  showLogin: ->
    $('.login').show()
    $('.login_button').hide()
  hideLogin: ->
    $('.login').hide()
    $('.login_button').show()
})

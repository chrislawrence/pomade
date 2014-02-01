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
    $('body').append('<div class="fade"></div>')
    $('.login').show()
    
  hideLogin: ->
    $('.fade').fadeOut()
    $('.login').hide()
})

App.AuthLogoutController = Ember.Controller.extend({
  actions:
    logout: ->
      @auth.destroySession()
      sessionStorage.clear()
})

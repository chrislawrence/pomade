Pomade.ApplicationRoute = Ember.Route.extend(Ember.SimpleAuth.ApplicationRouteMixin, {
  renderTemplate: ->
    @render()
    @render("miniTimer", {
      outlet: "timer"
      into: "application"
      controller: "timer"
    })
  currentUser: ->
    @store.find('user', { authToken: @session.authToken })
  actions: {
    loginFailed: (error) ->
      @controllerFor('application').set('loginErrorMessage', error.responseJSON.error )
  }
})


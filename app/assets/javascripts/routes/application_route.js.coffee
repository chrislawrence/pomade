Pomade.ApplicationRoute = Ember.Route.extend({
  renderTemplate: ->
    @render()
    @render("miniTimer", {
      outlet: "timer"
      into: "application"
      controller: "timer"
    })
  actions: {
    loginFailed: (error) ->
      @controllerFor('application').set('loginErrorMessage', error.responseJSON.error )
    loginSucceeded: ->
      @controllerFor('application').set('message', 'Logged in')
  }
})


App.LoginRoute = Ember.Route.extend
  beforeModel: ->
    if @__proto__.session.isAuthenticated
      @transitionTo('timer')

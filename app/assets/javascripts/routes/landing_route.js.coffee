App.LandingRoute = Ember.Route.extend
  beforeModel: ->
    if @__proto__.session.isAuthenticated
      @transitionTo('timer')
  model: ->
    @store.createRecord('user')

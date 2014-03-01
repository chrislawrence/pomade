App.LandingRoute = Ember.Route.extend
  model: ->
    @store.createRecord('user')

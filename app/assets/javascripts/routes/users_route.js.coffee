Pomade.UsersRoute = Ember.Route.extend
  authRedirectable: true
  model: ->
    @store.find('user')

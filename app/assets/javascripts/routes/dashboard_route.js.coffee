App.DashboardRoute = Ember.Route.extend
  authRedirectable: true
  model: ->
    @store.find('user', @auth.get('userId'))

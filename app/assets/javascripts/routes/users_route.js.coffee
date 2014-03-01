App.UsersIndexRoute = Ember.Route.extend
  model: ->
    @store.find('user')
App.UsersShowRoute = Ember.Route.extend
  model: (params) ->
    @store.find('user', params.user_id)

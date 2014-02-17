App.UsersRoute = Ember.Route.extend({
  model: ->
    @store.find('user')
})

App.UsersNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('user')

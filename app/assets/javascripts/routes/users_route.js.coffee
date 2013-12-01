Pomade.UsersRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin, {
  model: ->
    @store.find('user')
})

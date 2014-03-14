Ember.Application.initializer
  name: 'currentUser'
  initialize: (container) ->
    store = container.lookup('store:main')
    debugger
    user = App.User.find(21)
    container.lookup('controller:currentUser').set('content', user)
    container.typeInjection('controller', 'currentUser', 'controller:currentUser')

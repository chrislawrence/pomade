Ember.Application.initializer
  name: 'currentUser'
  initialize: (container, application) ->
    store = container.lookup('store:main')
    user = store.find('user', 21)
    container.lookup('controller:currentUser').set('content', user)
    container.typeInjection('controller', 'currentUser', 'controller:currentUser')

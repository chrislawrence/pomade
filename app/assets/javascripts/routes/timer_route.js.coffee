Pomade.TimerRoute = Ember.Route.extend
  currentUser: ->
    @store.find('user', {authToken: @session.authToken})
  model: ->
    debugger
    @store.filter('pomodoro', {userId: @currentUser.id})
  setupController: ->
    @controllerFor('timer')

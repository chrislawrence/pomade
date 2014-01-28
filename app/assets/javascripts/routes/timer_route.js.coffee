Pomade.TimerRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('timer')
    @controller.set('model', @store.find('user_pomodoro'))
  afterModel: ->

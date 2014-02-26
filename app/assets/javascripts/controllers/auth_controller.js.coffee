App.LoginController = Ember.Controller.extend
  actions:
    login: ->
      @transitionTo('/')
      @controllerFor('application').notify('Logged in')

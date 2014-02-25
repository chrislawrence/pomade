App.LoginController = Ember.Controller.extend
  actions:
    login: ->
      @transitionTo('/')

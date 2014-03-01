App.LandingController = Ember.Controller.extend
  model: ->
    @store.createRecord('user')

  actions:
    createAccount: ->
      @get('model').save
      @controllerFor('application').notify('Account created')

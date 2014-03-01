App.LandingController = Ember.Controller.extend
  actions:
    createAccount: ->
      @get('model').save()
      if @get('model').errors
        @transitionToRoute('landing')
        @controllerFor('application').notify('Account could not be created')
      else
        @transitionToRoute('timer')
        @controllerFor('application').notify('Account created')

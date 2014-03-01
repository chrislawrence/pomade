App.LandingController = Ember.ObjectController.extend
  actions:
    createAccount: ->
      me = this
      @get('model').save().then(
        ->
          me.transitionToRoute('timer')
          me.controllerFor('application').notify('Account created')
        (errors) ->
          me.set('errors', errors.errors)
        )

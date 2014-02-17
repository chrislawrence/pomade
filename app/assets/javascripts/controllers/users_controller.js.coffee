App.UsersEditController = Ember.ObjectController.extend
  actions:
    update: ->
      @get('model').save()

App.UsersNewController = Ember.ObjectController.extend
  actions:
    create: ->
      # Set a variable for the error handling
      me = this
      @get('model').save().then(
        ->
          me.transitionTo('/')
        (errors) ->
          me.set('errors', errors.responseJSON.errors)
      )

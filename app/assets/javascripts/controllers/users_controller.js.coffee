Pomade.UsersEditController = Ember.ObjectController.extend
  actions:
    update: ->
      @get('model').save()

Pomade.ApplicationController = Ember.Controller.extend
  updateCurrentPath: ( ->
    Pomade.set('currentPath', @get('currentPath'))

  ).observes('currentPath')

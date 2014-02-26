App.ApplicationController = Ember.Controller.extend
  notify: (notification) ->
    @set('notification', notification)

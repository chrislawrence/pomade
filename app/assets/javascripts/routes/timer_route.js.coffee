Pomade.TimerRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('model',Pomade.Timer)
    Ember.$.getJSON('/users/me', (data) ->
      controller.set('workTime',data.user.work_time * 60)
      controller.set('breakTime',data.user.break_time * 60)
      Pomade.Timer.set('seconds',data.user.work_time * 60)
      )


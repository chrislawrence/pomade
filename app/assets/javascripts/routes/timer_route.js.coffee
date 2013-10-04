Pomade.TimerRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('model',Pomade.Timer)
    Ember.$.getJSON('/users/me', (data) ->
      controller.set('workTime',data.user.work_time * 60)
      controller.set('breakTime',data.user.break_time * 60)
      controller.set('longBreakTime',data.user.long_break_time * 60)
      controller.set('alert', data.user.alert)
      Pomade.Timer.set('seconds',data.user.work_time * 60)
    )
  keyDown: (e) ->
    console.log(e)


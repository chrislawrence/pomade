Pomade.Router.map (match)->
  @resource('timer', -> @resource('pomodoros', { path: '/'}))
  @resource('pomodoros')

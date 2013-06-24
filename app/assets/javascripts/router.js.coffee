Pomade.Router.map (match)->
  @resource("/","index")
  @resource('timer', -> @resource('pomodoros', { path: '/pomodoros'}))
  @resource('pomodoros')

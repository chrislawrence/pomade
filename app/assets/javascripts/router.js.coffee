Pomade.Router.map (match)->
  @resource 'timer',{ path: '/'}, -> @resource('pomodoros', { path: '/'})
  @resource('pomodoros')

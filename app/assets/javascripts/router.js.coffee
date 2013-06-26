Pomade.Router.map (match)->
  @resource("/","index")
  @resource('timer', -> @resource('pomodoros', { path: '/stats'}))
  @resource('pomodoros')

Pomade.Router.reopen
  location: 'history'
  rootURL: '/'

Pomade.Router.map ()->
  @resource('pomodoros', ->
    @resource('pomodoro', {path: '/:pomodoro_id' }, ->
      @route('edit')
    )
    @route('create')
  )

  @resource('users')
  @resource('user', {path: 'users/:user_id' }, ->
    @route('edit')
    @resource('pomodoros')
  )
  @route('timer', {path: '/'})
  @route('login')
  @route('dashboard')

Pomade.Router.reopen({
    rootURL: '/'
    location: 'history'
})


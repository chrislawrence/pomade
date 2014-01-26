Pomade.Router.map ()->
  @resource('pomodoros', ->
    @resource('pomodoro', {path: '/:pomodoro_id' }, ->
      @route('edit')
    )
    @route('create')
  )

  @resource 'users', ->
    @route('new')
  @resource 'user', {path: 'users/:user_id' }, ->
    @route('edit')
    @resource('pomodoros')

  @route('timer', {path: '/'})
  @route('dashboard')
  @route('login')

Pomade.Router.reopen({
    location: 'history'
})



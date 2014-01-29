Pomade.Router.map ()->
  @resource('pomodoros', ->
    @resource('pomodoro', {path: '/:pomodoro_id' }, ->
      @route('edit')
    )
    @route('create')
  )

  @resource 'users', ->
    @route('new')
    @route('show', { path: '/:user_id'}, ->
      @resource('pomodoros')
    )
    @route('edit', { path: '/:user_id/edit' })

  @route('timer', {path: '/'})
  @route('dashboard')
  @route('login')

Pomade.Router.reopen({
    location: 'history'
})



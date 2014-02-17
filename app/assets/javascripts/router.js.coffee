App.Router.map ()->
  @resource('pomodoros', ->
    @resource('pomodoro', {path: '/:pomodoro_id' }, ->
      @route('edit')
    )
    @route('create')
  )

  @resource 'users', ->
    @route('new', {path: '/new'})
    @route('show', { path: '/:user_id'}, ->
      @resource('pomodoros')
    )
    @route('edit', { path: '/:user_id/edit' })

  @route('timer', {path: '/'})
  @route('dashboard')
  @route('login')

App.Router.reopen({
    location: 'history'
})


Ember.Route.reopen
  activate: ->
    cssClass = this.toCssClass()
    # you probably don't need the application class
    # to be added to the body
    if cssClass != 'application'
      Ember.$('body').addClass(cssClass)
  deactivate: ->
    Ember.$('body').removeClass(this.toCssClass())
  toCssClass: ->
    @routeName.replace(/\./g, '-').dasherize()

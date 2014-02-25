# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  # @resource('posts')
  @route('timer', path: '/')
  @route('login')

App.Router.reopen
  location: 'history'


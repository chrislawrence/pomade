# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @route('landing', path: '/')
  @route('timer')
  @route('login')

App.Router.reopen
  location: 'history'


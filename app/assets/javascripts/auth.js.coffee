App.Auth = Ember.Auth.extend
  request: 'jquery'
  response: 'json'
  strategy: 'token'
  session: 'cookie'

  modules: [
    'emberData'
    'actionRedirectable'
    'authRedirectable'
  ]

  signInEndPoint: '/api/login'
  signOutEndPoint: '/api/logout'
  tokenKey: 'auth_token'
  tokenIdKey: 'user_id'
  tokenLocation: 'param'
  actionRedirectable:
    signInSmart: true
    signOutRoute: '/'

  emberData:
    userModel: 'user'
  setSessionData: ->
    sessionStorage.setItem('authToken', @auth.get('authToken'))
    sessionStorage.setItem('authUserId', @auth.get('userId'))

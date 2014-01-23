Pomade.Auth = Ember.Auth.extend
  request: 'jquery'
  response: 'json'
  strategy: 'token'
  session: 'cookie'

  modules: [
    'emberData'
    'actionRedirectable'
  ]

  signInEndPoint: '/api/login'
  signOutEndPoint: '/api/logout'
  tokenKey: 'auth_token'
  tokenIdKey: 'user_id'
  tokenLocation: 'param'
  actionRedirectable:
    signInRoute: '/'
    signOutRoute: '/'

  emberData:
    userModel: 'user'
  setSessionData: ->
    sessionStorage.setItem('authToken', @auth.get('authToken'))
    sessionStorage.setItem('authUserId', @auth.get('userId'))

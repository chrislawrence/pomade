App.ApplicationRoute = Ember.Route.extend({
  actions: {
    loginFailed: (error) ->
      @controllerFor('application').set('loginErrorMessage', error.responseJSON.error )
    loginSucceeded: ->
      @controllerFor('application').set('message', 'Logged in')
  }
  beforeModel: ->
    savedToken = sessionStorage.getItem('auth_token')
    savedId = sessionStorage.getItem('user_id')
    if savedToken != null and @auth.get('authToken') is null
      @auth.createSession {auth_token: savedToken, user_id: savedId} 
    @auth.addHandler 'signInSuccess', =>
      sessionStorage.setItem('auth_token', @auth.get('authToken'))
      sessionStorage.setItem('user_id', @auth.get('userId'))
      @model.reload()
})


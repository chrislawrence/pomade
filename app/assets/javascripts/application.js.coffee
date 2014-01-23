#= require jquery
#= require jquery_ujs
#= require jquery.ui.datepicker
#= require handlebars
#= require ember
#= require ember-data
#= require ember-auth
#= require ember-auth-request-jquery
#= require ember-auth-response-json
#= require ember-auth-strategy-token
#= require ember-auth-session-cookie
#= require ember-auth-module-action-redirectable
#= require ember-auth-module-ember-data
#= require_self
#= require pomade

window.Pomade = Ember.Application.create({
	currentPath: ''})
Pomade.Store = DS.Store.extend()
Pomade.Auth = Ember.Auth.extend
  request: 'jquery'
  response: 'json'
  strategy: 'token'
  tokenKey: 'auth_token'
  tokenLocation: 'param'
  session: 'cookie'

  modules: [
    'actionRedirectable'
  ]

  signInEndPoint: '/api/login'
  signOutEndPoint: '/api/logout'
  actionRedirectable:
    signInRoute: '/'
    signInSmart: ''
    signOutRoute: '/'

#= require jquery
#= require jquery_ujs
#= require jquery.ui.datepicker
#= require handlebars
#= require ember
#= require ember-data
#
#= require ember-auth
#= require ember-auth-request-jquery
#= require ember-auth-response-json
#= require ember-auth-strategy-token
#= require ember-auth-session-cookie
#= require ember-auth-module-action-redirectable
#= require ember-auth-module-ember-data
#
#= require_self
#= require auth
#= require pomade
#
#= require jquery.knob
#= require progress_circle

window.App = Ember.Application.create({
	currentPath: ''})
App.Store = DS.Store.extend()

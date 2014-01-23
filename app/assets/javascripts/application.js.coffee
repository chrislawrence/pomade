#= require jquery
#= require jquery_ujs
#= require jquery.ui.datepicker
#= require handlebars
#= require ember
#= require ember-data
#= require ember-auth
#= require_self
#= require pomade

window.Pomade = Ember.Application.create({
	currentPath: ''});
Pomade.Store = DS.Store.extend();
Pomade.Auth = Ember.Auth.extend();


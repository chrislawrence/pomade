#= require adapter.js

Ember.Test.adapter = Ember.Test.MochaAdapter.create()

describe 'account creation', ->

  it 'goes to the home page', ->
    [].sum.should.equal(0)

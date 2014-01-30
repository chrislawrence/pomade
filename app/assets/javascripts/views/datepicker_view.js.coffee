App.Datepicker = Ember.View.extend
  templateName: 'datepicker'
  didInsertElement: ->
    $('.date').datepicker()

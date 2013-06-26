Ember.Handlebars.helper('pomodoro_time', (value) ->
  time = new Date(value)
  pad = (str) ->
    return ("0" + str).slice(-2)
  string = pad(time.getHours()) + ":" + pad(time.getMinutes())
  )

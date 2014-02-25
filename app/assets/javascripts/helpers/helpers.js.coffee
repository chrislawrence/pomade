Ember.Handlebars.helper('pomodoro_time', (value) ->
  time = new Date(value)
  pad = (str) ->
    return ("0" + str).slice(-2)
  string = pad(time.getHours()) + ":" + pad(time.getMinutes())
)
Ember.Handlebars.helper('minutes', (value) ->
  minutes = Math.floor(value / 60)
  seconds = value - minutes * 60
  pad = (str) ->
    return ("0" + str).slice(-2)
  return "#{pad(minutes)}:#{pad(seconds)}"
)

Ember.Handlebars.helper('time', (value) ->
    minutes = Math.floor(value / 60)
    seconds = value - minutes * 60
    pad = (str) ->
      return ("0" + str).slice(-2)
    return "#{pad(minutes)}:#{pad(seconds)}" 
  )

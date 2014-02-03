App.DashboardController = Ember.ObjectController.extend
  total: (->
    @get('model.pomodoros.length')
  ).property('total')

  average: ( ->
    first = @get('model.pomodoros').objectAt(0)
    first_date = Date.parse(first.get('start_time'))
    timeDiff = Math.abs(new Date - first_date)
    days = Math.ceil(timeDiff / (1000 * 3600 * 24))
    Math.round(@get('model.pomodoros.length') / days)
  ).property('average')

  thisMonth: ( ->
    pomodoros = @get('model.pomodoros').filterProperty('start_time')
    filteredDates = []
    for date in @pomodoroDates()
      if date > @currentMonth()
        filteredDates.push(date)
    filteredDates.length
  ).property('thisMonth')
  
  mostInOneDay: ->
    days = []
    frequency = {}
    max = 0
    for rawDate in @pomodoroDates()
      date = new Date(rawDate)
      days.push(new Date(date.getFullYear(), date.getMonth(), date.getDate()))
    for v in [0..days.length]
      frequency[days[v]] = (frequency[days[v]] || 0) + 1
      if frequency[days[v]] > max
        max = frequency[days[v]]
        result = days[v]
    [result, max]

  bestDay: (->
    @mostInOneDay()[0]
  ).property('bestDay')

  bestDayCount: (->
    @mostInOneDay()[1]
  ).property('bestDayCount')

  pomodoroDates: ->
    pomodoros = @get('model.pomodoros').filterProperty('start_time')
    dates = [] 
    for pomodoro in pomodoros
      dates.push(Date.parse(pomodoro.get('start_time')))
    dates

  currentMonth: ->
    date = new Date
    new Date(date.getFullYear(), date.getMonth(), 1)


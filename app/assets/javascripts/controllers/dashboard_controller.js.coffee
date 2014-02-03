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
    dates = [] 
    filteredDates = []

    # Get all the dates
    for pomodoro in pomodoros
      dates.push(Date.parse(pomodoro.get('start_time')))

    # Get all the dates in the current month
    for date in dates
      if date > @currentMonth()
        filteredDates.push(date)

    # return the count
    filteredDates.length
  ).property('thisMonth')

  mostInOneDay: ->
    dates = 

  currentMonth: ->
    date = new Date
    new Date(date.getFullYear(), date.getMonth(), 1)


Pomade.Pomodoro = DS.Model.extend
  start_time: DS.attr()
  end_time: DS.attr()
  tag: DS.attr()
  user: DS.belongsTo("user")


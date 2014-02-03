App.User = DS.Model.extend
  first_name: DS.attr()
  last_name: DS.attr()
  username: DS.attr()
  email: DS.attr()
  website: DS.attr()
  avatar: DS.attr()
  pomodoros: DS.hasMany('pomodoro')

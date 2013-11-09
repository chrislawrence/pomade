Pomade.User = DS.Model.extend
 first_name: DS.attr()
 last_name: DS.attr()
 username: DS.attr()
 email: DS.attr()
 pomodoros: DS.hasMany('pomodoro')

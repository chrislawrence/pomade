App.NotificationView = Em.View.extend
  notificationDidChange: (->
    if @get('notification') 
      @.$().show()
      that = this
      setTimeout ( ->
        that.$().hide()
      ), 3000
  ).observes('notification')


  template: Ember.Handlebars.compile(
    "<p>{{view.notification}}</p>"
  )

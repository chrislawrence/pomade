Pomade.ApplicationRoute = Ember.Route.extend(Ember.SimpleAuth.ApplicationRouteMixin, {
  renderTemplate: ->
    @render()
    @render("miniTimer", {
      outlet: "timer"
      into: "application"
      controller: "timer"
    })
})


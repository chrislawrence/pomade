Pomade.ApplicationRoute = Ember.Route.extend
  renderTemplate: ->
    @render()
    @render("timer", {
      outlet: "timer"
      into: "application"
    })

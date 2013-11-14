Pomade.ApplicationRoute = Ember.Route.extend
  renderTemplate: ->
    @render()
    @render("miniTimer", {
      outlet: "timer"
      into: "application"
      controller: "timer"
    })

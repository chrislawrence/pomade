Pomade.ApplicationRoute = Ember.Route.extend
  renderTemplate: ->
    @render()
    @render("miniTimer", {
      outlet: "miniTimer"
      into: "application"
    }
    )

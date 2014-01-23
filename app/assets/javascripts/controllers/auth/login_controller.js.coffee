Pomade.AuthLoginController = Ember.Controller.extend
  actions:
      login: ->
        @auth.signIn
          data:
            email: @get 'email'
            password: @get 'password'

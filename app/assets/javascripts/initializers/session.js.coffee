
Ember.Application.initializer
    name: 'session'

    initialize: (container, application) ->
        Pomade.Session = Ember.Object.extend(
             init: ->
                authToken = sessionStorage.getItem('authToken')
                authUserId = sessionStorage.getItem('authUserId')

                if authToken != null && authUserId != null
                    Pomade.Auth.createSession '{"auth_token": "' + authToken + '", "user_id": "' + authUserId + '"}'
        ).create()

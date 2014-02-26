module "user actions",
  setup: ->
    App.reset()

test "user logs in", ->
  visit '/login'
  fillIn '.login-email', 'chris@example.com'
  fillIn '.login-password', 'password'
  click '.login-submit'
  andThen ->
    ok find("p:contains('Logged in')").length, "Notice displays"


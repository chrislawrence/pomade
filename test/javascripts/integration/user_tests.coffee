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

test "user signs up", ->
  visit '/'
  fillIn '.signup-email', 'chris@example.com'
  fillIn '.signup-username', 'chris'
  fillIn '.signup-password', 'password'
  click '.signup-submit'
  andThen ->
    ok find("p:contains('Account created')").length, "Notice displays"

test "user signs up with errors", ->
  visit '/'
  fillIn '.signup-email', 'chris@example.com'
  fillIn '.signup-username', 'chris'
  click '.signup-submit'
  andThen ->
    ok find("p:contains('Account could not be created')").length, "Notice displays"

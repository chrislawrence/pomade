$ ->
  $('.control_wrapper').mouseenter( -> $('.logout').slideDown(300)).mouseleave(-> $('.logout').slideUp(300))
  $('.flash').hide().slideDown(300).delay(3000).slideUp(300)

  # timer controls

  $(window).keypress( (e) ->
    if e.which is 32
      unless e.target.tagName.toLowerCase() is ('input' or 'textarea')
        $('#timerController').click()
  )

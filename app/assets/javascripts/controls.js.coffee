$ ->
  $('.control_wrapper').mouseenter( -> $('.logout').slideDown(300)).mouseleave(-> $('.logout').slideUp(300))
  $('.flash').hide().slideDown(300).delay(3000).slideUp(300)

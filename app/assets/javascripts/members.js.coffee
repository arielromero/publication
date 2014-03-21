# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
load_member_popovers = () ->
    $('.member_item').popover(
      placement: 'top'
      trigger: 'hover'
      html: true
      delay: { show: 600, hide: 100 }
      content: ->
        $(this).find('.data').html()
    )

  load_member_popovers()
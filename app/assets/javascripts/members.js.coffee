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

  $(document).on('submit', '#search_members_form', (event) ->
    event.preventDefault()
    
    sp = $('#search_param').val()
    sp = sp.replace(/\s/g,"%20")
    #alert(sp)
    #pid = $('#hidden_campaign_id').val()


    if (sp.length > 3 || sp.length == 0)
      # alert("You are searching..." + sp)
      $("#members_search_results").load("/members/search?search_param="+sp)
    else
      $("#error").text("El criterio de la búsqueda debe ser mayor a 3 caracteres").show().fadeOut(4500);
  )
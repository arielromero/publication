$(document).on('submit', '#search_subscriptions_form', (event) ->
    event.preventDefault()

    sp = $('#search_param').val()
    sp = sp.replace(/\s/g,"%20")
    #alert(sp)
    pid = $('#hidden_campaign_id').val()


    if (sp.length > 3 || sp.length == 0)
      # alert("You are searching..." + sp)
      $("#subscriptions_search_results").load("/campaigns/"+pid+"/subscriptions/search?search_param="+sp)
    else
      $("#error").text("El criterio de la búsqueda debe ser mayor a 3 caracteres").show().fadeOut(4500);
  )

 # $(document).on 'click', "#btn_member", () -> (
 #    alert('Hola')
 #    $(this).addClass('btn-warning').removeClass('btn-info');
 #  )
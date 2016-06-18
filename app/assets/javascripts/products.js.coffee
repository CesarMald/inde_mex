jQuery ->

  $('form').on 'change', '.brand_field', (event) ->
    jQuery.ajax
      url: "/admin/brands/" + $(this).val() + "/search_models"
      type: 'GET'
      dataType: 'script'

  $("#product_on_offer").click ->
    checked = $(this).is(':checked')
    $("#offer_fields").toggle()
    $("#product_offer_price").attr("required", checked)

  $("body").on "click", ".add_product", (event) ->
    event.preventDefault()
    product_id = $(this).siblings('.product_id').eq(0).val()
    unless $(".related_product_id_" + product_id).length == 2
      row = $("tr#product_" + product_id.toString()).html()
      $('#products_to_add').append '<tr>' + row + '</tr>'
    $(".save_button").attr("disabled", false)
  
  $('body').on 'click', '.remove_product', (event) ->
    event.preventDefault()
    $(this).closest('tr').remove()
    if $("#products_to_add tr").length == 1
      $(".save_button").attr("disabled", true)

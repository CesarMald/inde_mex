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

  $(".add_product").click (event) ->
    event.preventDefault()
    product_id = $(this).siblings('.product_id').eq(0).val()
    row = $("tr#product_" + product_id.toString()).html()
    $('#products_to_add').append '<tr>' + row + '</tr>'
  
  $('body').on 'click', '.remove_product', (event) ->
    event.preventDefault()
    $(this).closest('tr').remove()

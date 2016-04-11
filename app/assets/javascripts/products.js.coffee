jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).closest('.products_section').remove()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $("#related_products_section").after($(this).data('fields'))
    event.preventDefault()

  $(".edit_product").on "submit", (e) ->
    verifyRelatedProducts()
    !($(".error").length >= 1)

  $('form').on 'change', '.related_p', (event) ->
    $(this).removeClass("error")
    $(this).siblings("p").html("")

  $('form').on 'change', '#brand_id', (event) ->
    jQuery.ajax
      url: "/admin/brands/" + $(this).val() + "/search_models"
      type: 'GET'
      dataType: 'script'
    
verifyRelatedProducts = ->
  product_id = parseInt($("#product_id").val())
  related_products = $(".related_p")
  i = 0
  item = undefined
  while item = related_products[i]
    console.log(item)
    if parseInt(item.value) == product_id
      $(item).addClass("error")
      $(item).siblings('p').html("El producto no puede estar relacionado a sí mismo")
    i++

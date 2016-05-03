$(document).ready ->
  $('#product_order').on 'change', ->
    $("#products_sort").trigger('submit.rails')
    return
  return

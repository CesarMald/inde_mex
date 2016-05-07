$(document).ready ->
  $(".product_quantity").on 'change', ->
    $("#checkout_button").attr("disabled", true)
    $("#checkout_button").bind('click', false)
    return

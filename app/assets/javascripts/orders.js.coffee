jQuery ->
  $(".order_line_item_quantity").on 'change', ->
    tr = $(this).parent().parent()
    updateLineItem($(this), tr)
    updateSubtotal()
    updateTotal()
  
  $("#order_shipping_price, #order_tax_price").on 'change', ->
    updateTotal()

    

updateLineItem = (field, tr) ->
  price = tr.find(".product_price").val()
  total = field.val() * price
  console.log(total)
  tr.find(".total_line_item").html(total)
  tr.find(".alt_total_line_item").val(total)

updateSubtotal = () ->
  total = 0
  $('.alt_total_line_item').each (index) ->
    total += parseFloat($(this).val())
  $("#subtotal_order").html(total)
  return

updateTotal = () ->
  subtotal = parseFloat($(".alt_subtotal_order").val())
  shipping_price = parseFloat($("#order_shipping_price").val())
  tax_price = parseFloat($("#order_tax_price").val())
  total = subtotal + shipping_price + tax_price
  $("#total_order").html(total)
  return
 
  
  

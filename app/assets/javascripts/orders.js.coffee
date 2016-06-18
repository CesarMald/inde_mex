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
  string_total = numeral(total).format('$0,0.00')
  tr.find(".total_line_item").html(string_total)
  tr.find(".alt_total_line_item").val(total)

updateSubtotal = () ->
  total = 0
  $('.alt_total_line_item').each (index) ->
    total += parseFloat($(this).val())
  string_total = numeral(total).format('$0,0.00')
  $("#subtotal_order").html(string_total)
  $(".alt_subtotal_order").val(total)
  return

updateTotal = () ->
  subtotal = parseFloat($(".alt_subtotal_order").val())
  shipping_price = parseFloat($("#order_shipping_price").val())
  tax_price = parseFloat($("#order_tax_price").val())
  total = subtotal + shipping_price + tax_price
  string_total = numeral(total).format('$0,0.00')
  $("#total_order").html(string_total)
  return
 
  
  

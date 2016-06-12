jQuery ->
  if $(".product_quantity").length > 1
    $(".product_quantity").focusout ->
      updateSections($(this)) 
    
    $(".product_quantity").on 'change', ->
        updateSections($(this))

updateSections = (field) ->
  checkout_button = $("#checkout_button")
  if field.val() < 1
    checkout_button.attr("disabled", true)
    checkout_button.bind('click', false)
  else
    field.parent().siblings(".edit_line_item").submit()
    checkout_button.attr("disabled", false)
    checkout_button.bind('click', true)

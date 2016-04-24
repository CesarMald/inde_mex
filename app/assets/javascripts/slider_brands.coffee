# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('form').on 'click', '.remove_brand_fields', (event) ->
    $(this).parents("#slider_item").find(".destroy_field").val('1')
    $(this).closest("#slider_item").hide()
    event.preventDefault()

  $('form').on 'click', '.add_brand_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $("#slider_items_section").after($(this).data('fields').replace(regexp, time))
    event.preventDefault()

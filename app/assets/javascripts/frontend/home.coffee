jQuery ->
  $(document).on 'change', '#product_order', ->
    $("#products_sort").trigger('submit.rails')

  $(".brand_sections").click (e) ->
    collection_id = $("#collection_id").val()
    brand_id = $(this).find("input[name='brand_id']").val()
    $.ajax
      type: 'GET'
      dataType: 'script'
      url: '/models_for_brand'
      data: { brand_id: brand_id, collection_id: collection_id }

  $("#products-filters").on 'change', '#product_order', ->
    collection_id = $("#collection_id").val()
    model_id = $(this).val()
    $("#form_model_id").val(model_id)
    $.ajax
      type: 'GET'
      dataType: 'script'
      url: '/products_for_model'
      data: { model_id: model_id, collection_id: collection_id }

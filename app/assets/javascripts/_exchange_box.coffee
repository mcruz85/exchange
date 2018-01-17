$(document).ready ->
  $('form').submit ->
    if $('form').attr('action') == '/exchange'
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: $("#currency").val(),
                  currency_destination: $("#currency_destination").val(),
                  quantity: $("#quantity").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;

  $('#currency, #currency_destination, #quantity').change ->
    currency = $("#currency").val()
    currency_destination = $("#currency_destination").val()
    quantity = $("#quantity").val()
    has_values = currency && currency_destination && quantity
    is_diff = currency != currency_destination
    if (has_values && is_diff)
      $("#exchange_form").submit()
    else
      $("#result").val("")

  $('img.icon-reverse').click ->
    current_currency = $("#currency").val()
    current_destination = $("#currency_destination").val()
    $("#currency").val(current_destination)
    $("#currency_destination").val(current_currency).trigger('change')

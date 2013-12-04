$ ->
  $('#get-started').on 'click', ->
    document.location = $(this).data('url')

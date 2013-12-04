$ ->
  $('.vote-button').on 'ajax:success', (event, data, status, xhr) ->
    suggestion = $("#suggestion_#{data.suggestion}")
    suggestion.find(".vote-count").text(data.votes)
    suggestion.find(".vote-button").addClass('voted')
    suggestion.find(".vote-button i").removeClass('icon-star-empty').addClass('icon-star')

  $('.vote-button').on 'ajax:before', ->
    $(this).attr('disabled', true)

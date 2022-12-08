$(document).on "turbolinks:load", ->
  $("#new_message").on "keypress", (e) ->
      console.log e.keyCode
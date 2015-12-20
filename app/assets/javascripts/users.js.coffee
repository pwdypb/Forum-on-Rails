# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 @show_user_editor = (className) ->

  isVisible = $(className).css("display") != "none";

  if (isVisible)
    $(className).css("display", "none")
  else
    $(className).css("display", "block")

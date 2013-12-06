jQuery ($) ->

  if /about/.test(location.pathname)

    $heading  = $("main").find("h2").first()
    $btn      = $("<button>", type: "button", class: "btn btn-sm btn-default", text: "…")

    $heading
      .nextAll().hide().end()
      .after($btn)

    $btn.on "click", ->
      $heading.nextAll().not(".btn-sm").fadeIn()
      $(@).hide()

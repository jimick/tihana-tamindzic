---
---

jQuery ($) ->

  $html = $("html")

  $(".off-canvas-toggle").on "click", (event) ->
    event.preventDefault()
    $html.toggleClass "off-canvas-active"

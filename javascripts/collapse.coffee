---
---

jQuery ($) ->

  if $(".page-collapsable").length
    $last = null

    collapse = ($el) ->
      unless $el.is(":last-of-type")
        content = $el.nextUntil("h2")
      else
        content = $el.nextAll()

      content.wrapAll("<div>")
      $el.addClass("is-collapsed")

    $("main").find("h2").each ->
      collapse $(@)

    $("main").on "click", ".is-collapsed", ->
      # collapse($last) if $last?

      $this = $(@)
      $last = $this
      $this.next().show()
      $this.removeClass("is-collapsed")

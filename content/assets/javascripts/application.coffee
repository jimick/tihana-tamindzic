do ($ = jQuery) ->

  # images

  $("p:has(img)").addClass("img")

  # navigation

  $navList = $(".nav-regular-list")

  if $navList.length

    $(".nav-regular-expander").on "click", ->
      $navList.toggleClass("is-expanded")

  # testimonials

  $testimonials = $(".testimonials").css("position", "relative").children()

  if $testimonials.length

    index         = 0
    wordCount     = ($el) -> $el.text().split(" ").length
    readingTime   = (words) -> 300 * words
    shift         = ->
      $testimonials.eq(index).fadeOut()
      index = 0 if index == $testimonials.length - 1
      $testimonials.eq(++index).fadeIn()
      window.setTimeout shift, readingTime(wordCount($testimonials.eq(index)))

    window.setTimeout shift, readingTime(wordCount($testimonials.first().fadeIn()))

  # more

  if $(".l-page-about").length

    $heading    = $(".main-body").find("h2").eq(1)
    $more       = $heading.nextAll()
    $moreExpand = $("<button>", type: "button", text: "...", class: "more-expand")

    $more.hide()

    $moreExpand
      .insertAfter($heading)
      .on "click", ->
        $(@).remove()
        $more.fadeIn("fast")

  # faq

  $faqMain  = $(".l-page-faq").find(".main-body").find(".grid-right")

  if $faqMain.length

    $faqMain.find("h2").each ->
      $this = $(this)
      title = $this.html()
      $answerWrapper = $("<div>", class: "answer")

      $this.html title.replace(/^(\d+\.\))/, "<span class=\"number\">$1</span>")

      $this.nextUntil("h2").wrapAll($answerWrapper)
      $this.on "click", (event) ->
        console.log "click"
        $this.next(".answer").slideToggle()

        unless $this.hasClass("expanded")
          $this.toggleClass("expanded")
        else
          window.setTimeout ->
            $this.toggleClass("expanded")
          , 400

  # go to top

  $window         = $(window)
  $goToTop        = $(".go-to-top")

  if $goToTop.length

    fadeArea        = [1200, 1400]
    fadeAreaDelta   = fadeArea[1] - fadeArea[0]
    checkPosition   = ->
      top = $window.scrollTop()
      if top >= fadeArea[0] and top <= fadeArea[1]
        return top
      else if top > fadeArea[1]
        return fadeArea[1]
      else
        return false

    $goToTop.removeClass("is-hidden") if checkPosition()

    $goToTop.on "click", (event) ->
      event.preventDefault()
      $("body").animate
        scrollTop: 0
      , 800

    $(window).on "scroll", (event) ->
      top = checkPosition()

      if top
        opacity = (top - fadeArea[0]) / fadeAreaDelta
        $goToTop
          .removeClass("is-hidden")
          .css("opacity", opacity)

      else
        $goToTop.addClass("is-hidden")

  # expand fancy navigation items

  $(".nav-fancy-link").on "click", (event) ->
    event.preventDefault()
    $this     = $(@)
    duration  = 600

    $this.siblings().fadeOut(duration)
    $this.addClass("active")

    window.setTimeout do ($this) ->
      ->
        position = $this.position()
        $(".elevator-phrase, .footer").fadeOut()
        $this.css
          top: position.top
          left: position.left
          bottom: "auto"
          right: "auto"

        $this.animate
          top: -700
          left: -700
          width: 1024 * 2.5
          height: 1024 * 2.5
        , 1000, -> location.href = $this[0].href

    , duration

class ig.ScrollWatch
  (@projevSelector, @leftArrow, @rightArrow) ->
    @leftArrowElm = @leftArrow.node!
    @rightArrowElm = @rightArrow.node!
    @eleNode = @projevSelector.element.node!
    @projevOffset = ig.utils.offset @projevSelector.parentElement.node!
    window.addEventListener \resize @onResize
    document.addEventListener \scroll @onScroll

  onResize: ~>
    @projevOffset := ig.utils.offset @projevSelector.parentElement.node!
    @onScroll!

  onScroll: ~>
    @onScrollProjev!
    @onScrollArrows!

  onScrollArrows: ->
    scroll = document.body.scrollTop - 40px
    if scroll > 0
      @leftArrowElm.style
        ..position = 'fixed'
        ..top = "128px"
        ..left = "#{@projevOffset.left - 0}px"
      @rightArrowElm.style
        ..position = 'fixed'
        ..top = "128px"
        ..left = "#{@projevOffset.left + 960}px"
    else
      @leftArrowElm.style
        ..position = 'absolute'
        ..top = "31px"
        ..left = "-60px"
      @rightArrowElm.style
        ..position = 'absolute'
        ..top = "31px"
        ..left = "auto"


  onScrollProjev: ->
    scroll = document.body.scrollTop - 40px
    if scroll > 0
      @eleNode.style
        ..position = "fixed"
        ..top = "0px"
        ..left = "#{@projevOffset.left + 18}px"
      @eleNode.className = "projev-selector"
    else
      @eleNode.style
        ..position = "absolute"
        ..top = "-9px"
        ..left = "18px"
      @eleNode.className = "projev-selector top"

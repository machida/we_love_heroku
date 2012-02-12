$ ->
  listen_ajax = () ->
    # remote="true" な処理のlisten
    $('form[data-remote="true"]').live "submit", (e) ->
      $.fancybox.showActivity()
      find_key = "input[type='text'].auto_clear, textarea.auto_clear"
      $(this).find(find_key).attr "readonly", "readonly"
      $(this).bind("ajax:complete", (ee) ->
        $(this).find(find_key).removeAttr "readonly"
        $.fancybox.hideActivity()
      ).bind "ajax:success", (ee) ->
        $(this).find(find_key).val ""
      return
      
    $('a[data-remote="true"]').live("click", (e) ->
      $.fancybox.showActivity()
    ).live("ajax:complete", ->
      $.fancybox.hideActivity()
    ).live("ajax:success", ->
      $.fancybox.hideActivity()
    )
    return
  init = () ->
    listen_ajax();
    return
  
  init()
  return
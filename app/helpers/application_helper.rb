module ApplicationHelper
  def fb_connect_js opts = {}
    uri = "//connect.facebook.net/{locale}/all.js"
    case I18n.locale
      when :ja
        uri.sub '{locale}', 'ja_JP'
      else
        uri.sub '{locale}', 'en_US'
    end
  end
end
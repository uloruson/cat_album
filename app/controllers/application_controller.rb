class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'open-uri'
  require "uri"
  require "json"

  def google_image_get
    #リクエストURLを生成
    url = "https://www.googleapis.com/customsearch/v1?"
    url +="key=#{Rails.application.secrets.google_api_key}&cx=#{Rails.application.secrets.google_custom_search_id}"
    url +="&q=#{set_search_word}&searchType=image&imgType=photo&rights=cc_publicdomain&imgSize=large"

    json = JSON.load(open(url))

    json['items'].each do |item|
      image = Image.new
      image.name = item['title']
      image.remote_data_url = item['link']
      image.save!
    end
  end

  def pixabay_image_get
    #リクエストURLを生成
    url  ="https://pixabay.com/api/?"
    url +="key=#{Rails.application.secrets.pixabay_api_key}&q=#{set_search_word}"
    url += "&image_type=photo"

    json = JSON.load(open(url))

    json['hits'].each do |item|
      image = Image.new
      image.provider = 'pixabay'
      image.name = item['id']
      image.remote_data_url = item['webformatURL']
      image.save!
    end

  end

  def set_search_word
    #検索ワード設定
    URI.encode("猫+かわいい")
  end

end

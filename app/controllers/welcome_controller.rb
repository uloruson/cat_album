class WelcomeController < ApplicationController

  require 'open-uri'
  require "uri"
  require "json"

  def index

    # google custom search APIの初期設定 ＊＊＊＊json取得として分ける必要あり
    api_key = 'AIzaSyA3EpugqUq-A-RShiIcfn5UyJU_R3lMKos'
    custom_search_id = '008250860226409482484:fvpilalvu4w'

    #検索ワード設定
    search_word = URI.encode("cat")

    #リクエストURLを生成
    url  ="https://www.googleapis.com/customsearch/v1?key=#{api_key}&cx=#{custom_search_id}&q=#{search_word}"
    url += "&searchType=image&imgType=photo&rights=cc_publicdomain"

    json = JSON.load(open(url))

    json['items'].each do |item|
      image = Image.new
      image.name = item['title']
      image.remote_data_url = item['link']
      image.save!
    end

    @images = Image.all

  end
end

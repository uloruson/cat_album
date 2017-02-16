class WelcomeController < ApplicationController

  require 'open-uri'
  require "uri"
  require "json"

  def index

    api_key = 'AIzaSyA3EpugqUq-A-RShiIcfn5UyJU_R3lMKos'
    custom_search_id = '008250860226409482484:fvpilalvu4w'
    search_word = URI.encode("猫")

    url= "https://www.googleapis.com/customsearch/v1?key=#{api_key}&cx=#{custom_search_id}&q=#{search_word}
    &imgType=photo&searchType=image"

    json = JSON.load(open(url))

    render :text => json
  end
end

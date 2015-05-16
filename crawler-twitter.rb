require 'oauth'
require 'twitter'
load './formater.rb'

class CrawlerTwitter #< Crawler

  def crawl(screen_name)
    api_key = "Dsxw2Mcz6YUjkXn391hlDKNUZ"
    api_secret = "1xdi8rJlUpZnLXjZfxDBjMrUHVDrxTsoawgmuIvHZi8rJlPox9"
    token = "1076693654-uNeDfTiSqdNSfsDW3sebZAHJZS22VsBjhHbMbqp"
    token_secret = "PQ5BSo61nRQNCSuRnUpkco6W5xhk0ALdwJxodxNwWApjA"
    users_screen_name = Array.new
    formater = Formater.new

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = api_key
      config.consumer_secret     = api_secret
      config.access_token        = token
      config.access_token_secret = token_secret
    end

    response = client.followers(screen_name).to_h
    users = response[:users]
    users.each do |key, value|
      formater.setName(key[:name])
      formater.setPictures(key[:profile_image_url_https])
      formater.setPictures(key[:profile_background_image_url_https])
      formater.setAddress("", "", key[:time_zone])
      users_screen_name.push(key[:screen_name])
      formater.saveData
      formater.clearAll
    end

  end
end

twitter = CrawlerTwitter.new
twitter.crawl("Edouard0Souan")
require 'oauth'
require 'twitter'

class CrawlerTwitter #< Crawler
  #twitterID = 1076693654

  def crawl
    api_key = "Dsxw2Mcz6YUjkXn391hlDKNUZ"
    api_secret = "1xdi8rJlUpZnLXjZfxDBjMrUHVDrxTsoawgmuIvHZi8rJlPox9"
    token = "1076693654-uNeDfTiSqdNSfsDW3sebZAHJZS22VsBjhHbMbqp"
    token_secret = "PQ5BSo61nRQNCSuRnUpkco6W5xhk0ALdwJxodxNwWApjA"
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = api_key
      config.consumer_secret     = api_secret
      config.access_token        = token
      config.access_token_secret = token_secret
    end
    response = client.followers("Edouard0Souan")
    puts response.to_h
  end
end

twitter = CrawlerTwitter.new
twitter.crawl
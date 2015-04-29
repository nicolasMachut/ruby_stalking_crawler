require 'oauth'
require 'net/http'

class CrawlerTwitter #< Crawler
  @api_key = "Dsxw2Mcz6YUjkXn391hlDKNUZ"
  @api_secret = "1xdi8rJlUpZnLXjZfxDBjMrUHVDrxTsoawgmuIvHZi8rJlPox9"
  @token = "1076693654-uNeDfTiSqdNSfsDW3sebZAHJZS22VsBjhHbMbqp"
  @token_secret = "PQ5BSo61nRQNCSuRnUpkco6W5xhk0ALdwJxodxNwWApjA"

  def crawl
    res = oauth
    puts res
  end

  def oauth
    # Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
    def prepare_access_token(oauth_token, oauth_token_secret)
      consumer = OAuth::Consumer.new(@api_key, @api_secret, { :site => "https://api.twitter.com", :scheme => :header })

      # now create the access token object from passed values
      token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
      access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

      return access_token
    end

# Exchange our oauth_token and oauth_token secret for the AccessToken instance.
    access_token = prepare_access_token(@token, @token_secret)

# use the access token as an agent to get the home timeline
    response = access_token.request(:get, "https://api.twitter.com/1.1/friends/list.json")
    return response
    end
end
twitter = CrawlerTwitter.new

twitter.crawl
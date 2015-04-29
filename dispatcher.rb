require_relative 'crawler.rb'
require_relative 'crawlers/crawler_google.rb'
require_relative 'crawlers/crawler_tweeter.rb'
require 'json'
require 'redis'
class Dispatcher

  redis = Redis.new

  loop do
    jobStr = redis.lpop "crawlerList"

    if !jobStr.nil?
      # Parse JSON
      job = JSON.parse(jobStr)
      type = job["type"]

      crawler = Crawler.instantiate(type)
      crawler.crawl
    end

    puts "sleep"
    sleep 5
  end

end
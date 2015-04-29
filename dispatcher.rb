require_relative 'crawler.rb'
require_relative 'crawlers/crawler_google.rb'
require_relative 'crawlers/crawler_tweeter.rb'
require 'json'
require 'redis'
class Dispatcher

  redis = Redis.new

  treatedJobs = 0;
  loop do

    puts "#{treatedJobs} job(s) treated"
    jobsLeft = redis.lrange "crawlerList", 0, -1
    puts "#{jobsLeft.length} job(s) restant"

    jobStr = redis.lpop "crawlerList"

    if !jobStr.nil?
      # Parse JSON
      job = JSON.parse(jobStr)
      type = job["type"]

      crawler = Crawler.instantiate(type)
      crawler.crawl
      treatedJobs += 1
    end

    if (jobsLeft = 0)
      puts "sleep"
      sleep 5
    end

  end

end
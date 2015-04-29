require 'redis'
require 'json'
class Worker

  redis = Redis.new
  h = {}
  h['type'] = 'crawlerGoogle'
  redis.lpush "crawlerList", h.to_json

  h = {}
  h['type'] = 'crawlerTweeter'
  redis.lpush "crawlerList", h.to_json

end
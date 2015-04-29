require 'abstraction'
class Crawler
  abstract

  def crawl
    raise 'Override this method please ! T\' as pas le droit de faire ca ! so fuck off'
  end

  def start
    crawl
  end

  def self.instantiate (type)
    case type
      when 'crawlerGoogle'
        return CrawlerGoogle.new()
      when 'crawlerTweeter'
        return CrawlerTweeter.new()
      when 'crawlerFaceBook'
        return CrawlerFacebook.new()
    end
  end

end
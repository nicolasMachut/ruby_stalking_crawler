class Crawler

  def initialize
  end

  def crawl
    raise 'Override this method please ! T\' as pas le droit de faire ca ! so fuck off'
  end

  def self.instantiate (type)
    case type
      when 'crawlerGoogle'
        puts "Instantiate a Google Crawler"
        return CrawlerGoogle.new()
      when 'crawlerTweeter'
        puts "Instantiate a Tweeter Crawler"
        return CrawlerTweeter.new()
      when 'crawlerFaceBook'
        puts "Instantiate a Facebook Crawler"
        return CrawlerFacebook.new()
    end
  end

end
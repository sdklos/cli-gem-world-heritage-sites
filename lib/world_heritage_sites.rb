require 'open-uri'
require 'pry'
require 'nokogiri'

class WorldHeritageSites
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.scrape_countries
    doc = Nokogiri::HTML(open('http://whc.unesco.org/en/list/'))
    box = doc.css("div#acc.box")
    countries = []
    box.css("h4 a").text.each do |country|
      countries << country
    end
    binding.pry
    instance.save
    instance
  end

  def self.new_from_url(url)

  end

end

WorldHeritageSites.scrape_countries

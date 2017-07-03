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
    #doc.css("div#acc.box").each do |box|
    @countries = []
      box.css("h4").each do |country|
        name = country.css("a").text
        @countries << name
      end
      binding.pry
  end

  def countries
    @countries
  end

end

WorldHeritageSites.scrape_countries

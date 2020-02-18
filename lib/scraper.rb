require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper 
  attr_accessor :doc 
  def self.scrape_index_page(url)
    @doc = Nokogiri::HTML(open(url))
    plants = [] 
    rows = @doc.search("tbody tr")
    rows.each do |plant| 
      plant_name = plant.css("td")[0].text
      plant_spacing = plant.css("td")[1].text
      plants << {name: plant_name, spacing: plant_spacing}
    end 
    plants
  end 

  def self.scrape_plant(profileurl)
    page = Nokogiri::HTML(open(profileurl))
    plant = {} 
    doc = page.css("")
    plant[:spacing] = 
    plant[:season] = 
    plant[:sun] = 
    plant[:watering] = 
    plant[:harvesttime] = 
    plant[:companions] = 
    plant[:enemies] = 
    plant 
  end 
end 
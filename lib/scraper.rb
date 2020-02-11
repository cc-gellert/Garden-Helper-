require 'open-uri'
require 'nokogiri'

class Scraper 
  def self.scrape_index_page(url)
    index = Nokogiri::HTML(open(url))
    plants = [] 
    index.css("ion-no-padding.item.md.in-list.ion-focusable.hydrated").each do |plant| 
      plant_name = plant.css("h2.ion-text-wrap").text
      plant_profile_url = blablabla 
      plants << {name: plant_name, profile: plant_profile_url}
    end 
    plants 
  end 
  def self.scrape_plant(profileurl)
    page = Nokogiri::HTML(open("profileurl"))
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
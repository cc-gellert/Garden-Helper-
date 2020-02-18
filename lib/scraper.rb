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
      plant_text = plant.css("td")[0].text.split("-")
      plant_name = plant_text[0].to_s.capitalize 
      space_string = plant.css("td")[1].text
      plant_spacing = space_string.gsub!("(", "-").split("-")[0].to_i
      plants << {name: plant_name, spacing: plant_spacing}
    end 
    plants
  end 
end 

#need to take out headings for fruit, herbs, and plant variety/plants per square 
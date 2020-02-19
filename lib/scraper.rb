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
      first_text = plant.css("td")[0].text.strip
      second_text = plant.css("td")[1].text.strip 
      if(second_text != "") && (second_text != " ") && (first_text != "Plant Variety")
        plant_split = first_text.split(/ |-/)
        plant_name = plant_split.map {|word| word.strip.capitalize}.join(" ")
        plant_spacing = second_text.split("-")[0].to_i
        plants << {name: plant_name, spacing: plant_spacing}
      end 
    end 
    plants
  end 
end 
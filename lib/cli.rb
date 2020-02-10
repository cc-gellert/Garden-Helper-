require_relative './garden_plot.rb'
require_relative './plant.rb'
require_relative './scraper.rb'

class CommandLineInterface  
  def run
    get_plants
    add_plant_attributes
    greeting  
  end

  def get_plants
    plants_array = Scraper.scrape_index_page('https://app.seedtospoon.net/tabs/plant-list')
    Plant.create_from_array(plants_array)
  end

  def add_plant_attributes
    Plant.all.each do |plant|
      attributes = Scraper.scrape_plant(plant.profile_url)
      plant.add_plant_attributes(attributes)
    end
  end
  def greeting 
  end 
  def display_plants
    Plant.all.each do |plant|
      puts "#{plant.name}"
    end 
  end 
  def display_plant(plant)
    puts "#{plant}."
  end 
  def display_plots 
    GardenPlot.all.each do |plot|
      puts "#{plot.name} has #{plants} and #{footage} square feet."
    end 
  end 
  def display_plot(plot)
    plants = plot.plants 
    puts "#{plot.name} is #{footage} square feet and has #{plants}. It has #{leftover} square feet empty."
    puts "Would you like to add or remove plants from this plot?"
    input = gets.strip 
  end 
end
end 
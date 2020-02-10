require_relative './garden_plot.rb'
require_relative './plant.rb'
require_relative './scraper.rb'

class CommandLineInterface  
  def run
    get_plants
    add_plant_attributes
    greeting
    ask_for_input 
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
    puts "Hello! Welcome to Garden-Helper! Here you can lookup a plant, lookup a garden plot, list all plants, plan a new garden plot, view your garden plots, or edit a garden plot."
  end 
  def ask_for_input 
    puts "What would you like to do?"
    input = gets.strip.downcase  
    while input != "exit"
    case input 
    when "lookup a plant"
      puts "Great! What plant are you looking for?"
      name = gets.strip.capitalize 
      found_plant = Plant.find_by_name(name)
      found_plant.print
      ask_for_input 
    when "lookup a garden plot"
      puts "Ok, what is the name of the plot you are looking for?"
      name = gets.strip 
      found_plot = GardenPlot.find_by_name(name)
      found_plot.print 
      ask_for_input
    when "list all plants"
      display_plants 
      ask_for_input
    when "view garden plots"
      display_plots 
      ask_for_input
    when "plan a new garden plot"
      puts "Great! What would you like to call this new plot?"
      name = gets.strip 
      puts "Ok, got it. And how many square feet does it have?"
      footage = gets.strip 
      new_plot = GardenPlot.new(footage, name)
      new_plot.print 
      ask_for_input
    when "edit a garden plot"
      puts "Ok, great. What is the name of the plot you would like to change?"
      name = gets.strip 
      found_plot = GardenPlot.find_by_name(name)
      found_plot.print 
      puts "Would you like to add plants, remove plants, or delete this plot?"
      input = gets.strip 
      if input == "add plants"
        puts "What plant would you like to add?"
        plant = gets.strip.capitalize 
        puts "Ok, how many would you like to add?"
        number = gets.strip 
        found_plot.addPlant(plant, number)
      elsif input == "remove plants"
        puts "What plant would you like to remove?"
        plant = gets.strip.capitalize 
        puts "Ok, how many would you like to add?"
        number = gets.strip 
        found_plot.removePlant(plant, number)
      elsif input == "delete this plot"
        GardenPlot.delete_by_name(found_plot.name) 
      end 
      ask_for_input
    else 
      puts "Sorry, that doesn't look like a recognizable command. You may lookup a plant, lookup a garden plot, list all plants, view garden plots, plan a new garden plot, edit a garden plot, or exit."
      ask_for_input
    end 
  end 
  
  def display_plants
    Plant.all.each do |plant|
      puts "#{plant.name}"
    end 
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
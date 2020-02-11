require_relative './garden_plot.rb'
require_relative './plant.rb'
require_relative './scraper.rb'

class CommandLineInterface  
  
  base_url = "https://app.seedtospoon.net"
  
  def run
    get_plants
    add_plant_attributes
    greeting
    ask_for_input 
  end

  def get_plants
    plants_array = Scraper.scrape_index_page(base_url + "/tabs/plant-list")
    Plant.create_from_array(plants_array)
  end
  def add_plant_attributes
    Plant.all.each do |plant|
      attributes = Scraper.scrape_plant(plant[plant_profile_url])
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
        display_plant
        ask_for_input 
      when "lookup a garden plot"
        display_plot
        ask_for_input
      when "list all plants" || "list plants"
        display_plants 
        ask_for_input
      when "view garden plots" || "view plots"
        display_plots 
        ask_for_input
      when "plan a new garden plot" || "new plot"
        add_plot 
        ask_for_input
      when "edit a garden plot" || "edit plot"
        edit_plot 
        ask_for_input
      else 
        puts "Sorry, that doesn't look like a recognized command. You may lookup a plant, lookup a garden plot, list all plants, plan a new garden plot, view your garden plots, or edit a garden plot."
      end 
    end 
  end 
  
  #other methods 
  
  def display_plant
    puts "Great! What plant are you looking for?"
    name = gets.strip.capitalize 
    found_plant = Plant.find_by_name(name)
    if(found_plant)
      found_plant.print
    else 
      puts "Sorry, there isn't a plant by that name in our collection."
    end 
  end 
  
  def display_plants
    Plant.all.each do |plant|
      puts "#{plant.name}"
    end 
  end 
  
  def display_plots 
    if(GardenPlot.all.length == 0 )
      puts "There are currently no plots in this collection."
    else 
      GardenPlot.all.each do |plot|
        puts "#{plot.name} has #{plants} and #{footage} square feet."
      end 
    end 
  end
  
  def display_plot
    puts "Ok, what is the name of the plot you are looking for?"
    name = gets.strip 
    found_plot = GardenPlot.find_by_name(name)
    if(found_plot)
      found_plot.print 
    else 
      puts "Sorry, there isn't a plot by that name in this collection."
    end 
  end
  
  def add_plot 
    puts "Great! What would you like to call this new plot?"
    name = gets.strip 
    puts "Ok, got it. And how many square feet does it have?"
    footage = gets.strip 
    new_plot = GardenPlot.new(footage, name)
    new_plot.print 
  end 
  
  def edit_plot
      puts "Ok, great. What is the name of the plot you would like to change?"
      name = gets.strip 
      display_plot(name)
      puts "Would you like to add plants, remove plants, or delete this plot?"
      input = gets.strip.downcase  
      while input != "quit"
      if input == "add plants" || "add"
        puts "What plant would you like to add?"
        plant = gets.strip.capitalize 
        puts "Ok, how many would you like to add?"
        number = gets.strip 
        found_plot.addPlant(plant, number)
      elsif input == "remove plants" || "remove"
        puts "What plant would you like to remove?"
        plant = gets.strip.capitalize 
        puts "Ok, how many would you like to add?"
        number = gets.strip 
        found_plot.removePlant(plant, number)
      elsif input == "delete this plot" || "delete"
        GardenPlot.delete_by_name(name) 
      else 
        puts "I'm sorry, that's not a recognized command."
      end 
    end 
  end
end 
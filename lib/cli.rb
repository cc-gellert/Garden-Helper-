require_relative './garden_plot.rb'
require_relative './plant.rb'
require_relative './scraper.rb'
require 'pry'

class CommandLineInterface  
  def run
    get_plants
    greeting
    ask_for_input 
  end
  def get_plants
    base_url = "https://www.marysheirloomseeds.com/blogs/news/square-foot-garden-plant-spacing-chart"
    plants_array = Scraper.scrape_index_page(base_url)
    Plant.create_from_array(plants_array)
  end
  def greeting 
    puts "Hello! Welcome to Garden-Helper! Here you can lookup a plant, lookup a garden plot, list all plants, plan a new garden plot, view your garden plots, or edit a garden plot."
  end 
  def ask_for_input 
    puts "---------------------------"
    puts "What would you like to do?"
    input = gets.strip.downcase 
    case input 
    when "lookup a plant"
      display_plant
      ask_for_input 
    when "lookup a garden plot", "lookup a plot"
      display_plot
      ask_for_input
    when "list all plants", "list plants"
      display_plants 
      ask_for_input
    when "view garden plots", "view plots", "display plots", "list plots"
      display_plots 
      ask_for_input
    when "plan a new garden plot", "new plot", "make new plot", "make new garden plot", "add a plot"
      add_plot 
      ask_for_input
    when "edit a garden plot", "edit a plot", "edit plot"
      edit_plot 
      ask_for_input
    when "quit", "exit"
      goodbye 
      exit 
    else 
      puts "Sorry, that doesn't look like a recognized command. You may lookup a plant, lookup a garden plot, list all plants, plan a new garden plot,view your garden plots or edit a garden plot."
      ask_for_input
    end 
  end 
  
  #helper methods 
  
  def display_plant
    puts "Great! What plant are you looking for?"
    name_splits = gets.strip.split(" ")
    name = name_splits.map {|word| word.capitalize}.join(" ")
    found_plant = Plant.find_by_name(name)
    if(found_plant)
      found_plant.print_self
    else 
      puts "Sorry, there isn't a plant by that name in our collection."
    end 
  end 
  
  def display_plants
    puts "------------------------"
    Plant.all.each do |plant|
      puts "#{plant.name}"
    end 
  end 
  
  def display_plots 
    if(GardenPlot.all.length == 0 )
      puts "There are currently no plots in this collection."
    else 
      GardenPlot.all.each do |plot|
        puts "Garden Plot #{plot.name} is #{plot.footage} square feet."
        plot.plants.each {|plant, value| puts "It has #{value} #{plant}."} 
      end 
    end 
  end
  
  def display_plot
    puts "Ok, what is the name of the plot you are looking for?"
    name = gets.strip 
    found_plot = GardenPlot.find_by_name(name)
    if(found_plot)
      found_plot.print_self
    else 
      puts "Sorry, there isn't a plot by that name in this collection."
    end 
  end
  
  def add_plot 
    puts "Great! What would you like to call this new plot?"
    name = gets.strip 
    puts "Ok, got it. And how many square feet does it have?"
    footage = gets.strip.to_i  
    new_plot = GardenPlot.new(footage, name)
    new_plot.print_self 
  end 
  
  def edit_plot
    puts "Ok, great. What is the name of the plot you would like to change?"
    name = gets.strip 
    found_plot = GardenPlot.find_by_name(name)
    if(found_plot)
      found_plot.print_self
      puts "Would you like to add plants, remove plants, or delete this plot?"
      input = gets.strip.downcase  
      case input 
      when "add plants", "add"
        puts "What plant would you like to add?"
        plant = gets.strip.capitalize
        if (verify_plant?(plant)) 
          puts "Ok, how many would you like to add?"
          number = gets.strip.to_i 
          found_plot.addPlant(plant, number)
        else 
          puts "I'm sorry, that plant doesn't seem to exist in our database."
        end
      when "remove plants", "remove"
        puts "What plant would you like to remove?"
        plant = gets.strip.capitalize 
        if (verify_plant?(plant)) 
          puts "Ok, how many would you like to add?"
          number = gets.strip.to_i  
          binding.pry
          found_plot.removePlant(plant, number)
        else 
          puts "I'm sorry, that doesn't appear to be a plant in this plot."
        end 
      when "delete this plot", "delete"
        GardenPlot.delete_by_name(name) 
        puts "Ok, this plot has been deleted." 
      else 
        puts "Sorry, that's not a recognized command."
      end 
    else 
      puts "Sorry, there isn't a plot by that name in this collection."
    end 
  end
  
  def verify_plant?(plant)
    found_plant = Plant.find_by_name(plant)
    if !(found_plant)
      false
    else 
      true  
    end 
  end 
  
  def goodbye 
    puts "Goodbye! Happy Gardening."
  end 
end 
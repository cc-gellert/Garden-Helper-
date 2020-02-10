class GardenPlot 
  attr_accessor :footage, :name, :plants, :footageleft   
  @@all = []
  extends 
  def initialize(footage, name=nil)
    @footage = footage 
    @name = name
    @footageleft = footage 
    @plants = [] 
    save 
  end 
  def self.all 
    @@all 
  end 
  def save 
    @@all << self 
  end 
  def removePlant(plant_name, number=1)
    @plants[plant] = number 
    found_plant_object = Plant.find_by_name(plant)
    @footageleft -= (number * found_plant_object[spacing]) 
  end 
  def addPlant(plant, number=1)
    @plants[plant] += number || @plants[plant] = number 
    found_plant_object = Plant.find_by_name(plant)
    @footageleft -= (number * found_plant_object[spacing]) 
  end 
  def self.find_by_name(name)
    self.all.select {|plot| plot.name == name}
  end 
  def print
    puts "#{self.name} garden plot is #{self.footage} square feet and has:"
    self.plants.each do |plant, value|
      puts "#{value} #{plant} plants."
    end 
    puts "There is #{self.footageleft} square feet left in this plot."
  end 
end 
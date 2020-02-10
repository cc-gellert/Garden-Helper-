class GardenPlot 
  attr_accessor :footage, :name, :plants, :footageleft   
  @@all = []
  extends 
  def initialize(footage, name)
    @footage = footage 
    @name = name
    @footageleft = footage 
    @plants = {} 
    save 
  end 
  def self.all 
    @@all 
  end 
  def save 
    @@all << self 
  end 
  def removePlant(plant, number=1)
    found_plant_object = Plant.find_by_name(plant)
    if(@plants[plant] >= number )
      @plants[plant] -= number 
      @footageleft -= (number * found_plant_object[spacing])
    else 
      puts "There are only #{@plants[plant]} #{plant} plants here."
  end 
  def addPlant(plant, number=1)
    found_plant_object = Plant.find_by_name(plant)
    needed_space = found_plant_object[spacing] * number 
    if(@footageleft >= needed_space)
      @plants[plant] += number || @plants[plant] = number 
      @footageleft -= needed_space  
    else 
      puts "There is not enough space in this plot."
    end 
  end 
  def self.find_by_name(name)
    self.all.select {|plot| plot.name == name}
  end
  def self.delete_by_name(name)
    self.all.select {|plot| plot.name != name} 
  end 
  def print
    puts "#{self.name} garden plot is #{self.footage} square feet and has:"
    self.plants.each do |plant, value|
      puts "#{value} #{plant} plants."
    end 
    puts "There is #{self.footageleft} square feet left in this plot."
  end 
end 
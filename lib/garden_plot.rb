require 'pry'

class GardenPlot 
  attr_accessor :footage, :name, :plants, :footageleft   
  
  @@all = []
  
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
    if(@plants[plant] >= number)
      @plants[plant] -= number 
      @footageleft += (number * found_plant_object.spacing)
    else 
      puts "There are only #{@plants[plant]} #{plant} plants here."
    end 
  end 
  
  def addPlant(plant, number)
    found_plant_object = Plant.find_by_name(plant)
    needed_space = found_plant_object.spacing * number 
    if(@footageleft >= needed_space)
      if(@plants[plant])
        @plants[plant] += number 
      else 
        @plants[plant] = number 
      end  
      @footageleft -= needed_space  
    else 
      puts "There is not enough space in this plot."
    end 
  end 
  
  def self.find_by_name(name)
    self.all.detect {|plot| plot.name == name}
  end
  
  def self.delete_by_name(name)
    self.all.delete_if {|plot| plot.name == name} 
  end 
  
  def print_self
    puts "#{@name} garden plot:"
    if(@plants.size > 0)
      @plants.each do |plant, value|
        puts "Has #{value} #{plant} plants."
      end 
    else 
      puts "There are currently no plants here yet."
    end 
    puts "There is #{@footageleft} square feet of space left in this plot."
  end 
  
  def plant_in_garden?(plant)
    if (@plants.has_key?(plant)) 
      true 
    else 
      false 
    end 
  end 
end 
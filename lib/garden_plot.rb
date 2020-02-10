class GardenPlot 
  attr_accessor :footage, :name, :plants, :footageleft   
  @@all = [] 
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
  def removePlant(plant, number=1)
    @plants << plant 
    @footageleft -= number * plant.spacing 
  end 
  def addPlant(plant, number=1)
    @plants.remove(plant) 
    @footageleft -= number*plant.spacing
  end 
  #def find_by_name(name)
  #end 
  #def print 
  #end 
end 
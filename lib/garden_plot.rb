class GardenPlot 
  attr_accessor :footage, :name 
  @@all = [] 
  def initialize(footage, name=nil)
    @footage = footage 
    @name = name
    save 
  end 
  def self.all 
    @@all 
  end 
  def save 
    @@all << self 
  end 
  def removePlant(plant, number=1)
  end 
  def addPlant(plant, number=1)
  end 
  #def find_by_name(name)
  #end 
end 
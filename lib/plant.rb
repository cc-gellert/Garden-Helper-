class Plant 
  attr_reader :name, :spacing, :season, :sun, :watering, :harvesttime, :companions, :enemies 
  @@all = [] 
  def initialize(plant_hash) 
    plant_hash.each do |key, value|
      self.send("#{key}=", value)
    end 
    save 
  end
  def self.all 
    @@all 
  end 
  def save 
    @@all << self 
  end 
  def self.create_from_array(arr)
    arr.each do |plant_hash|
      Plant.new(plant_hash)
    end 
  end 
  def self.add_plant_attributes(attributes_hash)
    attributes_hash.each do |key, value| 
      self.send("#{key}=", value)
    end 
    self 
  end 
  #def find_by_name(name)
  #end 
  #def print 
  #end 
end 
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
  def self.find_by_name(name)
    self.all.select {|plant| plant.name == name}
  end 
  def print
    puts "#{self.name} is a #{self.season} season crop."
    puts "Recommended spacing is #{self.spacing} plants per square foot."
    puts "Recommended sun amount is #{self.sun} and for watering it #{self.watering}."
    puts "Time to harvest is #{self.harvesttime} days."
    puts "Good companion plants for #{self.name} are:"
    self.companions.each do |companion|
      puts "#{companion}."
    end 
    puts "Plants to avoid are:"
    self.enemies.each do |enemy|
      puts "#{enemy}."
    end 
  end 
end 
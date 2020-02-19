class Plant 
  attr_accessor :name, :spacing
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
  def self.find_by_name(name)
    self.all.detect {|plant| plant.name == name}
  end 
  def print_self
    puts "Information for #{@name}:"
    puts "Recommended spacing is #{@spacing} plants per square foot."
  end 
end 
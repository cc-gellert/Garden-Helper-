class Plant 
  attr_reader :spacing, :season, :sun, :watering, :harvesttime, :companions, :enemies 
  @@all = [] 
  def initialize(plant_hash) 
    plant_hash.each do |key, value|
      self.send("#{key}=", value)
    end 
  end
  def self.all 
    @@all 
  end 
  def save 
    @@all << self 
  end 
  #def find_by_name(name)
  #end 
end 
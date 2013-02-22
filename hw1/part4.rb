class Dessert
	def initialize(name, calories)
		raise(ArgumentError, "Argument Name must have at least one character") unless name.gsub(" ","").length > 0
		raise(ArgumentError, "Calories must be numeric") unless calories.kind_of?(Fixnum)
		@name = name 
		@calories = calories
	end

	attr_reader :name
	attr_reader :calories

	def healthy?
		@calories < 200
	end

	def delicious?
		true
	end
	
end

class JellyBean < Dessert
  
  def initialize(name, calories, flavor)
    super(name, calories)
	raise(ArgumentError, "Argument Name must have at least one character") unless flavor.gsub(" ","").length > 0
	@flavor = flavor
  end
  
  attr_reader :flavor
  
  def delicious?
    true unless @flavor == "black licorice"
	false
  end

end

# d1 = Dessert.new("Dango",500)
# d2 = JellyBean.new("JellyBean",250,"black licorice")

# puts "Is #{d1.name} Delicious? #{d1.delicious?}"
# puts "Is #{d2.name} with flavor '#{d2.flavor}' Delicious? #{d2.delicious?}"

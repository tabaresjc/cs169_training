# Create a constructor for the class CartesianProduct that that takes two sequences as arguments, 
# these values will define the behavior of your object. Define each as an instance method for CartesianProduct. 
# Your method should return an iterator which yields the cartesian product of the two sequences used in the class' constructor. 
# The iterator should yield the values one at a time as 2 element arrays.

class CartesianProduct
  include Enumerable
  def initialize(arr1,arr2)
	@arr1 = arr1
	@arr2 = arr2
  end
  
  def each 
	if @arr1.kind_of?(Enumerable) and @arr1.length > 0 and @arr2.kind_of?(Enumerable) and @arr2.length > 0
		@arr1.each do |x|
			@arr2.each do |y|
				yield [x,y]
			end
		end
	end
  end
end

# c = CartesianProduct.new([:a,:b], [4,5])
# c.each { |elt| puts elt.inspect }

# c = CartesianProduct.new([:a,:b], [])
# c.each { |elt| puts elt.inspect }
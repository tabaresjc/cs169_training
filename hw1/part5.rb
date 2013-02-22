class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
	
    class_eval %Q{
	  def #{attr_name}=(new_value)
		@#{attr_name} = new_value
		@#{attr_name + "_history"} = [nil] unless @#{attr_name + "_history"}		
		@#{attr_name + "_history"} << new_value
	  end
    }
  end
end

class Foo
    attr_accessor_with_history :bar
end

# f = Foo.new
# f.bar = 1
# f.bar = 2
# f = Foo.new
# f.bar = 4
# print f.bar_history 


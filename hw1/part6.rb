class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.000}  
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  
  def in(currency_id)
	currency = currency_id.to_s.gsub( /s$/, '')
	return self unless @@currencies.has_key?(currency)
	self / @@currencies[currency]
  end
end

class String
	def palindrome?
	  ss = self.downcase.gsub(/[^A-Za-z0-9]/,'')
	  ss == ss.reverse
	end
end

module Enumerable
	def palindrome?
		return false unless self.is_a?(Array)
		self.map { |x| x.to_s }.join.palindrome?
	end
end



def combine_anagrams(words)
	h = Hash[words.map {|x| [x.downcase.chars.sort.join, Array.new ]}]	
	words.each { |x| h[x.downcase.chars.sort.join].push(x) }	
	return h.values
end

# x = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'] 
# print combine_anagrams(x)
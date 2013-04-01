#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.

def palindrome?(str)
  ss = str.downcase.gsub(/[^A-Za-z0-9]/,'')
  ss == ss.reverse
end

def count_words(str)
	count = {}
	str.downcase.scan(/\b\w+\b/).each do |x|
		count[x] = if count.has_key? x
						count[x].next
					else
						1
					end
	end
	return count
end

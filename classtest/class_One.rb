module Classtest
	class One
		attr_reader :dress
		def initialize
			@one = 1
			end
		
		def method
			test = "class One"
			end
		
		def print_from_class_Two
			puts Classtest.second_test
			puts "Did it work? Do you see a note above here?"
			end
		end
	end
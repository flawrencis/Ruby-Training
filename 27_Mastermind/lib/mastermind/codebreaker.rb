module Mastermind
	
	class Codebreaker
		attr_reader :who
		
		def initialize(user_name)
			@breaker_name = name.split.map do |i|
				i.capitalize.join(" ")
				end
			new_name = breaker_name.strip.downcase.scan(/\w*/)
			@user_name= new_name[0][(0..3)]+new_name[2][(0..3)]
			end
		end
	end
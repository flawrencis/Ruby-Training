module Mastermind
	module GenCons
		#answers designating roles
		Breakans = "c"
		Makeans = "m"
		#the role label
		BreakerTitle = "breaker"
		MakerTitle = "maker"
		#code-length
		CodeLength = 4
		#max-rounds
		MaxRounds = 12
		
		Options = {a: "\e[1;31mR\e[0m",
		b: "\e[1;34mB\e[0m",
		c: "\e[1;36mC\e[0m",
		d: "\e[1;33mY\e[0m",
		e: "\e[1;35mM\e[0m",
		f: "\e[1;37mW\e[0m",
		g: "\e[1;32mG\e[0m"}
		
 		@role_options = [GenCons::BreakerTitle,GenCons::MakerTitle]
		
		class << self
			attr_accessor :role_options
			end

		end
	module GenMeans
		def self.put_break
			puts "\e[1,33m----------------------------------------------------------------------------------\e[0m"
			end
		
		def self.translate_array(array,from_key,to_key)
			puts "ERROR: Arrays not equal" if from_key.length != to_key.length
#			puts "DEBUG: We are at the beginning of translate_array.\nThe array is starting as #{array}."
			array.each_with_index do |x,i|
#				puts "Let's start with x as #{x}"
				for j in 0..from_key.length
					if x == from_key[j]
#						puts "x is #{x}"
						x = to_key[j]
#						puts "now x is #{x}"
						array[i] = x
#						puts "and now array[i] = #{array[i]}"
						end
					end
				end
#			puts "DEBUG: The new array is #{array}."
			return array
			end
		
		def self.colorize_array(dull_array)
			new = Array.new
			dull_array.each_with_index do |e,i|
				case e
					when "b"
					new[i] = "\e[1;34mB\e[0m"
					when "r"
					new[i] = "\e[1;31mR\e[0m"
					when "c"
					new[i] = "\e[1;36mC\e[0m"
					when "y"
					new[i] = "\e[1;33mY\e[0m"
					when "m"
					new[i] = "\e[1;35mM\e[0m"
					when "w"
					new[i] = "\e[1;37mW\e[0m"
					when "g"
					new[i] = "\e[1;32mG\e[0m"
					end
				end
			return new
			end
		
		def self.arr_rand_ord_to_chr
			rand_ord_array = Array.new(GenCons::CodeLength) {rand(97..103)} 
			chr_array = rand_ord_array.map {|ord_num| ord_num.chr}
#			puts "DEBUG: arr_rand_ord_to_chr is returning #{chr_array}!"
			return chr_array
			end
		
		def self.print_options
			puts GenCons::Options.values
			puts "What would you like to guess now?"
			resp = gets.chomp.downcase
			put_break
			return resp
			end
		end
		
	end

lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/mastermind/*.rb"].each { |file| require file }

puts "Hey, first, say what you want to call it without spaces followed by '=Mastermind::Game.new'."

#MISSING
#No lamdas
#No ternary operators
#No private functions

#Fail
#puts "What do you want to call this game? No spaces."
#gamename = gets.chomp
#gamename = Mastermind::Game.new
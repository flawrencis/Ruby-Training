module Mastermind
	class Computer
		
		def initialize(option)
			@role = option[0]
			puts "Your opponent is the computer!"
			end		
		
		def take_turn
			
			end
			
		def choose_code
			@options = {a: "\e[1;31mR\e[0m",
				b: "\e[1;34mB\e[0m",
				c: "\e[1;36mC\e[0m",
				d: "\e[1;33mY\e[0m",
				e: "\e[1;35mM\e[0m",
				f: "\e[1;37mW\e[0m",
				g: "\e[1;32mG\e[0m"}
			something = choose_code_by_index(options)
			code = Array.new(code_length)
			i = 0
			while i < code_length
				code[i] = options[rand_ord_array[i].to_sym].call
				i+=1
				end
			code
			end
		
		def choose_code_by_index(options)
			length = options.length
			rand_ord_array = Array.new(code_length) {rand(97..103)}
			rand_ord_array.map {|ord_num| ord_num.chr}
			end
		
		def print_code(the_code)
			puts the_code.join
			end			
		end
	end
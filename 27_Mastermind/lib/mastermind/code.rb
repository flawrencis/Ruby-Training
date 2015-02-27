#Do I need to keep the code private?? Yeah, I'm going to make all of these functions private.

module Mastermind
	require "/Users/francislawrence/.rbenv/versions/2.2.0/lib/ruby/gems/2.2.0/gems/colorize-0.7.5/lib/colorize.rb"

	class Code
		attr_reader :code_length, :choice_index, :options, :the_code
		def initialize(code_length=4)
			@code_length = code_length
			@the_code = choose_code
			puts "Okay, I have my code.\n"
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
		end #class end
	end #module end

#Sources
#http://stackoverflow.com/questions/7023951/ruby-how-to-map-a-function-to-a-hash
#http://stackoverflow.com/questions/1489183/colorized-ruby-output
#	YAY - great help!!
#http://kpumuk.info/ruby-on-rails/colorizing-console-ruby-script-output/
#http://en.wikipedia.org/wiki/ANSI_escape_code
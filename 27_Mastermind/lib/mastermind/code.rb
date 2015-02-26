#Do I need to keep the code private?? Yeah, I'm going to make all of these functions private.

#module Mastermind
	require "/Users/francislawrence/.rbenv/versions/2.2.0/lib/ruby/gems/2.2.0/gems/colorize-0.7.5/lib/colorize.rb"

	class Code
		attr_reader :code_length, :choice_index, :options
		def initialize(code_length=4)
			@code_length = code_length
			@the_code = choose_code
			end
		
#		private
		
		def choose_code
#			get_options
			@options = {r: lambda { puts "R".red },
				b: lambda { puts "B".blue },
				c: lambda { puts "C".cyan },
				g: lambda { puts "G".green },
				m: lambda { puts "M".magenta },
				w: lambda { puts "W".white },
				y: lambda { puts "Y".yellow }}
			@choice_index = choose_code_by_index(options)
			code = Array.new(code_length)
			choice_index.each do |i|
				code.each_with_index do |b,j|
					code[j] = options[i-1].call
					end
				end
			end
				
				
		def choose_code_by_index(options)
			length = options.length
			Array.new(code_length) {rand(0..length)}
			end
		
#		def get_options
#			a = puts "R".red
#			b = puts "B".blue
#			c = puts "Y".yellow
#			d = puts "G".green
#			e = puts "P".magenta
#			f = puts "W".white
#			g = puts "C".cyan
#			options = [a,b,c,d,e,f,g]
#			end
		
		
		
		end #class end
	
	
#	end #module end

#Sources
#http://stackoverflow.com/questions/7023951/ruby-how-to-map-a-function-to-a-hash
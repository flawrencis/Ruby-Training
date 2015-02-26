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
		
#		private
		
		def choose_code
#			get_options
			@options = {a: lambda { print "R".red },
				b: lambda { print "B".blue },
				c: lambda { print "C".cyan },
				d: lambda { print "G".green },
				e: lambda { print "M".magenta },
				f: lambda { print "W".white },
				g: lambda { print "Y".yellow }}
#			@options = ['']
			something = choose_code_by_index(options)
			code = Array.new(code_length)
			i = 0
			while i < code_length
#				code.each_with_index do |b,j|
#					code[j] = options[i-1].call
#				code[j] = options[something[i].to_sym].call
				code[i] = options[something[i].to_sym].call
				i+=1
				end
			code
			end
		
		def choose_code_by_index(options)
			length = options.length
			something = Array.new(code_length) {rand(97..103)}
			joe = Array.new(code_length)
#			lett_array = ("a".."g").to_a
#			counter = 0
#			while counter < code_length
#				joe.each_with_index do |stuff,place|
#					joe[counter] = something[counter].chr
#					end
#				counter += 1
#				end
			something.map {|ark| ark.chr}
			end
				
				
#		def choose_code_by_index(options)
#			length = options.length
#			Array.new(code_length) {rand(0..length)}
#			end
		
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
	
	
	end #module end

#Sources
#http://stackoverflow.com/questions/7023951/ruby-how-to-map-a-function-to-a-hash
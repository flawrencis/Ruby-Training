module Mastermind
	
	module Codebreaker
		@@instructions = "Welcome!\nTry to guess your opponent's code within the maximum number of rounds.\nTo do this, enter your guess without any additional spacing or punctuation, when prompted."
		@@feedback_explanation = "Your opponent will respond to you without regard to order. They will give you a 2 for each correct letter in the correct place. They will give you a 1 for each additional correct letter. And they will give you a 0 for each additional letter."
		def intro(length,rounds)
			directions = ::Codebreaker.instructions
			resp_explanation = ::Codebreaker.feedback_explanation
			puts directions
			puts "Maximum rounds: #{rounds}.\nCode length: #{length}"
			puts "Your options are: " + GenCons::Options.values
			puts resp_explanation
			end
		
		def take_turn(round,feedback="mum")
			@guess_grid[round-1][1]=feedback if defined? guess_grid
			@guess_grid ||= Array.new
			your_turn = "\nOkay, we're on round #{round} and it's your turn, #{name}"
			name = "Great #{GenCons::Breaker_title.capitalize}."
			the_question = "What do you say? #{follow_up_question}"
			follow_up_question = "What is your next guess for the code? So far, your guesses and their responses have been...."
			puts your_turn
			puts "Your opponent said #{feedback}."
			puts the_question
			print_record(@guess_grid) if dabreaker==true
#			puts turn_grid
			resp = gets.chomp.downcase
			print_options if resp == "o"
			@turn_result = resp.upcase.scan(/([a..g]).*([a..g]).*([a..g]).*([a..g])/)[0].join if dabreaker==true
			guess_grid << [turn_result,"xxxx"] if dabreaker == true
			end
		
		def response
			@turn_result
			end
		
		def print_record(record)
			record.each {|k,v| puts "Round #{k} : #{v}"}
			end
		
		def print_options
			puts options
			puts "What would you like to guess now?"
			resp = gets.chomp.downcase
			end
		end
	
	
	
	
	module Codemaker < Codebreaker
		@@instructions = "Now we gotta make a code.\nYour opponent wins if they guess the code before the maximum number of rounds.\nThe length of the code has been pre-determined.\nUse the upcoming list to know what your options are."
		@@feedback_explanation = "They will guess the code.\n\tFor every element that is correct and in the right place, give a 2.\n\tFor every additional element that is correct, give a 1.\n\tFor every additional element, give a 0.\nType this digit code without any additional punctuation or characters, followed by the return key."
		def intro(length,rounds)
			directions = ::Codemaker.instructions
			resp_explanation = ::Codemaker.instructions
			
			the_code = get_code(length)
			return the_code
			end
		
		def get_code(length)
			puts "Check out the options and then give me a #{length}-letter code."
			resp = gets.chomp.downcase
			code = resp.upcase.scan(/([a..g]).*([a..g]).*([a..g]).*([a..g])/)[0].join if length == 4
			puts "This program can't receive a code longer than 4 letters." unless length == 4
			end
			
		def take_turn (round,feedback)
			dabreaker = false
			name = "Great #{GenCons::Maker_title.capitalize}."
			follow_up_question = "How'd they do? Give me that digit response."
			answer = resp.scan(/([0,1,2]).*([0,1,2]).*([0,1,2]).*([0,1,2])/)[0].join
			end
		end
	
	
	
	end

#Sources
#http://stackoverflow.com/questions/7870681/get-a-reference-to-the-enclosing-module-in-ruby
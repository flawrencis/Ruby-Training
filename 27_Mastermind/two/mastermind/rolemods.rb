module Mastermind
	
	module Codebreaker
		@@b_instructions = "\n\e[1;35mOkay!\e[0m I have instructions for the codebreaker!\nWelcome!\nTry to guess your opponent's code within the maximum number of rounds.\nTo do this, enter your guess without any additional spacing or punctuation, when prompted."
		@@b_explanation = "\nFeedback explanation:\n\tYour opponent will respond to you without regard to order.\n\tThey will give you a 2 for each correct letter in the correct place.\n\tThey will give you a 1 for each additional correct letter.\n\tAnd they will give you a 0 for each additional letter."
		
		def intro(length,rounds)
			directions = @@b_instructions
			resp_explanation = @@b_explanation
			puts directions
			puts "Maximum rounds: #{rounds}.\nCode length: #{length}"
#			puts "DEBUG: Oops. My bad. Earlier, I had puts '\"Your options are: \" + GenCons::Options.values' but I've changed it to 'puts \"Your options are: \" + GenCons::Options.values.join(\", \")'"
			puts "Your options are: " + GenCons::Options.values.join(", ")
			puts resp_explanation
			puts "Is everything clear?"
			blahblah = gets
			GenMeans.put_break
			return
			end
		
		def take_turn(round,feedback)
#			puts "DEBUG: Right now, guess_grid is #{@guess_grid}. Let's change that by going to the #{round-2}th element of guess_grid and replacing the 2nd element of that with the actual feedback, which is #{feedback}." if defined? @guess_grid
			@guess_grid[round-2][2] = feedback if defined? @guess_grid
#			puts "DEBUG: Great, so I should have just changed the 'xxxx' to #{feedback}!" if defined? @guess_grid
#			puts "DEBUG: Apparently guess_grid is not defined!" unless defined? @guess_grid
			@guess_grid ||= Array.new
			your_turn = "Okay, we're on round #{round} and it's your turn, #{@user_name}"
			name = "Great #{GenCons::BreakerTitle.capitalize}."
			follow_up_question = "What is your next guess for the code? So far, your guesses and their responses have been...."
			the_question = "What do you say? #{follow_up_question}"
			puts your_turn
			puts "The feedback for your guess is \e[33m#{feedback}\e[0m."
			puts the_question
			print_record(@guess_grid)
			resp = gets.chomp.downcase
			GenMeans.put_break
			resp = GenMeans.print_options if resp == "o"
#			puts "DEBUG: resp is #{resp} which is of class #{resp.class}"
			resp_scanned = resp.scan(/([bcgrwym])[^bcgrwym]*([bcgrwym])[^bcgrwym]*([bcgrwym])[^bcgrwym]*([bcgrwym])[^bcgrwym]*/)[0]
#			puts "DEBUG: resp_scanned is #{resp_scanned} which is of class #{resp_scanned.class}."
			pre_guess_colored = GenMeans.colorize_array(resp_scanned)
			guess = pre_guess_colored.join(" ")
			@guess_grid << [round,guess,"xxxx"]
			return guess
			end
		

			
		
		def print_record(record)
#			puts "DEBUG: Just entered print_record function."
			record.each {|k,v,y| puts "Round #{k} | #{v} : #{y}"}
			puts "...oh well this is the first round" if record == []
			end
		end
	
	
	
	
	module Codemaker
		@@m_instructions = "\n\e[1;31mOkay!\e[0m Lemme talk to the codemaker.\n\nCodemaker, we gotta make a code.\nYour opponent wins if they guess the code before the maximum number of rounds.\nThe length of the code has been pre-determined.\nUse the upcoming list to know what your options are."
		@@m_explanation = "They will guess the code.\n\tFor every element that is correct and in the right place, give a 2.\n\tFor every additional element that is correct, give a 1.\n\tFor every additional element, give a 0.\nType this digit code without any additional punctuation or characters, followed by the return key."
		def intro(length,rounds)
			directions = @@m_instructions
			puts directions
			puts "Maximum rounds: #{rounds}.\nCode length: #{length}"
			puts "Your options are: " + GenCons::Options.values.join(", ")
			resp_explanation = @@m_explanation
			puts "Do you understand?"
			blahblah = gets
			GenMeans.put_break
			the_code = get_code(length)
#			puts "DEBUG: I'm in the Codemaker's intro.\nI just got the code from the get_code function.\nThe code is....................#{the_code}"
			return the_code
			end
		
		def get_code(length)
			puts "Check out the options and then give me a #{length}-letter code, #{@user_name}"
			resp = gets.chomp.downcase
			GenMeans.put_break
			dull_code = resp.scan(/([bcgrwym])[^bcgrwym]*([bcgrwym])[^bcgrwym]*([bcgrwym])[^bcgrwym]*([bcgrwym])[^bcgrwym]*/)[0] if length == 4
			puts "This program can't receive a code longer than 4 letters.\nI know what I told you. I messed up. This may be goodbye." unless length == 4
			array_code = GenMeans.colorize_array(dull_code)
			code = array_code.join(" ")
			return code
			end
			
		def take_turn (round,feedback,code)
			your_turn = "\nOkay, we're on round #{round} and it's your turn, #{@user_name}"
			follow_up_question = "How'd they do? Give me that digit response."
			the_question = "What do you say? #{follow_up_question}"
			puts your_turn
			puts "Your opponent said #{feedback}."
			puts the_question
			resp = gets.chomp.downcase
			GenMeans.put_break
			GenMeans.print_options if resp == "o"
			answer = resp.scan(/([0,1,2])[^012]*([0,1,2])[^012]*([0,1,2])[^012]*([0,1,2])/)[0].join
			end

		end
	
	
	
	end

#Sources
#http://stackoverflow.com/questions/7870681/get-a-reference-to-the-enclosing-module-in-ruby
#http://rubylearning.com/satishtalim/ruby_overriding_methods.html
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
			Mastermind.put_break
			return
			end
		
		def take_turn(round,feedback)
			@guess_grid[round-1][1]=feedback if defined? guess_grid
			@guess_grid ||= Array.new
			your_turn = "\nOkay, we're on round #{round} and it's your turn, #{name}"
			name = "Great #{GenCons::BreakerTitle.capitalize}."
			the_question = "What do you say? #{follow_up_question}"
			follow_up_question = "What is your next guess for the code? So far, your guesses and their responses have been...."
			puts your_turn
			puts "Your opponent said #{feedback}."
			puts the_question
			print_record(@guess_grid) if dabreaker==true
#			puts turn_grid
			resp = gets.chomp.downcase
			Mastermind.put_break
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
			Mastermind.put_break
			end
		end
	
	
	
	
	module Codemaker
		@@m_instructions = "\n\e[1;31mOkay!\e[0m Lemme talk to the codemaker.\n\nCodemaker, we gotta make a code.\nYour opponent wins if they guess the code before the maximum number of rounds.\nThe length of the code has been pre-determined.\nUse the upcoming list to know what your options are."
		@@m_explanation = "They will guess the code.\n\tFor every element that is correct and in the right place, give a 2.\n\tFor every additional element that is correct, give a 1.\n\tFor every additional element, give a 0.\nType this digit code without any additional punctuation or characters, followed by the return key."
		def intro(length,rounds)
			puts "\e[1,33m----------------------------------------------------------------------------------\e[0m"
			Mastermind.put_break
			directions = @@m_instructions
			puts directions
			puts "Maximum rounds: #{rounds}.\nCode length: #{length}"
			puts "Your options are: " + GenCons::Options.values.join(", ")
			resp_explanation = @@m_explanation
			puts "Do you understand?"
			blahblah = gets
			Mastermind.put_break
			the_code = get_code(length)
			return the_code
			end
		
		def get_code(length)
			puts "Check out the options and then give me a #{length}-letter code."
			resp = gets.chomp.downcase
			Mastermind.put_break
			code = resp.scan(/([b,c,g,r,w,y,m]).*([b,c,g,r,w,y,m]).*([b,c,g,r,w,y,m]).*([b,c,g,r,w,y,m])/)[0].join if length == 4
#			sub_code = resp.scan(/([b,c,g,r,w,y,m]).*([b,c,g,r,w,y,m]).*([b,c,g,r,w,y,m]).*([b,c,g,r,w,y,m])/)[0].join if length == 4
#			puts "DEBUG: The sub_code, without the join function, is #{sub_code}, which is of class #{sub_code.class}.\nIf it's not a string, we know what the problem is!"
#			sub_code.join if length == 4
			puts "This program can't receive a code longer than 4 letters.\nI know what I told you. I messed up. This may be goodbye." unless length == 4
			end
			
		def take_turn (round,feedback)
#			@guess_grid[round-1][1]=feedback if defined? guess_grid
#			@guess_grid ||= Array.new
			your_turn = "\nOkay, we're on round #{round} and it's your turn, #{name}"
			name = "Great #{GenCons::MakerTitle.capitalize}."
			the_question = "What do you say? #{follow_up_question}"
			follow_up_question = "How'd they do? Give me that digit response."
			puts your_turn
			puts "Your opponent said #{feedback}."
			puts the_question
			resp = gets.chomp.downcase
			Mastermind.put_break
			print_options if resp == "o"
			answer = resp.scan(/([0,1,2]).*([0,1,2]).*([0,1,2]).*([0,1,2])/)[0].join
			end
		
		def print_options
			puts options
			puts "What would you like to guess now?"
			resp = gets.chomp.downcase
			Mastermind.put_break
			end
		end
	
	
	
	end

#Sources
#http://stackoverflow.com/questions/7870681/get-a-reference-to-the-enclosing-module-in-ruby
#http://rubylearning.com/satishtalim/ruby_overriding_methods.html
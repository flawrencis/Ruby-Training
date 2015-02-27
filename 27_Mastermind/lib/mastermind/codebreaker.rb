module Mastermind
	
	class Codebreaker
		attr_reader :user_name,
		
		def initialize(user_name,real_name)
			user_name = user_name
			real_name = real_name
			@two_names = [user_name, real_name]
			intro_breaker(two_names)
			@award = 6
			end
		
		def play_breaker #what breaker does in his turn.
			end
		
		def intro_(two_names)
			real_name = two_names[1].split(" ")[0]
			puts "Welcome master sleuth General #{first_name}!"
			puts "Try to guess #{Codemaker.user_name}'s #{Code.code_length}-letter code in #{Game.max_rounds} rounds or fewer!"
			puts "\tLet's say the secret code is 4-letters: " + "Y".yellow + "B".blue + "R".red + "G".green + ".\n"
			puts "\tThen, on each of your turns, you would have the opportunity to type in a #{Code.code_length}-letter guess.\n"
			puts "\tLet's say you guess GMYG. (Don't try to color your text.)"
			puts "\t#{Codemaker.user_name} may then respond...\n"
			puts "\n1002\n"
			puts "\n\tOr, they may respond...\n"
			puts "\n0210\n"
			puts "\n\tSee, no indication is given as to which of your guess units were correct.\n"
			puts "/tWhat you will know is:"
			puts "\n\t\tONE of your guess-units (G) was the right color and in the right place, as indicated by '2'."
			puts "\n\t\tONE of your guess-units (Y) was the right color but not in the right place, as indicated by '1'."
			puts "\n\t\tTWO of your guess-units (M,G) didn't belong at all! Thus, '0' and '0'.\n"
			puts "\tEvery time you fail to guess the code, #{Codemaker.user_name} earns 1 point!\n"
			puts "\tOnce you get it right, you get #{award} points as long as you solved it in time.\n"
			puts "\tOf course that don't mean much since I don't yet know how to keep record. Something to do with class variables, I assume!".
			
			end
		end
	end
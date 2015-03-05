module Mastermind
	class Codemaker
		#gets sent the username of codemaker
		attr_reader :user_name,
		def initialize(user_name,real_name)
			user_name = user_name
			real_name = real_name
			@two_names = [user_name, real_name]
			intro_maker(two_names)
			
			end
		
		
		def intro_maker(two_names)
			real_name = two_names[1].split(" ")[0]
			puts "Welcome master sleuth General #{first_name}!"
			puts "Try to come up with a tricky #{Code.code_length}-letter code that #{Codebreaker.user_name} won't guess in #{Game.max_rounds} rounds or fewer!"
			puts "\tLet's assume the code is supposed to be 4 letters." unless Code.code_length == 4 
			puts "Let's say the code you pick is: " + "Y".yellow + "B".blue + "R".red + "G".green + ".\n"
			puts "\tThen, #{Codebreaker.user_name} will try to guess it (but without the colored text)."
			puts "\nLet's say your opponent guesses... GYMG\n\n"
			puts "Now, you may respond..."
			puts "\n1002\n"
			puts "\n\tOr, you may respond...\n"
			puts "\n0210\n"
			puts "\n\tSee, you don't need to give any indication of which guess units were correct.\n"
			puts "/tWhat you DO need to communicate is:"
			puts "\n\t\tONE of the guess-units (G) was the right color and in the right place, as indicated by '2'."
			puts "\n\t\tONE of the guess-units (Y) was the right color but not in the right place, as indicated by '1'."
			puts "\n\t\tTWO of the guess-units (M,G) didn't belong at all! Thus, '0' and '0'.\n"
			puts "\tEvery time the code isn't failed, you gain 1 point!\n"
			puts "\tIf guessed correctly, no matter when before the game ends, the guesser gets #{award} points.\n"
			puts "\tOf course that don't mean much since I don't yet know how to keep record. Something to do with class variables, I assume!"
			
			#KEEP WORKING HERE. MUST SAY OPTIONS, MUST WRITE CODE FOR WRITING CODE, MUST GIVE OPTIONS FOR HOW TO RESPOND AND WRITE CODE FOR READING RESPONSE.
			end
		
		def play_maker(round_num,guess) #what maker does in his turn.
			
			end
		end
		
			
			
	end
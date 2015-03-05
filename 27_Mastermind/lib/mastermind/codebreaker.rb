module Mastermind
	
	class Codebreaker
		attr_reader :user_name, :first_name
		
		def initialize(user_name,real_name)
			@options = Code.options.values
			user_name = user_name
			real_name = real_name
			@two_names = [user_name, real_name]
			intro_breaker(two_names)
			@award = 6
			end
		
		def intro_breaker(two_names)
			first_name = two_names[1].split(" ")[0]
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
			puts "\tOf course that don't mean much since I don't yet know how to keep record. Something to do with class variables, I assume!"
			puts "That's about everything. Your options are:"
#			puts "\n\e[1;34mB\e[0m \e[1;34mB\e[0m \e[1;36mC\e[0m \e[1;33mY\e[0m \e[1;35mM\e[0m \e[1;37mW\e[0m \e[1;32mG\e[0m\n\n"
			puts options
			puts "\e[1;4;5;31mRemember: \e[0m\e[1;4;31mDo not guess any more than 4 letters or the game will crash!\e[0m"
			
			
			
			
			puts "\tAnyway, I think we're all set with you. I just gotta check on something.\n"
			puts "------------------------------------------------\n"
			end
		
		def play_breaker(round_num,feedback) #breaker's turn
			
			puts "We are now in round #{round_num}."
			puts "The codemaker's response was..."
			puts "\n#{feedback}"
			puts "\nSo far, we have:\n\n"
			print_record(@record)
			puts "What would you like to guess now?"
			resp = gets.chomp.downcase
			print_options if resp == "o"
			guess = resp.upcase.scan(/([a..g]).*([a..g]).*([a..g]).*([a..g])/)[0].join
				end
			end
		
		def print_record(record)
			record.each {|k,v| puts "Round #{k} : #{v}"}
			end
		
		def print_options
#			puts "\n\e[1;34mB\e[0m \e[1;34mB\e[0m \e[1;36mC\e[0m \e[1;33mY\e[0m \e[1;35mM\e[0m \e[1;37mW\e[0m \e[1;32mG\e[0m\n\n"
			puts options
			puts "What would you like to guess now?"
			resp = gets.chomp.downcase
		end
	end
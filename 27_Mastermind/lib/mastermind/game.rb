module Mastermind
	class Game
		attr_reader :player_two, :player_one, :round_num, :max_rounds
#		:breaker, :player_hash
		
		def initialize
			@breaker = "c"
			@maker = "m"
			puts "Welcome to your new game of Mastermind."
			who_is_playing
			@round_num = 0
			@max_rounds = 12
#			begin_play
			end
		
		def who_is_playing
			puts "I need two players. Will the computer be your oponent? [y/n]"
			who_response = String.new
			gets.chomp.scan(/([y,n])(.*)/) {|x,b| who_response = x.to_s}
			player_hash = get_role_including_name_call
			player_initiation(player_hash)
			if who_response == "n"
				get_role_including_name_call(2)
#				puts "Gotta call already_decided.\n"
				already_decided(@player_one,@player_two)
#				puts "Thanks a_d, now two is #{@player_two}.\n"
				player_initiation(@player_two) 
				end
			end

		
		def player_initiation(hash)
			case hash[:role]
				when "MAKER"
				puts "Okay, maker! Let's get you started!\n"
				Codemaker.new(hash.values_at(:user_name,:real_name))
				when "BREAKER"
				puts "Okay, code-breaker! Let's get you setup!\n"
				Codebreaker.new(hash.values_at(:user_name,:real_name))
				end
			end
		
		def already_decided(first_hash,player_two)
#			puts "A_D, currently two is #{@player_two}.\n"
#			puts "\nMeanwhile, first_hash is #{first_hash}.\n"
			if first_hash[:role]== "BREAKER"
				@player_two[:role]= "MAKER"
#				puts "Made two's role MAKER. See? #{@player_two}.\n"
				else
				@player_two[:role]= "BREAKER"
#				puts "Made two's role BREAKER. See? #{@player_two}.\n"
				end
			end
			
		
		
		def get_role_including_name_call(num_players=1) #parameter for 2nd player
			puts "Are you here to crack the code or make the code? [c/m]"
			role_response = String.new
			gets.chomp.scan(/([c,m])(.*)/) {|x,rest| role_response = x.to_s}
			if role_response == @breaker
				role = "BREAKER"
				elsif role_response == @maker
				role = "MAKER"
				end
				
			info = Array.new
			info = get_name
			info << role
			player_hash = {user_name: info[0], real_name: info[1], role: info[2]}
			if num_players == 2
				@player_two = player_hash
				else
				@player_one = player_hash
				end
			end
		
		
		
		def get_name
			puts "What's your name? Example: John Butt"
			name = gets.chomp
			real_name = name.split.map {|i| i.capitalize}.join(" ")
			new_name = real_name.strip.downcase.scan(/\w*/)
			user_name= new_name[2][(0..3)] + new_name[0][(0..3)]
			[user_name,real_name]
			end
		end
	end
		
#return unless
#	http://codereview.stackexchange.com/questions/59744/early-return-unless-return-value-is-nil
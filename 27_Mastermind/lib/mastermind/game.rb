module Mastermind
	class Game
		attr_reader :player_two, :player_one, :breaker, :player_hash
		
		def initialize
			@breaker = "c"
			@maker = "m"
			puts "Welcome to your new game of Mastermind."
			who_is_playing
#			puts "Are you playing against the computer or a friend? [c/f]"
#			@which = get_name_and_role
#			Codebreaker.new(which[1]) unless which[0].equals? "MAKER"
#			@rounds = 12
#			begin_play
			end
		
#		def who_first
#			pick = Array.new(50) {rand(1..1000)}
#			pindex = rand(0..50)
#			if pick[pindex]%2 == 0
#				end
#			end
		
		def who_is_playing
			puts "This is a two player game. Will the computer be your oponent? [y/n]"
			who_response = String.new
			gets.chomp.scan(/([y,n])(.*)/) {|x,b| who_response = x.to_s}
#			first_up = who_first
			player_hash = get_role_including_name_call
			player_initiation(player_hash)
			if who_response == "n"
				player_hash = get_role_including_name_call(2)
				puts "Right now, the player_hash is #{@player_two}. Let's call already_decided.\n"
				@player_two = already_decided(player_hash,@player_two)
				puts "Now that we've finished a_d, the player_hash is #{@player_two}.\n"
#				@player_two = player_hash
				player_initiation(@player_two) 
				end
			end
		
#		def player_creation(num_players=1) #AND FIXING
#			player_hash = get_role_including_name_call(num_players)
##			if num_players == 2
##				if player_one[:role] == player_two[:role]
##					@player_two[:role] = "m"
##					@player_one[:role] = "b"
##					end
##				end
#			return player_hash
#			end
		
		def player_initiation(player_hash)
			case player_hash[:role]
				when "MAKER"
				puts "You made it!"
#				Codemaker.new(player_hash[:user_name])
				
#				intro(role)
				when "BREAKER"
				puts "You didn't break it! Fail!"
#				Codebreaker.new(who[:user_name])
				end
			end
		
		def already_decided(first_hash,player_two)
			if first_hash[:role]== "BREAKER"
				player_two[:role]== "MAKER"
				puts "I've just changed player two's hash to MAKER. See for yourself : #{@player_two}.\n"
				else
				player_two[:role]= "BREAKER"
				puts "I've just changed player two's hash to BREAKER. See for yourself : #{@player_two}.\n"
				end
			@player_two = player_two
#			player_hash = the_hash
#			return player_hash
			end
			
		
#		def first_player
#			get_role_including_name_call
#			case which[0]
#				when "MAKER"
#				Codemaker.new(which[1])
#				when "BREAKER"
#				Codebreaker.new(which[1])
#				end
#			end
#		
#		def second_player
#			get_role_including_name_call
#			case which[0]
#				when "MAKER"
#				Codemaker.new(which[1])
#				when "BREAKER"
#				Codebreaker.new(which[1])
#				end
#			
#			end
 
		
		def get_role_including_name_call(num_players=1) #The number of people playing.
			puts "Are you here to crack the code or make the code? [c/m]"
			role_response = String.new
			gets.chomp.scan(/([c,m])(.*)/) {|x,rest| role_response = x.to_s}
			if role_response == breaker
				role = "BREAKER"
#				user_name = get_name(role)
				elsif role_response == maker
				role = "MAKER"
				end
				
			info = Array.new
			info = get_name
			info << role
#			player_one ||= {user_name: info[0], real_name: info[1], role: info[2]}
			player_hash = {user_name: info[0], real_name: info[1], role: info[2]}
#			return unless people == 2
#			@player_two = {user_name: info[0], real_name: info[1], role: info[2]}
			if num_players == 2
				@player_two = player_hash
				else
				@player_one = player_hash
				end
#			already_decided = true
			return player_hash
			end
		
		
		
		def get_name
			puts "What's your name? Example: John Butt"
			name = gets.chomp
			real_name = name.split.map {|i| i.capitalize}.join(" ")
			new_name = real_name.strip.downcase.scan(/\w*/)
			user_name= new_name[2][(0..3)] + new_name[0][(0..3)]
			[user_name,real_name]
			end
		
		def intro(role)
			case role
				when "BREAKER"
				intro_codebreaker
				when "MAKER"
				intro_codemaker
				end
			end
		end
	end
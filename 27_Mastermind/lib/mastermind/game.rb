module Mastermind
	class Game
		
		attr_reader :round_num :current_player :player_one
		
		def initialize
			puts "Welcome to your new game of Mastermind."
			who_is_playing
#			puts "Are you playing against the computer or a friend? [c/f]"
#			@which = get_name_and_role
#			Codebreaker.new(which[1]) unless which[0].equals? "MAKER"
#			@rounds = 12
			begin_play
			end
		
		def who_is_playing
			puts "This is a two player game. Will the computer be your oponent? [y/n]"
			gets.chomp.scan(/([y,n])(.*)/) {|x,b| who_response = x.to_s}
			player_initiation
			player_initiation(2) if who_response.equals? "n"
			end
		
		def player_initiation(num_players)
			get_role_including_name_call(num_players)
			case info[:role]
				when "MAKER"
				Codemaker.new(info[:user_name])
#				intro(role)
				when "BREAKER"
				Codebreaker.new(info[:user_name])
				end
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
 
		
		def get_role_including_name_call(people=1) #The number of people playing.
			puts "Are you here to crack the code or make the code? [b/m]"
			gets.chomp.scan(/([b,m])(.*)/) {|x,b| role_response = x.to_s}
			if role_response == "b"
				role = "BREAKER"
#				user_name = get_name(role)
				elsif role_response == "m"
				role = "MAKER"
				end
			info = Array.new
			info = get_name
			info << role
			@player_one = {user_name: info[0], real_name: info[1], role: info[2]}
			return unless people == 2
			@player_two = {user_name: info[0], real_name: info[1], role: info[2]}
			end
		
		def get_name
			puts "What's your name? Example: John Butt"
			name = gets.chomp
			real_name = name.split.map do |i|
				i.capitalize.join(" ")
				end
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
			
module Mastermind
	class Game
		attr_reader :game_name
		@@record = Hash.new
		def initialize
			@round_num = 0
			@max_rounds = GenCons::MaxRounds
			@code_length = GenCons::CodeLength
			GenCons.role_options = [GenCons::BreakerTitle,GenCons::MakerTitle]
			start_method = "player_setup"
			puts "Welcome to this game of Mastermind! When you're ready to run the game, simply type whatever you called it, followed by '.#{start_method}!"
			end
		
		def self.record
			@@record
			end
		

		def self.new_entry(user,role)
			@@record[user.to_sym] ||= {total: 0,wins: 0, total_as_breaker: 0, wins_as_breaker: 0, total_as_maker: 0,  wins_as_maker: 0}
			their_role = "total_as_#{role}".intern
			@@record[user.to_sym][their_role]+=1
			end

		def how_many_players
			puts "Yo man, are you playing against the computer? [y/n]"
			who_response = String.new
			x = String.new
			resp = gets.chomp.scan(/([y,n])(.*)/)[0][0]
			GenMeans.put_break
#			puts "DEBUG: Right now, resp is set equal to 'gets.chomp.scan(/([y,n])(.*)/)[0][0]', which makes #{resp}."
#			puts "DEBUG: I'm the end of 'how_many_players' and going to return the string 'hh' because resp is #{resp}" if resp == "n"
			return "hh" if resp == "n"
#			puts "DEBUG: I'm the end of 'how_many_players' and going to return the string 'hc' because resp is #{resp}"
			return "hc"
			end

		def need_partner? game_type
#			puts "DEBUG: I am at the end of need_partner? and am returning false" if game_type.include? "c"
			return false if game_type.include? "c"
#			puts "DEBUG: I am at the end of need_partner? and am returning 'true'"
			true
			end


		def player_setup
			@game_type = how_many_players
			player_uno = Player.new(@game_type)
			Game.new_entry(player_uno.user_name,player_uno.role)
			need = need_partner?(@game_type)
#			puts "DEBUG: Now that I've made player uno, I set 'need' to the return value of 'need_partner?', which is #{need}. You shouldn't get any mess about a computer if that says 'true'."
			puts "Okay, now have your partner slide over.\nI have a couple more questions."
			player_dos = Player.new(@game_type) if need
			player_dos ||= Computer.new(GenCons.role_options)
			Game.new_entry(player_dos.user_name,player_dos.role)
			if player_uno.role == GenCons::BreakerTitle
				codebreaker = player_uno
				codemaker = player_dos
				else
				codemaker = player_uno
				codebreaker = player_dos
				end
			@@record[player_uno.user_name.to_sym][:total]+=1
			@@record[player_dos.user_name.to_sym][:total]+=1
			game_play(@code_length,@max_rounds,codebreaker,codemaker)
			end	

		def game_play(code_length, max_rounds, player_one, player_two, *other_players)
			player_one.intro(code_length,max_rounds)
			the_code = player_two.intro(code_length,max_rounds)
#			puts "DEBUG: The code is #{the_code}"
			correct_response = "Just decided code"
			maker_role_in_array = Array.new [GenCons::MakerTitle]
			checker = Computer.new(maker_role_in_array)
			@round_num+=1
			while @round_num < @max_rounds+1
				guess = player_one.take_turn(@round_num, correct_response)
				puts "#{player_one.user_name}, you have guessed #{guess}."
				correct_response = checker.eval_guess(guess,the_code)
				response = player_two.take_turn(@round_num, guess, the_code)
				@round_num+=1
				puts "\e[31mUh-oh! #{player_two.user_name} tried to cheat by giving false feedback! They said \e[37m#{response}\e[31m but the correct feedback would be #{correct_response}\e[0m" if correct_response != response
				game_over(player_one) if response == "2222" || guess == the_code
				break if response == "2222" || guess == the_code
				end
			game_over(player_two) if @round_num == 14
			end

		def game_over(victor)
			@@record[victor.user_name.to_sym][:wins]+=1
			@@record[victor.user_name.to_sym]["wins_as_#{victor.role}".intern]+=1
			puts "\n--------------------\n\e[32mThe game is finished!! That's right, it's all over!\e[0m"
			puts "\e[1;33mOur winner is #{victor.user_name}!!\e[0m"
			puts "Congratulations!"
			puts @@record[victor.user_name.to_sym]
			puts "There are your stats! Good bye!"
			end


		end
	end



#Sources:
#http://ithaca.arpinum.org/2010/07/29/ruby-dynamic-includes.html
		
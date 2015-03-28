module Hangman
	class Game

		attr_reader :the_word, :player, :round, :max_rounds, :error_num
		def initialize(debug_version)
			puts "DEBUG: This is \e[32m#{debug_version}\e[0m!!!"
			puts "Welcome to Hangman! At each turn, you can" 
			puts "type 'save' to save your game and leave."
			time = Time.new
			@player = Player.new
			fold_obj = @player.folder_setup
			resp = load_check(fold_obj)
			if resp
				puts "DEBUG: Resp is #{resp}"
				puts "of class #{resp.class}"
				loaded_vars_h = load_file(resp,fold_obj)
				puts "DEBUG: The variables loaded are in"
				puts "this hash.\n#{loaded_vars_h}"
				game_play(loaded_vars_h)
				return
				end
			@word_obj = Word.new
			the_word = @word_obj.the_word
			intro(the_word)
			save_obj = Save.new(time,fold_obj)
			puts "DEBUG: The word is #{the_word}, of class #{the_word.class}."
			two_hashes = @word_obj.word_setup
			lett_i_hash = two_hashes[0]
			lett_freq_hash = two_hashes[1]
			max_rounds = 8
			rounds_array = make_rounds_parts(max_rounds)
			start_vars_h = {word: the_word,
				word_obj: @word_obj,
				lett_freq_h: lett_freq_hash,
				max_errors: max_rounds,
				player: @player,
				lett_i_hash: lett_i_hash,
				save_obj: save_obj,
				rounds_array: rounds_array}
			game_start(start_vars_h)
			end
#	COULD USE A MERGE OR UPDATE METHOD TO PUT HASH VALUES IN GAME'S HASH.
		def load_check(fold_obj)
			puts "Would you like to load a past, "
			puts "unfinished game?"
			unfin_options = fold_obj.entries.select {|name|
				name[0] =~ /[^wlWL]/}
			puts unfin_options
			puts "Give me the number of the one you want"
			puts "to finish or press Return for a new game."
			resp = gets.chomp.scan(/\d/)[0]
			GenMeans.put_break
			return resp
			end

		
		def load_file(resp,fold_obj)
			unfin_options = fold_obj.entries.select {|name|
				name[0] =~ /[^wlWL]/}
			load_name = unfin_options[resp-1]
			hsh = File.open(load_name,"r") do |f|
				f.readlines #CAN'T DO THIS ISH UNTIL I ACTUALL KNOW HOW THIS ISH IS BEING WRITTEN INTO THE FILE.
				end
			end
			
			

		def intro(the_word)
			puts "Watch out! It's a proper noun!" if the_word[0].ord >= 65 && the_word[0].ord <= 90
#			puts "Would you like to load a past game?"
			end
		
		def game_start(vars_h)
			vars_h[:error_num] = 0
			vars_h[:round] = 0
			vars_h[:hanging] = Array.new(1) {"0/10"}
			vars_h[:guess_record] = []
			the_word = vars_h[:word]
			num_spaces = the_word.length
			spaces = @word_obj.make_spaces(num_spaces)
#			puts spaces
			puts "Are you ready?"
			gets.chomp
			GenMeans.put_break
			game_play(vars_h,spaces)
			end
			

		def game_play(h,spaces)
			max_errors = h[:max_errors]
			while h[:error_num] < max_errors + 1
				h[:round] += 1
				round = h[:round]
				puts "We are on Round #{round} and have that."
				the_word = h[:word]
				num_spaces = the_word.length
				guesses = h[:guess_record]
				puts "You have so far guessed #{guesses.to_s}."
				puts "What would you like to guess now?"
				from_gg = get_guess
				gg_class = from_gg.class
				puts "DEBUG: Result from get_guess method was #{from_gg}, which happens to be of class #{gg_class}."
				case gg_class.to_s
					when "Fixnum"
					puts "Oh, you'd like to save!? Okay!"
					dest = h[:save_obj]
					dest.saver(h)
					puts "DEBUG: I'm in the game_play method.\nI just saved the shit, hopefully.\nNow, let's break."
					break
					when "String"
					puts "DEBUG: Result from get_guess is #{from_gg} of class #{from_gg.class}."
					h[:guess_record] << from_gg
					end
				lett_guess = h[:guess_record][-1]
				puts "DEBUG: Guess is #{lett_guess} of class #{lett_guess.class}."	
				puts "DEBUG: Right before correct_guess?, spaces is #{spaces}."
				letter = correct_guess?(the_word,lett_guess)
				puts "DEBUG: Right after correct_guess?, spaces is #{spaces}."
				if letter
					lett_sym = letter.to_sym
					lett_freq = h[:lett_freq_h][lett_sym]
					lett_place = h[:lett_i_hash][lett_sym]
					puts "You correctly guessed #{lett_guess}."
					puts "This letter appears #{lett_freq} times!"
					puts "The letter goes in the #{lett_place} place(s)."
					spaces =						@word_obj.make_spaces(num_spaces,"update", 
							lett_guess)
					puts "Still gotta watch your progress!"
					h[:hanging].each {|meti| puts "\t#{meti}"}
#					@word_obj.make_spaces(num_spaces, "update",lett_guess)
					else
					h[:error_num] += 1
					error_num_for_show = h[:error_num]
					h[:hanging][-1] = h[:rounds_array][error_num_for_show - 1]
					h[:hanging] << "#{error_num_for_show}/#{max_errors}"
					puts "No! Sorry! That was wrong! That was error #{error_num_for_show}."
					h[:hanging].each {|meti| puts "\t#{meti}"}
					puts spaces
					end
				puts "DEBUG: Now about to run the check_game_over method!"
				is_it_over = check_game_over(h[:error_num],
					h[:round],spaces,the_word,h)
				if is_it_over
					puts "Bye."
					break
					else
					puts "DEBUG: It ain't over yet, son!"
					end
				end
			end

			
		def get_guess
			resp = gets.downcase.chomp
			GenMeans.put_break
			puts "DEBUG: resp is #{resp} of class #{resp.class}."
			want_save = resp.scan(/save/)[0]
			puts "DEBUG: want_save is #{want_save} of class #{want_save.class}"
			if want_save != nil
				return 99
				else
				guess = resp.scan(/[a-z]/)[0]
				puts "DEBUG: On first try, guess is #{guess} of class #{guess.class}"
				end
			
			puts "You are guessing \e[34m#{guess}\e[0m. If you want to change it, now is your last chance.\nJust hit the Return key to continue with the blue guess.\nMake your decision."
			guess_new_resp = gets.strip.downcase.scan(/[a-z]{0,2}/)
			GenMeans.put_break
			guess_new = guess_new_resp[0]
			puts "DEBUG: Your new guess is #{guess_new}."
			if guess_new_resp != [""] && guess_new != "no"
				puts "DEBUG: Because guess_new is not nil nor 'no' and is instead #{guess_new_resp} of class #{guess_new_resp.class}, we are changing the value of guess. Guess will become #{guess_new} of class #{guess_new.class}."
				guess = guess_new
				end
			puts "Great! So you guessed \e[36m#{guess}\e[0m which is of class #{guess.class}."
			return guess
			end
		
		def correct_guess?(word,lett)
			puts "DEBUG: Yo. The word is #{word} of class #{word.class} and the letter is #{lett} of class #{lett.class}."
			word.downcase!
			if word.include? lett
				return lett
				else
				return false
				end
			end
		
		def check_game_over(e_num, round, spaces, the_word, the_hash)
			puts "DEBUG: I'm in the check_game_over method. At the beginning, spaces is #{spaces}."
			adj_spaces = spaces.gsub(/\s/,'')
			if e_num == max_rounds
				puts "Sorry, you are dead. You made it to round #{round}, but now you have lost. Saving game and finishing now."
				game_over(GenCons::LostOutcome,the_hash)
				return true
				elsif adj_spaces == the_word.downcase
				puts "You got it! You guessed a #{the_word.length}-letter word in only #{round} rounds! You won! Game over! Saving and finishing."
				game_over(GenCons::WinOutcome,the_hash)
				puts "DEBUG: At the end, spaces is #{spaces}."
				return true
				else
				puts "DEBUG: At the end, spaces is #{spaces}."
				return false
				end
			end

		def make_rounds_parts(max)
			body_parts = 6
			galley_parts = 3
			rounds_array = ["head", "rope", "torso", "beam", "base", 
				"right_arm", "left_arm","right_leg", "left_leg"]
			puts "Whoa, I can't handle this game's setting for max errors!" if max > rounds_array.length
			the_rounds_array = rounds_array.slice(0,max-1)
			end
		
		def game_over(outcome,final_hash)
			puts "DEBUG: THE GAME_OVER FUNCTION IS BEING RUN."
			dest = final_hash[:save_obj]
			puts "DEBUG: We just set the destination to #{dest} which should be an object."
			dest.finish(outcome,final_hash)
			end
			
		end
	end
		
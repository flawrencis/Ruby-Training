module Hangman
	class Game

		attr_reader :the_word, :player, :round, :max_rounds, :error_num
		def initialize
			puts "Welcome to Hangman! At each turn, you can "/
				"type 'save' to save your game and leave."
			time = Time.new
			@player = Player.new
			fold_obj = @player.folder_setup
			resp = load_check(fold_obj)
			if resp
				puts "DEBUG: Resp is #{resp} "/
					"of class #{resp.class}"
				loaded_vars_h = load_file(resp,fold_obj)
				puts "DEBUG: The variables loaded are in "/
					"this hash.\n#{loaded_vars_h}"
				game_play(loaded_vars_h)
				return
				end
			the_word = Word.new
			intro(the_word)
			save_obj = Save.new(time,fold_obj)
			puts "DEBUG: The word is #{the_word}, of class #{the_word.class}."
			[a,b] = the_word.word_setup
			lett_i_hash = a
			lett_freq_hash = b
			max_rounds = 8
			rounds_array = make_rounds_pars(max_rounds)
			start_vars_h = {word: the_word,
				lett_freq_h: lett_freq_hash,
				max_errors: max_rounds,
				player: @player,
				lett_i_hash: lett_i_hash,
				save_obj: save_obj,
				rounds_array: rounds_array}
			game_start(start_vars_h)
			end
		
		def load_check(fold_obj)
			puts "Would you like to load a past, "/
				"unfinished game?"
			unfin_options = fold_obj.entries.select {|name|
				name[0] =~ /[^wlWL]/}
			puts unfin_options
			puts "Give me the number of the one you want"/
				" to finish or press Return for a new game."
			resp = gets.chomp.scan(/\d/)[0]
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
			puts "Watch out! It's a proper noun!" if the_word[0].ord >= 65 || the_word[0].ord <= 90
#			puts "Would you like to load a past game?"
			end
		
		def game_start(vars_h)
			vars_h[:error_num] = 0
			vars_h[:round] = 0
			vars_h[:hanging] = Array.new(1) {"0/10"}
			vars_h[:guess_record] = []
			the_word = vars_h[:word]
			num_spaces = the_word.length
			the_word.make_spaces(num_spaces)
			puts "Are you ready?"
			gets.chomp
			game_play(vars_h)
			end
			

		def game_play(h)
			max_errors = h[:max_errors]
			while h[:error_num] < max_errors + 1
				h[:round] += 1
				round = h[:round]
				puts "We are on Round #{round} and have:"
				the_word = h[:word]
				num_spaces = the_word.length
				the_word.make_spaces(num_spaces,"update")
				puts "What would you like to guess now?"
				from_gg = get_guess
				case from_gg.class
					when Fixnum
					dest = h[:save_obj]
					dest.saver(h)
				puts lett_guess = vars_h[:guess_record][-1]
				if correct_guess?(the_word,lett_guess)
					letter = correct_guess
					lett_sym = letter.to_sym
					lett_freq = h[:lett_freq_h][lett_sym]
					puts "You correctly guessed #{lett_guess}."/
						"This letter appears #{lett_freq} times!"
					spaces = /
						the_word.make_spaces(num_spaces,"update", 
							lett_guess)
					puts "Still gotta watch your progress!"
					puts h[:hanging]
					elsif 
					else
					h[:error_num] += 1
					error_num = h[:error_num]
					h[:hanging][-1] = h[:rounds_array]/
						[error_num - 1]
					hanging << "#{error_num}/#{max_errors}"
					puts h[:hanging]
					end
				end
			end

		def get_guess
			resp = gets.downcase.chomp
			want_save = resp.scan(/save/)
			if want_save != nil
				return 99
				else
				guess = resp.scan(/[a-z]/)
				end
			
			puts "You are guessing \e[34m#{guess}\e[0m. If you want to change it, now is your last chance.\nJust hit the Return key to continue with the blue guess.\nMake your decision."
			guess_new = gets.downcase.scan(/[a-z]/)
			if guess_new != nil || guess_new[0,1].join != "no"
				guess = guess_new[0]
				end
			puts "Great! So you guessed \e[36m#{guess}\e[0m!"
			@guess_record << guess

			return @guess_record
			end



		def correct_guess?(word,lett)
			if word.include? lett
				return lett
				else
				return false
				end
			end





		def make_rounds_parts(max)
			body_parts = 6
			galley_parts = 3
			rounds_array = ["head", "rope", "torso", "beam", "base", 
				"right_arm", "left_arm","right_leg", "left_leg"]
			puts "Whoa, I can't handle this game's setting for max"/
				"errors!" if max < rounds_array.length
			the_rounds_array = rounds_array.slice(0,max-1)
			end
		
		def game_over(file,outcome)
			save_obj.finish(file,outcome)
			
		end
	end
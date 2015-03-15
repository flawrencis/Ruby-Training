module Mastermind
	
	
	module Ccodebreaker
		
		def intro(*args)
			puts "\t\t\t\tI'm skipping the intro because I know what I'm doing."
			end
		
		def take_turn(round,feedback)
#			puts "DEBUG: Right now, guess_grid is #{@guess_grid}. Let's change that by going to the #{round-2}th element of guess_grid and replacing the 2nd element of that with the actual feedback, which is #{feedback}." if defined? @guess_grid
			@guess_grid[round-2][2] = feedback if defined? @guess_grid
#			puts "DEBUG: Great, so I should have just changed the 'xxxx' to #{feedback}!" if defined? @guess_grid
#			puts "DEBUG: Apparently guess_grid is not defined!" unless defined? @guess_grid
			@guess_grid ||= Array.new
			your_turn = "Okay, the computer is taking its turn..."
			puts your_turn
			puts "Your opponent said \e[33m#{feedback}\e[0m."
			print_record(@guess_grid)
			guess_array = random_turn
			guess = guess_array.join
			guesses_only = gue_only_grid
			puts "DEBUG: We have to compare our guess to the guesses_only, which is #{guesses_only}\n...which is of class #{guesses_only.class}"
			while guesses_only.include? guess
				guess_array = random_turn
				joined_guess = guess_array.join
				end
			@guess_grid << [round,guess,"xxxx"]
			puts "DEBUG: The decided guess is #{guess} which is of class #{guess.class}."
			return guess
			end
		
		def print_record(record)
#			puts "DEBUG: Just entered print_record function."
			record.each {|k,v,y| puts "Round #{k} | #{v} : #{y}"}
			puts "...oh well this is the first round" if record == []
			end
		
		def gue_only_grid
			guesses_only = Array.new
			@guess_grid.each do |subarray|
				guesses_only << subarray[1]
				end
			guesses_only
			end
		
					
					
					
		
		
		def random_turn
			options = GenCons::Options
			chr_array = GenMeans.arr_rand_ord_to_chr
#			puts "DEBUG: Right now, after pulling from #arr_rand_ord_to_chr, chr_array is #{chr_array}.\nNow, let's join it!"
#			chr_array.join!
			genconsoptionskeys = GenCons::Options.keys.map {|symbo| symbo.to_s} 
			colored_guess = GenMeans.translate_array(chr_array, genconsoptionskeys, GenCons::Options.values)
#			colored_guess = GenMeans.colorize_array (dull_array)
			puts "DEBUG: random_turn is returning #{colored_guess}! as the colored_guess!"
			return colored_guess
			end
		end
		

	
	module Ccodemaker
		
		def intro(length,rounds)
			@the_code = aut_cod
			return @the_code
			end
		
		def aut_cod
			options = GenCons::Options
			chr_array = GenMeans.arr_rand_ord_to_chr
			code = Array.new(GenCons::CodeLength)
			i = 0
			while i < GenCons::CodeLength
				code[i] = options[chr_array[i].to_sym]
				i+=1
				end
			puts "DEBUG: From aut_cod, code is #{code}."
			the_code = code.join
			puts "DEBUG: From aut_cod, the_code is #{the_code}."
			return the_code
			end

		
		def take_turn(round,feedback)
			puts "It is now the computer's turn."
			response = eval_guess(feedback)
			return response
			end
		
		def eval_guess(feedback)
			guess = feedback
			guess_array = guess.split("")
			code_array = @the_code.split("")
			resp_array = Array.new
			i = 0
			while i<4
				if guess_array[i] == code_array[i]
					guess_array.delete_at(i)
					code_array.delete_at(i)
					end
				i+=1
				end
			k = 0
			long = guess_array.length
			while k < long
				if code_array.include? guess_array[k]
					resp_array<<1
					end
				end
			return resp_array
			
			end
		end
	
	
	
	
	
	end
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
#			puts "DEBUG: We have to compare our guess to the guesses_only, which is #{guesses_only}\n...which is of class #{guesses_only.class}"
			while guesses_only.include? guess
				guess_array = random_turn
				guess = guess_array.join(" ")
				end
			@guess_grid << [round,guess,"xxxx"]
#			puts "DEBUG: The decided guess is #{guess} which is of class #{guess.class}."
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
			genconsoptionskeys = GenCons::Options.keys.map {|symbo| symbo.to_s} 
			colored_guess = GenMeans.translate_array(chr_array, genconsoptionskeys, GenCons::Options.values)
#			puts "DEBUG: random_turn is returning #{colored_guess}! as the colored_guess!"
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
#			puts "DEBUG: From aut_cod, code is #{code}."
			the_code = code.join(" ")
#			puts "DEBUG: From aut_cod, the_code is #{the_code}."
			return the_code
			end

		
		def take_turn(round,feedback,code)
			puts "It is now the computer's turn."
			response = eval_guess(feedback,code)
			return response
			end
		
		def eval_guess(feedback,code)
			guess = feedback
			guess_array = guess.split(" ")
			puts "I am now evaluating your guess, #{guess_array}."
			code_array = code.split(" ")
#			puts "DEBUG: To do this, I am comparing it to #{code_array}."
			resp_array = Array.new
			i = 0
			long = guess_array.length
#			puts "DEBUG: guess_array has #{long} elements!"
			while i < long
#				puts "DEBUG: I am in the #{i}th iteration of the i-while loop."
				if guess_array[i] == code_array[i]
					a = guess_array[i]
					b = code_array[i]
					guess_array[i] = "deleted guess element"
					code_array[i] = "deleted code element"
					resp_array << 2
#					puts "DEBUG: Element #{i} of the guess_array (#{a}) = the same element of the code_array (#{b}), so I am adding a 2 to resp_array.\nNow, resp_array is #{resp_array}!"
#					puts "DEBUG: The guess_array is now #{guess_array} and the code_array is now #{code_array}."
					end
				i+=1
				end
			k = 0
			while k < long
#				puts "DEBUG: I am in the #{i}th iteration of the k-while loop."
				
				if code_array.include? guess_array[k]
					g = guess_array[k]
#					puts "DEBUG: Oh, look! code_array has #{g} so let's add a 1 to resp_array!" 
					resp_array<<1
#					puts "DEBUG: Now, resp_array is #{resp_array}."
					end
				
				k += 1
				end
			
			
			until resp_array.length == GenCons::CodeLength do
				resp_array << 0
				
				end
			response = resp_array.join
		
			return response
			
			end
		end
	
	
	
	
	
	end
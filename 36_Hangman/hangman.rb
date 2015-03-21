module Hangman

class Save
	def initialize(time)
		yr = time.year.to_s.slice(2,3)
		mo = time.month.to_s
		da = time.date.to_s
		prefix = "#{yr}#{mo}#{da}_"
		
		puts "What would you like to call the file to which "/
			"these data are saved?"
		file_name = gets.chomp.scan(/([^\.]*)\./)[0][0]
		file_name.gsub!(/\s/,"_")
		file_name << ".txt"
		
		expand_path
		
		while File.exist?(file_name)
			puts "I need a different name. That already exists."
			file_name = gets.chomp.scan(/([^\.]*)\./)[0][0]
			file_name.gsub!(/\s/,"_")
			file_name << ".txt"
			end
		
		file_name.prepend(prefix)
		@record_file = File.new(file_name,"a")
		@record_file.close
		end

	
	def saver(file,details)
		File.open(file,"a") do |f|
			file.write details
			end
		end
	
	end

	
		
		
class Game
	
	attr_reader :the_word, :player, :round, :max_rounds, :error_num
	def initialize
		puts "Welcome to Hangman!"
		time = Time.new
		@the_word = Word.new
		save_obj = Save.new(time) #RESUME HERE.
		
		
		
		puts "DEBUG: The word is #{@the_word}, of class #{@the_word.class}."
		[a,b] = @the_word.word_setup
		@lett_i_hash = a
		lett_freq_hash = b
		@max_rounds = 8 
		@player = Player.new
		gameplay(@the_word,lett_freq_hash,@max_rounds,@player)
		end
	
	
	def intro
		puts "Watch out! It's a proper noun!" if @the_word[0].ord >= 65 || @the_word[0].ord <= 90
		end
	
	def game_play(the_word,lett_freq_hash,max_errors,player)
		round = 0
		hanging = Array.new(1) {"0/10"}
		error_num = 0
		num_spaces = the_word.length
		the_word.make_spaces(num_spaces)
		puts "Are you ready?"
		gets.chomp
		while error_num < @max_errors + 1
			round += 1
			puts "We have:"
			the_word.make_spaces(num_spaces,"update")
			puts "What would you like to guess now?"
			puts lett_guess = get_guess
			if correct_guess?(the_word,guess)
				letter = correct_guess
				lett_known << correct_guess
				lett_sym = letter.to_sym
				lett_freq = lett_freq_hash[lett_sym]
				puts "You correctly guessed #{guess}. This letter appears #{lett_freq} times!"
				spaces = /
					the_word.make_spaces(num_spaces,"update", 
						guess)
				puts "Still gotta watch your progress!"
				puts hanging
				puts "Okay, now on round #{round}, we now have:"
				puts spaces
				else
				error_num += 1
				hanging[-1] = rounds_array[error_num - 1]
				hanging << "#{error_num}/#{@max_errors}"
				puts hanging
				end
			@error_num = error_num
			end
		end

	
	
	def get_guess
		guess = gets.downcase.chomp.scan(/[a-z]/)[0]
		puts "You are guessing \e[34m#{guess}\e[0m. If you want to change it, now is your last chance.\nJust hit the Return key to continue with the blue guess.\nMake your decision."
		guess_new = gets.downcase.scan(/[a-z]/)
		if guess_new != nil || guess_new[0,1].join != "no"
			guess = guess_new[0]
			end
		puts "Great! So you guessed \e[36m#{guess}\e[0m!"
		
		return guess
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
	end

	








class Word
	def initialize 
		puts "Choosing a word between 5 and 12 characters."
		dictionary = File.open "dict.txt"
		lines = dictionary.readlines
		usable_words = lines.select {|line| line.length > 4 && line.length < 13 }
		usa_num = usable_words.length - 1
		choice = rand(0..usa_num)
		@the_word = usable_words[choice].chomp
		puts "DEBUG: The word is #{@the_word}, which is of clas"/
			"s #{@the_word.class}."
		end

	
	def word_setup #could use uniq in this part
		word_array_1 = @the_word.downcase.split
		word_length = @the_word.length
		lett_freq_hash = Hash.new
		@lett_i_hash = Hash.new([])
		word_array_1.each_with_index do |letter,i|
			lett_sym = letter.to_sym
			lett_freq_hash[lett_sym] ||= 0
			lett_freq_hash[lett_sym] += 1
			@lett_i_hash[lett_sym] << i
			end
		return @lett_i_hash, lett_freq_hash
		end

	
	
	def make_spaces(length,goal="new",new_lett = nil)
		if goal == "new"
			@spaces = String.new
			for i in 1..length
				@spaces << " _"
				end
			elsif goal == "update"
			lett_sym = new_lett.to_sym
			puts this_lett_i_array = @lett_hash[lett_sym]
			this_lett_i_array.each do |i|
				@spaces[i] = new_lett
				end
			end
		return @spaces
		
		end

	
			
	end
	

	
class Player
	def initialize
		name_array = get_name
		@user_name = name_array[0]
		end
	
	
	def get_name
		puts "What's your name? Example: John Butt"
		name = gets.chomp
		GenMeans.put_break
		real_name = name.split.map {|i| i.capitalize}.join(" ")
		new_name = real_name.strip.downcase.scan(/\w*/)
		user_name= new_name[2][(0..3)] + new_name[0][(0..3)]
		puts "Thanks, #{real_name}. Your user_name is #{user_name}."
		[user_name,real_name]
		end
	
	end
	
	end
	
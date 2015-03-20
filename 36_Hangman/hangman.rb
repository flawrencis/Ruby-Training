class Game
	
	attr_reader :the_word, :player, :round, :max_rounds
	def initialize
		puts "Welcome to Hangman!"
		@the_word = Word.new
		@lett_i_hash = @the_word.word_setup
		@player = Player.new
		@max_rounds = 8 
		end
	
	def intro
		puts "Watch out! It's a proper noun!" if @the_word[0].ord >= 65 || @the_word[0].ord <= 90
		end
	
	def game_play
		@round = 0
		show_spaces(@round,@the_word.length)
		while @round < @max_rounds
			puts "We have:"
			show_spaces(@round,@the_word.length - @round)
			puts "What would you like to guess now?"
			lett_guess = get_guess
			#this if clause and some other stuff below is no bueno. Need to properly set up the word.
			if correct_guess? #need to define this method
				lett_known << correct_guess
				letter = correct_guess
				lett_sym = letter.to_sym
				lett_freq = @lett_freq_hash[lett_sym]
				puts "You correctly guessed #{letter}. This letter appears #{lett_freq} times!"
				else
				hanging << rounds_array[error_num]
				puts hanging
				end
			end
		end
	
	def correct_guess?
		if #blah
			return #value
			elsif #blah
			return false
			end
		end
	
	
	def show_spaces(round,length,spaces)
		spaces = String.new
		#PUT THE INITIAL DEFINITION OF SPACES ELSEWHERE. ONE TIME. THEN, IN THE SHOW_SPACES, USE THE FOLLOWING CODE
		=begin
			lett_hsh = Hash with the letters as symbols followed by an array that gives their positions in the word
			You set i_array = lett_hash[lett_sym]
			You go i_array.each do |i|
				spaces[i] = letter
				end
			done
		=end
		
		for i in 1..length
			spaces << " _"
			end
		lett_i_hash
		i_of_known = 
		spaces[i_of_known] = lett_known
		return spaces
		end

	
	def make_rounds_parts
		body_parts = 6
		galley_parts = 3
		rounds_array = ["head", "rope", "torso", "beam", "base", 
			"right_arm", "left_arm","right_leg", "left_leg"]
		the_rounds_array = rounds_array.slice(0,max_rounds-1)
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
		the_word = usable_words[choice].chomp
		puts "DEBUG: The word is #{the_word}, which is of class #{the_word.class}."
		end
	
	def word_setup #could use uniq in this part
		word_array_1 = @the_word.downcase.split
		word_length = @the_word.length
		@lett_freq_hash = Hash.new
		lett_i_hash = Hash.new([]) #the index values of each letter in the word array
		word_array_1.each_with_index do |letter,i|
			lett_sym = letter.to_sym
			@lett_freq_hash[lett_sym] ||= 0
			@lett_freq_hash[lett_sym] += 1
			lett_i_hash[lett_sym] << i
			end
		@guess_hash = Hash.new
		return lett_i_hash
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
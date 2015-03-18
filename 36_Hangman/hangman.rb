class Game
	
	attr_reader :the_word, :player, :round, :max_rounds
	def initialize
		puts "Welcome to Hangman!"
		@the_word = Word.new
		@player = Player.new
		@max_rounds = 8 
		end
	
	def intro
		puts "Watch out! It's a proper noun!" if @the_word[0].ord => 65 || @the_word[0].ord =< 90
		end
	
	def game_play
		@round = 0
		show_spaces(@round,@the_word.length)
		while @round < @max_rounds
			
			show_spaces(@round,@the_word.length - @round)
			end
		end
	
	def show_spaces(round,length)
		spaces = String.new
		for i = 1..length
			spaces << " _"
			end
		puts spaces
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
class Game
	def initialize
		puts "Welcome to Hangman!"
		the_word = Word.new
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
		user_name = name_array[0]
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
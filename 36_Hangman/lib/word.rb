module Hangman
	class Word
		attr_accessor :the_word, :lett_i_hash, :spaces
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
				puts this_lett_i_array = @lett_i_hash[lett_sym]
				this_lett_i_array.each do |i|
					@spaces[i] = new_lett
					end
				end
			return @spaces

			end


		end
	end
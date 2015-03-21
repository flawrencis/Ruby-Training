module Hangman
	class Word
		attr_accessor :the_word, :lett_i_hash, :spaces
		def initialize 
			puts "Choosing a word between 5 and 12 characters."
			dictionary = File.open "./lib/dict.txt"
			lines = dictionary.readlines
			dictionary.close
			usable_words = lines.select {|line| line.length > 4 && line.length < 13 }
			usa_num = usable_words.length - 1
			choice = rand(0..usa_num)
			@the_word = usable_words[choice].chomp
			puts "DEBUG: The word is #{@the_word}, which is of class #{@the_word.class}."
			end

		def word_setup #could use uniq in this part
			word_array_1 = @the_word.downcase.split
			word_length = @the_word.length
			lett_freq_hash = Hash.new
			@lett_i_hash = Hash.new([])
			puts "DEBUG: word_array_1 is #{word_array_1}!"
			word_array_1.each_with_index do |letter,i|
				puts "DEBUG: Letter of word_array_1 is #{letter}."
				puts "DEBUG: Index of that letter is #{i}."
				lett_sym = letter.to_sym
				puts "DEBUG: lett_sym is #{lett_sym}."
				lett_freq_hash[lett_sym] ||= 0
				lett_freq_hash[lett_sym] += 1
				puts "DEBUG: I've just added 1 to the value under the lett_sym (#{lett_sym}) key in lett_freq_hash, which is now #{lett_freq_hash}."
				@lett_i_hash[lett_sym] << i
				puts "DEBUG: I've just added that index value (#{i}) to the lett_sym (#{lett_sym}) key in lett_i_hash, which is now #{@lett_i_hash}."
				end
			puts "DEBUG: Lett_i_hash = #{@lett_i_hash}!!"
			puts "DEBUG: Lett_freq_hash is #{lett_freq_hash}!!"
			return [@lett_i_hash,lett_freq_hash]
			end

		def make_spaces(length,goal="new",new_lett = nil)
			if goal == "new"
				@spaces = String.new
				for i in 1..length
					@spaces << " _"
					end
				puts @spaces
				elsif goal == "update"
				lett_sym = new_lett.to_sym
				this_lett_i_array = @lett_i_hash[lett_sym]
				this_lett_i_array.each do |i|
					@spaces[2*i] = new_lett
					
					end
				puts @spaces
				end
			return @spaces

			end


		end
	end
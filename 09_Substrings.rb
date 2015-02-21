def substrings(final_words,final_dictionary)
    word_count=Hash.new{0}
    final_words=final_words.split(' ')
    puts "The dictionary we'll be using is:\n#{final_dictionary}\nand the words we'll be using are...\n#{final_words}\n"
    final_words.each do |each_final_sentence_word|
        does_it_include= final_dictionary.include? each_final_sentence_word
        if does_it_include == true
            word_count[each_final_sentence_word]+=1
			the_count=word_count[each_final_sentence_word]
            puts "Match! #{each_final_sentence_word}. Now we have #{the_count}."
			#It had something to do with calling a hash variable in the string.
            end
        end
	puts word_count
    end

puts "Give me a sentence. We need it to be at least 10 words. No punctuation inside."
user_words = gets.chomp
sample_dictionary="it, the, i, you, is, am, are, to, with, on, a, too, so, because, very, will, not, think, be, want, like, and, go"
puts "\n-------------\nThank you.\nNow, I need a 20-word dictionary from you with each word separated by a comma \nand then space (, ). Or, if you like, you can use this dictionary I've \nprovided. If you'd like to use this dictionary, just type 'Y'.\n\nThe dictionary I'm offering is...\n#{sample_dictionary}\n\nOkay, what do you say?"
user_dictionary=gets.chomp

if user_dictionary=="y" || user_dictionary=="Y"
    user_dictionary=sample_dictionary
    end


final_dictionary= /\S+(,\s\S*){20}[^,\s]/.match(user_dictionary)
puts "\nThe final_dictionary is now '#{final_dictionary}'.\n"
final_dictionary= final_dictionary[0]
final_dictionary.downcase!
final_dictionary.split!(', ')

puts "\nRight now, user_words is...\n'#{user_words}'\nBut now, let's cut that down to 10 words, if it isn't already."
puts user_words.class.name
final_words= /\S*(\s\S*){10}[^.]/.match(user_words)
#final_words= /\S+(\s\S*^\.){10}/.match(user_words)
puts final_words
final_words= final_words[0]
puts "\nThe sentence we will be using, from what you provided, is '#{final_words}'.\n"

final_words.downcase!

substrings(final_words,final_dictionary)
#http://ruby-doc.org//core-1.9.3/MatchData.html
#http://ruby-doc.org//core-2.2.0/Regexp.html
#http://regexone.com/lesson/9
#http://stackoverflow.com/questions/1986386/check-if-value-exists-in-array-in-ruby
#http://stackoverflow.com/questions/6756558/regex-to-match-comma-followed-by-whitespace
#http://stackoverflow.com/questions/554666/ruby-merging-variables-in-to-a-string
#http://stackoverflow.com/questions/16159370/ruby-hash-default-value-behavior
#http://stackoverflow.com/questions/826210/how-do-i-get-the-name-of-a-ruby-class

#Use this text: I very much hate this part because I think it is so stupid.
#Actually, use this text: I do not know what to say because you have not given me enough instructions for the task.
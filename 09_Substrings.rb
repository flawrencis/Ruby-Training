def substrings(user_words,user_dictionary)
    word_count=Hash.new{0}
    user_words=user_words.split(' ')
    puts "The dictionary we'll be using is:\n#{user_dictionary}\n and the words we'll be using are...\n#{user_words}\n"
    user_words.each do |each_user_word|
        does_it_include= user_dictionary.include? each_user_word
        if does_it_include == true
            puts "We have a match! It is #{each_user_word}. Now, let's try adding! Currently, the count is #{word_count[each_user_word]}."
            word_count[each_user_word]+=1
            end
        end
    end

puts "Say some stuff. We need 10 words."
user_words = gets.chomp
sample_dictionary="it, the, i, you, is, am, are, to, with, on, a, too, so, because, very, will, not, think, be, want, like, and, go"
puts "I need a 20-word dictionary from you with each word separated by a comma and then space (, ). Or, if you like, you can use this dictionary I've provided. If you'd like to use this dictionary, just type 'Y'.\nThe dictionary I'm offering is...\n#{sample_dictionary}\nOkay, what do you say?"
user_dictionary=gets.chomp

if user_dictionary=="y" || user_dictionary=="Y"
    user_dictionary=sample_dictionary
    end
user_dictionary= user_dictionary.split(", ")
#user_dictionary= /\S*(,\s\S*){10,20}/.match(user_dictionary) #min,max repetitions doesn't seem to work. Only does 10 of the 17 words. .....Oh, the asterisk's placement is the problem! ..Actually, don't use an asterisk! So redundant! ....Wait, nope because I need to say "lots of non-space characters."
#user_dictionary= /(\S*(,\s\S){10,20})/.match(user_dictionary)
final_dictionary= /\S+(,\s\S*){20}[^,]/.match(user_dictionary)
puts "\nThe user_dictionary is now '#{final_dictionary}'.\n"

user_dictionary=user_dictionary[0]
user_dictionary.downcase!
user_dictionary=Array.new(user_dictionary.split(', '))


#user_words= /\S+(\.?\s\S*^\.){0,15}/.match(user_words) #min,max repetitions doesn't seem to work. Only does first word and 0 of other thing. .....Oh, the asterisk's placement is the problem! ..Actually, don't use an asterisk! So redundant!
user_words= /\S+(\.?\s\S^\.){10}/.match(user_words)
user_words=user_words[0]
user_words.downcase!

substrings(user_words,user_dictionary)
#http://ruby-doc.org//core-1.9.3/MatchData.html
#http://ruby-doc.org//core-2.2.0/Regexp.html
#http://regexone.com/lesson/9
#http://stackoverflow.com/questions/1986386/check-if-value-exists-in-array-in-ruby
#http://stackoverflow.com/questions/6756558/regex-to-match-comma-followed-by-whitespace
#http://stackoverflow.com/questions/554666/ruby-merging-variables-in-to-a-string
#http://stackoverflow.com/questions/16159370/ruby-hash-default-value-behavior

#Use this text: I very much hate this part because I think it is so stupid.
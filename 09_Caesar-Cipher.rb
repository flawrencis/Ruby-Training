def caesar_cipher
    puts "Give me a sentence."
    sentence=gets.chomp
    puts "Give me a number 0-10."
    shift=gets.chomp
    sen_array=sentence.split(//)
    letter_hash=Hash.new
    #letter_hash["#{a..z}"]=>
    sen_array.each{|letter|}
    new_letter_array.each
    final_output=new_letter_array.to_s
end

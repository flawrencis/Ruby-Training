lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

text_without_spaces = text.gsub(/\s+/,'')
total_characters_without_spaces = text_without_spaces.length
sentence_array = text.split(/\.|\?|\!/)

#puts lines[0]
#puts lines[-1]

#line_count = 0
#text = ''
#File.open("text.txt").each do |line|
#	line_count += 1
#	text << line
#	end

puts "The total number of lines is #{line_count}."
puts "Without spaces, there are #{total_characters_without_spaces}."
puts "The total number of sentences is #{sentence_array.length}."
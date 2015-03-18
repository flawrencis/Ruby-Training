require 'csv'
puts "EventManager Initialized!"

#evat = File.read('event_attendees.csv')
##puts evat
#
#evatlines = File.readlines('event_attendees.csv')
#=begin
#splitlines = Array.new
#evatlines.each do |oneline|
#	splitlines << oneline.split(",")
#	end
#puts splitlines[1]
#=end
#
#evatlines.each_with_index do |oneline,i|
#	next if i == 0
#	columns = oneline.split(",")
#	puts columns
#	name = columns[2]
#	puts name
#	end

contents = CSV.open "event_attendees.csv", headers: true
contents.each do |row|
  name = row[2]
  puts name
end
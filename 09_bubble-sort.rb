def bubble_sort(array)
	endpoint= array.length - 1
	puts "The endpoint is #{endpoint}.\n"
	puts "This time, I am using ||."
	checker = 0
	begin
#		puts "We're not there yet! The checker value is only #{checker}.\n"
		array.each_with_index do |element,num|
			
			comparison= element <=> array[num+1]
			case comparison
				
				when -1 || 0
				checker+=1
#				puts "The checker value after evaluating the #{num+1}th pair is: #{checker}.\n"
				next
				when 1
				array[num]=array[num+1]
				array[num+1]=element
				end
#			puts "The checker value after evaluating the #{num+1}th pair is: #{checker}.\n"
			end
#		puts "The checker value after evaluating the whole array this time is: #{checker}.\n"
		if checker < endpoint
			puts "Let's try again. So far, we've got #{checker} good pairs."
			checker=0
			redo
			else 
			break
			end
		end until checker==endpoint
	puts "Your array is now...\n#{array}."
	end
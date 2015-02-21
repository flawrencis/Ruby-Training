def bubble_sort(array)
	endpoint= array.length - 1
	checker = 0
	while i
		puts "We're not there yet! The checker value is only #{checker}.\n"
		array.each_with_index do |element,num|
			comparison= element <=> array[num+1]
			case comparison
				when -1 || 0
				checker+=1
				next
				when 1
				array[num]=array[num+1]
				array[num+1]=element
				end
			puts "The checker value after evaluating this pair is: #{checker}.\n"
			end
		puts "The checker value after evaluating the whole array this time is: #{checker}.\n"
		if checker < endpoint
			redo
			else 
			break
			end
		end
	#Had to abandon "while" modifier at end of begin block. Replaced "begin" with "while" conditional.
	end
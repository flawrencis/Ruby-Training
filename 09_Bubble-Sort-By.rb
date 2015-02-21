def bubble_sort_by(array)
	endpoint= array.length - 1
	puts "The endpoint is: #{endpoint}"
	begin
		checker=0
		puts "Okay, we are cycling through again!"
		array.each_with_index do |element,num|
#			puts "The length of the current element in the array is #{array[num].length}."
			inputy_1= array[num]
			puts "inputy_1 is #{inputy_1}"
			unless num==array.length-1
				inputy_2= array[num+1]
				puts "inputy_2 is #{inputy_2}"
				block_result = yield(inputy_1,inputy_2)
				puts block_result.to_s + " is the difference between the two elements just evaluated!"
				if block_result <= 0
					checker+=1
					puts "The value for checker is now #{checker}."
					else
					array[num]=array[num+1]
					array[num+1]=element
					puts "The array is now #{array}!\n"
					end
				end
			end
		end until checker==endpoint
	puts "Your array is now...\n#{array}."
	end
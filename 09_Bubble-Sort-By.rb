def bubble_sort_by(array)
	endpoint= array.length - 1
	puts "The endpoint is: #{endpoint}"
	begin
		checker=0
		array.each_with_index do |element,num|
#			puts "The length of the current element in the array is #{array[num].length}."
			block_result= yield(num_array[num],num_array[num+1])
			case block_result
				
				when -1 || 0
				checker+=1
				next
				when 1
				array[num]=array[num+1]
				array[num+1]=element
				end
			end
		end until checker==endpoint
	puts "Your array is now...\n#{array}."
	end
def bubble_sort_by(array)
	endpoint= array.length - 1
	begin
		checker=0
		array.each_with_index do |element,num|
			
			block_result= yield(array[num],array[num+1])
			case comparison
				
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
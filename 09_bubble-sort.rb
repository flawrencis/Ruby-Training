def bubble_sort(array)
	endpoint= array.length - 1
	begin
		checker=0
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
			end
		end #until checker==endpoint
#function is not doing anything. irb takes me to blank line. And hitting enter above brings me to this indentation level (0)
	end
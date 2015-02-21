def bubble_sort(array)
	endpoint= array.length - 1
	begin
		checker=0
		array.each_with_index do |element,num|
			unless num==endpoint
				comparison= element <=> array[num+1]
				case comparison

					when -1 || 0
					checker+=1
					when 1
					array[num]=array[num+1]
					array[num+1]=element
					end
				end
			end
		end until checker==endpoint
	puts "Your array is now...\n#{array}."
	end
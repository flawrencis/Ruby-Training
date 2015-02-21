module Enumerable
	def my_each
		array=self
		for i in (1..array.length)
			yield(array[i-1],i-1)
			end
		end
	end

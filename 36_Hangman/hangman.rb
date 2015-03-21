module Hangman
	
	module GenCons
		FinishPhrase = "FINISHED..!..BAMWAMKALMAZAM..!..FINISHED"
		end
	module GenMeans
		def self.put_break
			puts "\e[1,33m----------------------------------------------------------------------------------\e[0m"
			end
		end

	this_path = File.expand_path(File.dirname(__FILE__))
	Dir[this_path + "/lib/*.rb"].each do |file|
		require file
		end
	end




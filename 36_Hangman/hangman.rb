module Hangman
	
	module GenCons
		FinishPhrase = "FINISHED..!..BAMWAMKALMAZAM..!..FINISHED"
	end

File.expand_path(File.dirname(__FILE__))
Dir[this_path + "/lib/*"].each do |file|
	require file
	end

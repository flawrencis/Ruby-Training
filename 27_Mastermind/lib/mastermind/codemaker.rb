module Mastermind
	class Codemaker
		#gets sent the username of codemaker
		attr_reader :user_name,
		def initialize(user_name,real_name)
			user_name = user_name
			real_name = real_name
			@two_names = [user_name, real_name]
			intro_maker(two_names)
			
			end
		
		def play_maker #what maker does in his turn.
		end
		
		
			
	end
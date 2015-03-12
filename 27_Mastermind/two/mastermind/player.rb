module Mastermind
	class Player
		attr_reader :my_hash, :role, :user_name
		@@victory = false
		@@get_options = [GenCons::BreakerTitle,GenCons::MakerTitle]
		
		def initialize(gam_type,*role)
			@code_length = GensCons::CodeLength
			@max_rounds = GenCons::MaxRounds
			@my_name_array = get_name
			@user_name = @my_name_array[0]
			@game_type = gam_type
			@role = differentiate(@@get_options)
			self.pull_module(role)
			self.build_hash(@my_name_array<<role)
			end
		
		def get_name
			puts "What's your name? Example: John Butt"
			name = gets.chomp
			real_name = name.split.map {|i| i.capitalize}.join(" ")
			new_name = real_name.strip.downcase.scan(/\w*/)
			user_name= new_name[2][(0..3)] + new_name[0][(0..3)]
			[user_name,real_name]
			end

		def differentiate(options) #Figure out what object wants to be
			if options[0]==options[-1]
				role = options[0]
				puts "I already know what you're going to be! You're going to be #{role}!"
				return role
				end
			puts "Hey, are you here to crack the code or make the code? [c/m]"
			role_response = String.new
			gets.chomp.scan(/([c,m])(.*)/) {|x,rest| role_response = x.to_s}
			if role_response == GenCons::Breakans
				role ||= GenCons::BreakerTitle
				elsif role_response == GenCons::Makeans
				role ||= GenCons::MakerTitle
				end
			@@get_options = delete_used(options,role)
			return role
			end
		
		def delete_used(array,element)
			array.delete_at(array.index element)
			return array
			end
		
		def pull_module(info)
			extend Codemaker if info == GenCons::MakerTitle
			extend Codebreaker if info == GenCons::BreakerTitle
			end
		
		def build_hash(info)
			@my_hash = {user_name: info[0], real_name: info[1], role: info[2]}
			end
				
#		def set_up
#			puts instructions
#			end
		
#		def victory?
#			true if 
		end
			
	end
	

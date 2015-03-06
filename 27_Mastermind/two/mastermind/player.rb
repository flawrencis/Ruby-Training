module Mastermind
	class Player
		attr_reader :my_hash
		@@get_options = [GenCons::Breaker_title,GenCons::Maker_title]
		
		def initialize(gam_type,role*)
			@my_name_array = get_name
			@game_type = gam_type
			role = differentiate(@@get_options)
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
				role ||= GenCons::Breaker_title
				elsif role_response == GenCons::Makeans
				role ||= GenCons::Maker_title
				end
			@@get_options = delete_used(options,role)
			return role
			end
		
		def delete_used(array,element)
			array.delete_at(array.index element)
			return array
			end
		
		def pull_module(info)
			extend Codemaker if info == GenCons:Maker_title
			extend Codebreaker if info == GenCons:Breaker_title
			end
		
		def build_hash(info)
			@my_hash = {user_name: info[0], real_name: info[1], role: info[2]}
		end
		
		def set_up
			puts instructions
	end

module Mastermind
	class Computer
		attr_reader :user_name, :role
		def initialize(option)
			@role = option[0]
			@user_name = get_name
			self.pull_module(@role)
			puts "Your opponent is the computer!"
			end		
		
		def pull_module(info)
			p "DEBUG: I'm in the computer.rb file and in the pull_module function and will extend the following because info is #{info}"
			p "Codemaker" if info == GenCons::MakerTitle
			p "Codebreaker" if info == GenCons::BreakerTitle
			extend Ccodemaker if info == GenCons::MakerTitle
			extend Ccodebreaker if info == GenCons::BreakerTitle
			end
		
		def get_name
			orig_os_name = `sw_vers -productName`.chomp
			orig_ver_name = `sw_vers -productVersion`
			
			tex_os_name = orig_os_name.downcase.scan(/\S/)
#			arr_os_name = tex_os_name.split("")
#			fin_os_name = arr_os_name[0,1,2].join
#			fin_os_name << arr_os_name[-2]
#			fin_os_name << arr_os_name[-1]
			fin_os_name = tex_os_name[0..2].join
			fin_os_name << tex_os_name[-2]
			fin_os_name << tex_os_name[-1]
			return fin_os_name
			end
			
		end
	
	end
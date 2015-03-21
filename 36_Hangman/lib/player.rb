module Hangman
	class Player
		
		attr_reader :user_name
		def initialize
			name_array = get_name
			@user_name = name_array[0]
			end

		def get_name
			puts "What's your name? Example: John Butt"
			name = gets.chomp
			GenMeans.put_break
			real_name = name.split.map {|i| i.capitalize}.join(" ")
			new_name = real_name.strip.downcase.scan(/\w*/)
			user_name= new_name[2][(0..3)] + new_name[0][(0..3)]
			puts "Thanks, #{real_name}. Your user_name is #{user_name}."
			[user_name,real_name]
			end
		
		def folder_setup
			fold_needed = folder_check
			fold_obj = Dir.chdir './records' do |rec_fold|
				current_path = Dir.getwd
				if fold_needed
					puts "You do not yet have a folder for your"
					puts "data. I am going to make one now."
					Dir.mkdir(current_path + "/" + @user_name)
					else
					puts "You have a folder from previous games."
#					wd = Dir.getwd
					end
				fold_o = Dir.new(
					"#{current_path}/#{@user_name}")
				return fold_o
				end
			return fold_obj
			end
			
		
		def folder_check
			fold_needed = Dir.chdir './records' do |folder|
				findings = Dir.glob("#{@user_name}*")
#				puts findings
				findings.eql? []
				end
			end
		end
	end

#Sources
#http://stackoverflow.com/questions/19280341/create-directory-if-it-doesnt-exist-with-ruby
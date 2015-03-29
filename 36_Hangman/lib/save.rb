module Hangman
	require 'yaml'
	class Save
		
		attr_accessor :record_file
		def initialize(time,fold_obj)
			@fold_obj = fold_obj
			yr = time.year.to_s.slice(2,3)
			mo = time.month.to_s
			mo_length = mo.length
			puts "DEBUG: Mo is #{mo} of class #{mo.class} and has length #{mo.length}, as saved to the variable mo_length: #{mo_length}"
			da = time.day.to_s
			mo.prepend("0") if mo_length == 1
			puts "DEBUG: We just prepended a '0' on mo, which is now #{mo} because mo.length was 1, but it is now #{mo.length}. See? #{mo_length}." if mo_length == 1
			prefix = "#{yr}#{mo}#{da}_"
			i = 0
			begin
				case i
					when 0
					puts "What would you like to call the file "
					puts "to which these data are saved?"
					else
					puts "I need a different name. That one exists."
					end
				file_name = gets.chomp.scan(/([^\.]*)\.?/)[0][0]
				GenMeans.put_break
				file_name.gsub!(/\s/,"_")
				puts "DEBUG: Just swapped out the spaces for underscores. Right now, file_name is #{file_name}."
				final_name = file_name + ".txt"
				puts "DEBUG: The final_name is #{final_name} because it has just had '.txt' added to it. The file_name has not yet had an extension added to it. That is next. Right now, it is #{file_name}."
				file_name << ".yml"
				i += 1
				end while File.exist?(file_name) #end #DELETE THIS SECOND END OR CODE WON'T WORK. ONLY HERE FOR FORMATTING.
			
			file_name.prepend(prefix)
			final_name.prepend(prefix)
					
			puts "The filename is #{file_name}."
			puts "DEBUG: So. File_name is #{file_name}. Final_name is #{final_name}."
			@final_file = final_name
			open_stream(file_name)
			end
		
		def open_stream(file_name)
			@record_file = Dir.chdir @fold_obj.path do |d|
				puts "DEBUG: I am trying to make a new file in #{d} using #{file_name}. Apparently it needs a parameter. Let's see whether a works"
				File.new(file_name,"a")
				end
			@orig_file = file_name
			@final_file = file_name.delete(".yml") + ".txt"
			end
		
		def fold_obj=(new_fold_obj)
			@fold_obj = new_fold_obj
			puts "DEBUG: We just, probably from the game file, made @fold_obj into #{new_fold_obj}."
			end

		def saver(details)
			puts "DEBUG: We are now in the saver method with an argument of #{details}!"
			Dir.chdir @fold_obj.path do |d|
				puts "DEBUG: Yo. d is #{d}, from the 'Dir.chdir @fold_obj.path' thing where @fold_obj is #{@fold_obj} and its path to which we are changing is #{@fold_obj.path}!"
				File.open(@record_file,"a") do |f|
					puts "DEBUG: YO. f is #{f}, from the 'File.open(file,\"a\")' thing where file is #{@record_file}!!\nDEBUG.. So let's write some damn details!"
					details.each do |o|
						the_sym = o[0].inspect
						the_value = o[1].inspect
						f.puts the_sym
						f.puts the_value
						f.puts ""
						end
					end
				end
			end
		
		def saver_y(details)
			puts "DEBUG: We are now in the saver_y method with an argument of #{details}!"
			
			details_y = details.to_yaml
			puts "DEBUG: @fold_obj is #{@fold_obj}."
			Dir.chdir @fold_obj.path do |d|
				puts "DEBUG: Yo. d is #{d}, from the 'Dir.chdir @fold_obj.path' thing where @fold_obj is #{@fold_obj} and its path to which we are changing is #{@fold_obj.path}!"
				puts "DEBUG: self.record_file is #{self.record_file}! That's the same as @record_file which is #{@record_file}!"
				File.open(self.record_file,"w") do |f|
					puts "DEBUG: Yo. We in here, writing. The parameter is 'w' so this should clear the whole file."
					f.puts details_y
					end
				end
			end
		
		def finish(outcome,hsh)
			puts "DEBUG: We are now inside the save_obj's finish method! The outcome is #{outcome} and the hash is #{hsh}"
			Dir.chdir @fold_obj.path do |d|
				puts "DEBUG: Yo. d is #{d}, from the 'Dir.chdir @fold_obj.path' thing!"
				name = @orig_file.delete(".yml")
				final_file = "#{outcome}_#{name}.txt"
				File.open(final_file, "w") do |f|
					puts "DEBUG: YO. f is #{f}, from the 'File.open(@final_file)' thing where final_file is #{final_file}!!"
					hsh.each do |o|
						the_sym = o[0].inspect
						the_value = o[1].inspect
						f.puts the_sym
						f.puts the_value
						f.puts ""
						end
					f.puts GenCons::FinishPhrase
					end
#				name = File.basename(@final_file)
#				puts "DEBUG: Variable outcome is #{outcome}."
#				new_name = "#{outcome}_#{name}"
#				puts "DEBUG: Are you ready to change the file from #{name} to #{new_name}"
#				gets
#				File.rename(name,new_name)
				end
			puts "We're deleting your yml file and just saving the data in a final txt file.\nYou will no longer have access to this game.\nObvs. It's over. Cool?"
			gets
			Dir.chdir @fold_obj.path do |d|
				File.delete(self.record_file)
				end
			
			end
		
		
		end
	end



module Hangman
	class Save
		attr_accessor :fold_obj, :record_file
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
				file_name << ".txt"
				i += 1
				end while File.exist?(file_name) #end #DELETE THIS SECOND END OR CODE WON'T WORK. ONLY HERE FOR FORMATTING.
			
			file_name.prepend(prefix)
					
			puts "The filename is #{file_name}."
			
			@record_file = Dir.chdir @fold_obj.path do |d|
				File.new(file_name,"a")
				end
			end

		def saver(details)
			puts "DEBUG: We are now in the saver method with an argument of #{details}!"
			Dir.chdir @fold_obj.path do |d|
				puts "DEBUG: Yo. d is #{d}, from the 'Dir.chdir @fold_obj.path' thing where @fold_obj is #{@fold_obj} and its path to which we are changing is #{@fold_obj.path}!"
				File.open(@record_file,"a") do |f|
					puts "DEBUG: YO. f is #{f}, from the 'File.open(file,\"a\")' thing where file is #{@record_file}!!\nDEBUG.. So let's write some damn details!"
					f.write details
					end
				end
			end
		
		def finish(outcome,hash)
			puts "DEBUG: We are now inside the save_obj's finish method! The outcome is #{outcome} and the hash is #{hash}"
			Dir.chdir @fold_obj.path do |d|
				puts "DEBUG: Yo. d is #{d}, from the 'Dir.chdir @fold_obj.path' thing!"
				File.open(@record_file, "a") do |f|
					puts "DEBUG: YO. f is #{f}, from the 'File.open(@record_file)' thing where record_file is #{@record_file}!!"
					f.puts hash
					f.puts GenCons::FinishPhrase
					end
				name = File.basename(@record_file)
				puts "DEBUG: Variable outcome is #{outcome}."
				new_name = "#{outcome}_#{name}"
				puts "DEBUG: Are you ready to change the file from #{name} to #{new_name}"
				gets
				File.rename(name,new_name)
				end
			
			end
		
		
		end
	end
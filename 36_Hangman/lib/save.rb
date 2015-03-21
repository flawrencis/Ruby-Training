module Hangman
	class Save
		attr_accessor :fold_obj, :record_file
		def initialize(time,fold_obj)
			@fold_obj = fold_obj
			yr = time.year.to_s.slice(2,3)
			mo = time.month.to_s
			da = time.date.to_s
			prefix = "#{yr}#{mo}#{da}_"
			begin
				case i
					when 0
					puts "What would you like to call the file "/
						"to which these data are saved?"
					else
					puts "I need a different name. That one exists."
					end
				file_name = gets.chomp.scan(/([^\.]*)\./)[0][0]
				file_name.gsub!(/\s/,"_")
				file_name << ".txt"
				end while File.exist?(file_name) end #DELETE THIS SECOND END OR CODE WON'T WORK. ONLY HERE FOR FORMATTING.
			
			file_name.prepend(prefix)
			
			@record_file = Dir.chdir @fold_obj.path do |d|
				File.new(file_name,"a")
				end
			end

		def saver(details)
			Dir.chdir @fold_obj.path do |d|
				File.open(file,"a") do |f|
					f.write details
					end
				end
			end
		
		def finish(outcome)
			Dir.chdir @fold_obj.path do |d|
				File.open(@record_file) do |f|
					f.puts GenCons::FinishPhrase
					end
				name = File.basename(@record_file,".txt")
				puts "DEBUG: Variable outcome is #{outcome}."
				new_name = "#{outcome}#{name}"
				File.rename(name,new_name)
				end
			
			end
		
		
		end
	end
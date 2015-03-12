module Mastermind
	module GenCons
		#answers designating roles
		Breakans = "c"
		Makeans = "m"
		#the role label
		BreakerTitle = "breaker"
		MakerTitle = "maker"
		#code-length
		CodeLength = 4
		#max-rounds
		MaxRounds = 12
		
		Options = {a: "\e[1;31mR\e[0m",
		b: "\e[1;34mB\e[0m",
		c: "\e[1;36mC\e[0m",
		d: "\e[1;33mY\e[0m",
		e: "\e[1;35mM\e[0m",
		f: "\e[1;37mW\e[0m",
		g: "\e[1;32mG\e[0m"}

		end
	end

lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/mastermind/*.rb"].each { |file| require file }

puts "Hey, first, say 'Game.new' followed by whatever you want to call it."
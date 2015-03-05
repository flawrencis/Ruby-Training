module Mastermind
	def identity
		puts "Mastermind module's identity function called."
		end
	
	module_function :identity
	end

puts "Welcome to your new game of Mastermind!"
puts "\nWhat would you like to call it?"
puts "Sorry, actually, this isn't an enabled feature."
#How do you customize what the game is called?
my_game = Game.new

#I need a way to tell, at the end of the game, that someone lied. Also, I need to test now whether I'm doing the inter-class references correctly.

# Gotta use this so that when instances are printed, the player's info all prints.
#def to_s
#"#{@name}: #{@price}"
#end
		
#	class Being
#    
#    @@count = 0
#
#    def initialize
#        @@count += 1
#        puts "Being class created"
#    end
#		This is how I can do number of players and stuff called.

#Could I use inheritance with Player class and have it inherit from Codemaker or Codebreaker, depending on some shit?
#Or, I could have a codemaker and codebreaker module with their own player, game etc classes. No, that seems messy.
#Actually, I do like that idea. We could have the player info acquired and then you make a Codemaker::Player.new or Codebreaker::Player.new, which would accept the player's details....
#No, I think I'll define functions for the codemaker and codebreaker's modules. Then, I'll include them in the Player's class.
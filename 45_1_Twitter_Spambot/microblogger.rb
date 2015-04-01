require 'jumpstart_auth'

class MicroBlogger
	attr_reader :client
	
	def initialize
		puts "Initializing MicroBlogger"
		@client = JumpstartAuth.twitter
		end
	
	def run
		puts "Welcome to Francis's Version of the JSL Twitter Client!"
		command = ""
		while command != "q"
			printf "enter command: "
			input = gets.chomp
      		parts = input.split(" ")
      		command = parts[0]			
			case command
				when 'q'
				puts "Goodbye!"
				when 't'
				tweet(parts[1..-1].join(" "))
				when 'dm'
				dm(parts[1], parts[2..-1].join(" "))
				when 'spam'
				spam_my_followers(parts[2..-1].join(" "))
				when 'elt'
				everyones_last_tweet
    			else
      			puts "Sorry, I don't know how to #{command}"
  				end
			end
		end
	
	def everyones_last_tweet
		friends = @client.friends
		friends.each do |friend|
			update = friend.status.text
			person = friend.screen_name
			puts person
			puts update
		  puts ""  
		end
	  end
	
	def followerslist
		screen_names = []
		@client.followers.each do |follower|
			screen_names << @client.user(follower).screen_name
			end
		return screen_names
		end
	
	def spam_my_followers(message)
		total = followerslist
		total.each do |follower|
			dm(follower,"hey, i'm new. yay!")
			end
		end
	
	def tweet(message)
		length = message.length
		if length <= 140 && length > 0
			@client.update(message)
			puts "Your tweet was sent!"
			else
			puts "Your message is too long."
			end
		end
	
	def dm(target,message)
		puts "Trying to send #{target} this direct message:"
  		puts message
		message = "d @#{target} #{message}"
		screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
		can = screen_names.include? target
  		tweet(message) if can
		puts "You can only DM people who follow you" unless can
		end
	end

blogger = MicroBlogger.new
blogger.tweet("MicroBlogger Initialized")
blogger.run

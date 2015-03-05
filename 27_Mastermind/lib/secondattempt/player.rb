class Player gam_type
	attr_reader :my_hash
	def initialize
		@my_hash = get_name
		@game_type = gam_type
		end
	
	def differentiate
		extend Codemaker if @game_type
		end
	
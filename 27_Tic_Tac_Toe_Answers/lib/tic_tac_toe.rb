require_relative "tic_tac_toe/version"

module TicTacToe
end

require_relative "tic_tac_toe/core_extensions.rb"
lib_path = File.expand_path(File.dirname(__FILE__))
puts lib_path
puts "Now trying to add /tic_tac_toe/**/*.rb files."
Dir[lib_path + "/tic_tac_toe/**/*.rb"].each { |file| require file }

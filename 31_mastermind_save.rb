require 'pstore'

store = PStore.new("mastermind_records")

store.transaction do
	store[:record] = Mastermind::Game.record
	end
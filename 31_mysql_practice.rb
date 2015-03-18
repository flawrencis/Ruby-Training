require 'rubygems'
require 'mysql'

#connect to a mysql datamase 'test' on the local machine
#using username of 'root' with no password
db = Mysql.connect('localhost','root',"flyin'v3", 'test')

#perform an arbitrary sql query

db.query("INSERT INTO people (name, age) VALUES('Chris', 25)")

#perform a query that returns data
begin
	query = db.query('SELECT * FROM people')
	
	puts "There were #{query.num_rows} rows returned"
	
	query.each_hash do |h|
		puts h.inspct
		end
	
	rescue
	puts db.errno
	puts db.error
	end

#close the connection cleanly
db.close
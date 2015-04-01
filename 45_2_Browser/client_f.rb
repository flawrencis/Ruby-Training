require 'socket'
require 'net/http'


url = URI.parse('http://127.0.0.1:49351/index.html')
 
host = url.host     # The web server
port = url.port                         # Default HTTP port
path = url.path 

hostname = 'localhost'

s = TCPSocket.open(hostname, port)
request = "GET #{path} HTTP/1.0\r\n\r\n"
s.print(request)               # Send request

while line = s.gets   # Read lines from the socket
	puts line.chop      # And print with platform line terminator
	end
s.close               # Close the socket when done
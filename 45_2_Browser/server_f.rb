require 'socket'               # Get sockets from stdlib

server = TCPServer.open(49351)  # Socket to listen on port 49351
loop {                         # Servers run forever
	client = server.accept       # Wait for a client to connect
	client.puts "We are connected."
	request = client.gets
	client.puts(request)
	client.puts(Time.now.ctime)  # Send the time to the client
	client.puts "Closing the connection. Bye!"
	client.close                 # Disconnect from the client
}
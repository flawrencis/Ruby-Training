require 'socket'
require 'net/http'


url = URI.parse('http://127.0.0.1:49351/index.html')
 
host = url.host     # The web server
port = url.port                         # Default HTTP port
path = url.path                # The file we want 

# This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2) 
print body                 
require 'socket'
require 'json'

host = 'localhost'
port = 2000

params = Hash.new { |hash, key| hash[key] = Hash.new }

input = ""
until input == "GET" || input == "POST"
  print "Enter your request [GET, POST]? "
  input = gets.chomp.upcase
end

if input == "GET"
  request = "GET /index.html HTTP/1.0\r\n\r\n"
elsif input == "POST"
  puts "What is your name?"
  name = gets.chomp
  puts "What is your email?"
  email = gets.chomp
  params[:person][:name] = name
  params[:person][:email] = email
  body = params.to_json
  request = "POST /thanks.html HTTP/1.0\r\nContent-Length: #{params.to_json.length}\r\n\r\n#{body}"
end

socket = TCPSocket.open(host, port)
socket.print(request)  #send the request to the server
response = socket.read #read the server response

#Split response at first blank line into headers and body
headers, body = response.split("\r\n\r\n", 2)
puts body
socket.close

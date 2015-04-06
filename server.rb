require 'socket'
require 'json'

server = TCPServer.open(2000)

loop do
  Thread.start(server.accept) do |client|

    request = client.read_nonblock(256)

    request_header, request_body = request.split("\r\n\r\n", 2)
    request_type = request_header.split[0]
    request_file = request_header.split[1][1..-1]  #exclude '/'

    if File.exist?(request_file)
      file = File.read(request_file)
      client.puts "HTTP/1.0 200 OK\r\n#{Time.now.ctime}\r\nContent-Type: text/html\r\nContent-Length: #{file.length}\r\n\r\n"
      if request_type == "GET"
        client.puts(file)
      elsif request_type == "POST"
        params = JSON.parse(request_body)
		profile_info = "<li>Name: #{params['person']['name']}</li><li>e-mail: #{params['person']['email']}</li>"
		client.puts file.gsub("<%= yield %>", profile_info)
      else
        client.puts "Unknow request error"
      end
    else
      client.puts "HTTP/1.0 404 Not Found\r\n#{Time.now.ctime}\r\n\r\n"
	  client.puts "404 Error, File does not exist!"
    end

    client.close
  end
end
# 多用户的关键，在于使用 client
require 'socket'

port = 2000

TCPServer.open(port) do |server|
  loop {
    Thread.start(server.accept) do |client|
      client.puts Time.now.ctime
      client.puts 'Connection closed, Bye!'
      client.close
    end
  }

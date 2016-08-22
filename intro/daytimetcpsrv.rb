require 'socket'              # 获取标准库

# TcpServer.open(2000) do |server|

server = TCPServer.open(2000) 

loop {
  client = server.accept
  client.puts Time.now.ctime
  # client.puts 'closing this connection, Bye!'
  client.close
}

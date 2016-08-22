require 'socket'

puts ARGV

hostname = 'localhost'
port = ARGV[0] || 2000

# server = TCPSocket.open(hostname, port)
#
# while line = server.gets
#   puts line.chop
# end
#
# server.close

TCPSocket.open(hostname, port) do |server|
  while line = server.gets
    puts line.chop
  end
end

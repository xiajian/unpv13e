# 介绍中的应用程序

## C 相关

daytimetcp 类型的应用代码示例，需要先在本地运行服务器，具体步骤如下: 

1. make daytimetcpsrv &&  make daytimetcpcli

1. sudo ./daytimetcpsrv 

1. ./daytimetcpcli 127.0.0.1

相关的程序，都会有特定协议版，协议无关版。

而服务器的实现， 也会分为迭代服务器，和并发服务器。

## Ruby 

作为脚本语言Ruby，Socket 编程要简单的多，以下代码实现的客户端和服务器: 

```
# 客户端 -  intro/daytimetcpcli.rb
require 'socket'

hostname = 'localhost'
port = 2000

TCPSocket.open(hostname, port) do |server|
  while line = server.gets
    puts line.chop
  end
end

# 服务器端 - intro/daytimetcpsrv.rb
require 'socket'              # 获取标准库

server = TCPServer.open(2000) 

loop {
  client = server.accept
  client.puts Time.now.ctime
  client.puts 'closing this connection, Bye!'
  client.close
}
```

当然，效率就跟 c 实现的巨大的差距，就是 trade-off。

```
✗ time ruby daytimetcpcli.rb
Mon Aug 22 14:52:49 2016
ruby daytimetcpcli.rb  0.03s user 0.01s system 90% cpu 0.041 total

✗ time ./daytimetcpcli 127.0.0.1
Mon Aug 22 14:53:58 2016
./daytimetcpcli 127.0.0.1  0.00s user 0.00s system 54% cpu 0.004 total
```

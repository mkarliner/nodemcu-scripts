    -- A simple http server
    srv=net.createServer(net.TCP) 
    srv:listen(2345,function(conn) 
      conn:on("receive",function(conn,payload) 
        print(payload) 
        conn:send("<h1> Hello, Mike's ESP.</h1>")
      end) 
      conn:on("sent",function(conn) conn:close() end)
    end)
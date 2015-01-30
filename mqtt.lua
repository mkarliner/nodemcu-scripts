mqtt = net.createConnection(net.TCP, 0) 

mqtt:mqtt("myid", 60, "mike", "apasswd")
 
mqtt:on("receive", function(conn, topic, data) print(topic .. ":" .. data) end) 

mqtt:on("connection", function(con) print("connected") end) 
mqtt:connect(1883,"192.168.10.195") 
 
mqtt:subscribe("hello/world",0, function(conn) print("subscribe success") end) 
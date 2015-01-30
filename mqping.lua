dofile('newmqtt.lua')

count = 0
m:on("command", function(conn, topic, data) 
	print(topic .. ":" .. data) 
	m:publish("response","temp",0,0, function(conn) print("sent") end)
end)
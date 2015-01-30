mqtt = net.createConnection(net.TCP, 0)
-- init mqtt client with keepalive timer 30sec
mqtt:mqtt("esp1", 30, "user", "password")

-- on publish message receive event
mqtt:on("receive", function(conn, topic, data) print(topic .. ":" .. data) end)



-- on connection event (all event inherit from net module)
mqtt:on("connection", function(con) 
	print("MQTT connected, subscribing") 
	mqtt:subscribe("hello/world",0, function(conn) 
		print("subscribe success") 
		mqtt:on("receive", function(conn, topic, data) 
			print(topic .. ":" .. data) 
		end)
	end)
end)



mqtt:connect(1883,"192.168.10.195")
-- subscribe topic with qos = 0

-- publish a message
count = 0
gpio.mode(4,gpio.INT, gpio.PULLUP)
function pubOnTrig(level)
     print("Bang")
     count = count +1
     mqtt:send("hello/world","hello from esp" .. count,0,0, function(conn) print("sent") end)
end

gpio.trig(4, "down",pubOnTrig)


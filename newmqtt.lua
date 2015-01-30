
-- init mqtt client with keepalive timer 30sec
m = mqtt.Client("esp2", 30, "user", "password")

-- init mqtt client with keepalive timer 120sec
--m = mqtt.Client()

-- setup Last Will and Testament (optional)
-- Broker will publish a message with qos = 0, retain = 0, data = "offline" 
-- to topic "/lwt" if client don't send keepalive packet
m:lwt("/lwt", "offline", 0, 0)

m:on("connect", function(con) 
	print ("connected")
	-- subscribe topic with qos = 0
	m:subscribe("commands",0, 
	function(conn) 
		print("subscribe success") 
		m:on("message", function(conn, topic, data) 
			print(topic .. ":" .. data) 
               pin = 5
               gpio.mode(pin, gpio.OUTPUT)
               if( gpio.read(pin) == gpio.HIGH) then
                    output = gpio.LOW
               else
                    output = gpio.HIGH
               end
               gpio.write(pin, output)
		end)
	end) 
end)

m:on("offline", function(con) 
	print ("offline") 
	dofile('temperature.lua')
end)

-- on publish message receive event
-- m:on("message", function(conn, topic, data)
--   print(topic .. ":" )
--   if data ~= nil then
--     print(data)
--   end
-- end)

-- for secure: m:connect("192.168.11.118", 1880, 1)
m:connect("192.168.10.195", 1883, 0)



-- publish a message with data = hello, QoS = 0, retain = 0
--m:publish("/topic","hello",0,0, function(conn) print("sent") end)

--m:close();
-- you can call m:connect again

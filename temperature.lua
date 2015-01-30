dofile('newmqtt.lua')

tmr.alarm(1,10000,1, function()
	temp = (adc.read(0)-500) /( 195/10)
     print(temp)
     if pcall(readtemp) then
          print("Temp sent OK")
     else
          print("Temp err" )
     end
	end)

function readtemp() 
      m:publish("temperature",temp,0,0, function(conn) print("sent") end)
 end

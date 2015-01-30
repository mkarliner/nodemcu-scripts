gpio.mode(4,gpio.INT, gpio.PULLUP)
function pubOnTrig(level)
     print("Bang")
end

gpio.trig(4, "both",pubOnTrig)
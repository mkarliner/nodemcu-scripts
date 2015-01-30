-- a simple telnet server
s=net.createServer(net.TCP,180) 
s:listen(2323,function(c) 
    function s_output(str) 
      if(c~=nil) 
        then c:send(str) 
      end 
    end 
    node.output(s_output, 0)   
    -- re-direct output to function s_ouput.
    c:on("receive",function(c,l) 
      node.input(l)           
      --like pcall(loadstring(l)), support multiple separate lines
    end) 
    c:on("disconnection",function(c) 
      node.output(nil)        
      --unregist redirect output function, output goes to serial
    end) 
    print("Welcome to NodeMcu world.")
end)

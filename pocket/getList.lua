rednet.open("back")
rednet.send(10, "list")
local data = rednet.receive()
if data then
    print(data)
end

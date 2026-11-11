rednet.open("back")
rednet.send(10, "list")
local sender, data = rednet.receive()
if data then
    textutils.pagedPrint(textutils.serialise(data))
else
    print("No data found")
end

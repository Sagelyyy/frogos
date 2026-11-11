rednet.open("back")
rednet.send(10, "list")
local sender, data = rednet.receive()
if data then
    for k, v in pairs(data) do
        print(data.name)
    end
else
    print("No data found")
end

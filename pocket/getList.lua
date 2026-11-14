rednet.open("back")
rednet.send(10, "list")
local sender, data = rednet.receive()
if data then
    for k, v in ipairs(data) do
        return { v.name, v.count }
    end
else
    print("No data found")
end

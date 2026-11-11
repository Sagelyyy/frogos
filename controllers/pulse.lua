local side = "top"
redstone.setOutput(side, false)
while true do
    redstone.setOutput(side, not redstone.getOutput(side))
    sleep(0.2)
    redstone.setOutput(side, not redstone.getOutput(side))
    sleep(5)
end

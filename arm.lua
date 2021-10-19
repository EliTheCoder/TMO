---@diagnostic disable: undefined-global
local args = {...}
local turts = args[1]

local fpt = math.floor(turtle.getItemCount(1)/turts)

local function arm()
	turtle.turnRight()
	turtle.select(1)
	turtle.drop(fpt)
	turtle.select(2)
	turtle.drop(1)
	turtle.turnLeft()
	local t = peripheral.wrap("right")
	t.reboot()
	turtle.forward()
	turtle.forward()
	turtle.forward()
end

for i = 1, turts do
	arm()
end



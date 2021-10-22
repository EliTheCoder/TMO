---@diagnostic disable: undefined-global
local function digDown()
	turtle.select(2)
	local success, data = turtle.inspectDown()
	if success then
		if data.name == "ComputerCraft:CC-Turtle" then
			print("tried to mine turtle")
			local _, d = turtle.inspectDown()
			while d.name == "ComputerCraft:CC-Turtle" do
				sleep(2)
				_, d = turtle.inspectDown()
			end
		end
	end
	while turtle.detectDown() do
		if turtle.digDown() then
			sleep(0.5)
		else
			return
		end
	end
end

local function refuel()
	turtle.select(1)
	if turtle.getFuelLevel() < 100 then
		if turtle.getItemCount() > 1 then
			turtle.refuel(1)
		end
	end
	if turtle.getFuelLevel() < 10 then
		print("waiting for refuel")
		while turtle.getFuelLevel() < 10 do
			if turtle.getItemCount() > 1 then
				turtle.refuel(1)
			end
			sleep(1)
		end
		print("fuel added. resuming")
	end
end

local function store()
	print("storing items")
	for i = 2, 16 do
		turtle.select(i)
		turtle.dropUp()
	end
end

local function pullFuel()
	turtle.select(1)
	turtle.suckUp(1)
	refuel()
end

local function replant()
	local slot = 1
	for i = 1, 16 do
		turtle.select(i)
		if turtle.getItemCount() > 0 then
			slot = i
		end
	end
	turtle.select(slot)
	turtle.placeDown()
	if turtle.getItemCount() > 0 then
		turtle.dropDown()
	end
end

local function forward()
	while not turtle.forward() do
		turtle.attack()
		sleep(1)
	end
end

local function line()
	refuel()
	while true do
		local s, d = turtle.inspectDown()
		if not s then
			return
		end
		if d.metadata >= 7 then
			digDown()
			replant()
		end
		forward()
	end
end

while true do
	local length = 0
	while redstone.getInput("top") do
		sleep(0.5)
	end
	while true do
		length = length + 2
		line()
		turtle.turnLeft()
		forward()
		turtle.turnLeft()
		forward()
		line()
		turtle.turnRight()
		forward()
		turtle.turnRight()
		forward()
		local s = turtle.inspectDown()
		if not s then break end
	end
	print("turning around")
	turtle.turnRight()
	for _ = 0, length do
		forward()
	end
	turtle.turnLeft()
	store()
	pullFuel()
	turtle.turnLeft()
	forward()
	turtle.turnRight()
	local _, d = turtle.inspectDown()
	print("waiting for full growth")
	while d.metadata < 7 do
		sleep(5)
		_, d = turtle.inspectDown()
	end
end



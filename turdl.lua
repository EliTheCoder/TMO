---@diagnostic disable: undefined-global
local dist = 160
local turts = 10
local space = turts*3

local function dig()
	local success, data = turtle.inspect()
	if success then
		if data.name == "ComputerCraft:CC-Turtle" then
			print("tried to mine turtle")
			local s, d = turtle.inspect()
			while d.name == "ComputerCraft:CC-Turtle" do
				sleep(2)
				s, d = turtle.inspect()
			end
		end
	end
	while turtle.detect() do
		if turtle.dig() then
			sleep(0.5)
		else
			return
		end
	end
end

local function digUp()
	local success, data = turtle.inspectUp()
	if success then
		if data.name == "ComputerCraft:CC-Turtle" then
			print("tried to mine turtle")
			local s, d = turtle.inspectUp()
			while d.name == "ComputerCraft:CC-Turtle" do
				sleep(2)
				s, d = turtle.inspectUp()
			end
		end
	end
	while turtle.detectUp() do
		if turtle.digUp() then
			sleep(0.5)
		else
			return
		end
	end
end

local function digDown()
	local success, data = turtle.inspectDown()
	if success then
		if data.name == "ComputerCraft:CC-Turtle" then
			print("tried to mine turtle")
			local s, d = turtle.inspectDown()
			while d.name == "ComputerCraft:CC-Turtle" do
				sleep(2)
				s, d = turtle.inspectDown()
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
	if turtle.getItemCount(16) 
	turtle.select(2)
	turtle.placeDown()
	turtle.



local function forward()
	while not turtle.forward() do
		turtle.attack()
		sleep(1)
	end
end

local function tunnel()
	refuel()
	store()
	dig()
	forward()
	digUp()
	digDown()
	turtle.turnLeft()
	dig()
	forward()
	digUp()
	digDown()
	turtle.turnRight()
	turtle.turnRight()
	forward()
	dig()
	forward()
	digUp()
	digDown()
	turtle.turnLeft()
	turtle.turnLeft()
	forward()
	turtle.turnRight()
end

local function hole()
	refuel()
	dig()
	turtle.forward()
end

for i = 1, dist do
	tunnel()
end

turtle.turnLeft()

for i = 1, space do
	hole()
end

turtle.turnLeft()

for i = 1, dist do
	tunnel()
end

turtle.turnRight()

for i = 1, space do
	hole()
end

turtle.turnRight()
hole()
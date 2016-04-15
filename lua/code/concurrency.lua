--[[
Coroutine Concurrency Basic
]]--
co = coroutine.create(function ()
           for i=1,10 do
             print("co", i)
             coroutine.yield()
           end
         end)

coroutine.resume(co) --> co 1
print(coroutine.status(co)) --> Report status as suspended
coroutine.resume(co) --> co 2
coroutine.resume(co) --> co 3
coroutine.resume(co) --> co 4
coroutine.resume(co) --> co 5
coroutine.resume(co) --> co 6
coroutine.resume(co) --> co 7
coroutine.resume(co) --> co 8
a = coroutine.resume(co) --> co 9
print(a) --> true as return value
coroutine.resume(co) --> co 10
coroutine.resume(co) --> nothing
print(coroutine.resume(co)) --> false



--[[
Producer and Consumer
]]--
function send (x) -- producer
	coroutine.yield(x)
end

function receive (prod)
	local status, value = coroutine.resume(prod)
	return value
end

function producer ()
	return	coroutine.create(function ()
						while true do
							local x = io.read() -- produce new value
							send(x)
						end
					end)
end

function consumer (prod)
	while true do
		local x = receive(prod)
		io.write(x, "\n")
	end
end

function filter (prod)
	return	coroutine.create(function()
		local line = 1
		while true do
			local x = receive(prod) -- Get new value
			x = string.format("%5d %s", line, x)
			send(x)
			line = line + 1
		end
	end)
end

print(consumer(filter(producer())))
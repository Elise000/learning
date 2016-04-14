--[[
Example code
]]--
function maximum (a)
	local mi = 1          -- maximum index
	local m = a[mi]       -- maximum value

	for i,val in ipairs(a) do
		if val > m then
			mi = i
			m = val
		end
	end

	return m, mi
end
print(maximum({8,10,23,12,5}))     --> 23   3



--[[
Setting return
]]--
function foo ()
	print("return")
	-- return          								--<< SYNTAX ERROR
	-- `return' is the last statement in the next block
	do return end   -- OK
	print("after return")             -- statements not reached
end



--[[
Multiple return results
]]--
function foo0 () end                  -- returns no results
function foo1 () return 'a' end       -- returns 1 result
function foo2 () return 'a','b' end   -- returns 2 results



--[[
Variable arguments (...)
]]--
function customPrint (...)
	for i,v in ipairs(arg) do
		printResult = printResult .. tostring(v) .. "\t"
	end
end



--[[
Named arguments
]]--
function rename (arg)
	return os.rename(arg.old, arg.new)
end
rename{old="temp.lua", new="temp1.lua"}



--[[
Closure (function within function)
]]--
function newCounter()
	local i = 0
	return	function()
						i = i + 1
						return i
					end
end
c1 = newCounter()
print(c1()) --> 1
print(c1()) --> 2

c2 = newCounter() --> new internal counter is created
print(c2()) --> 1
print(c1()) --> 3 # c1() continues to count up
print(c2()) --> 2



--[[
Forward Delaration, Multi-state function
]]--
local iterator; -- Use later

function allwords()
	local state  = {line = io.read(), pos = 1}
	return iterator, state
end

function iterator(state) -- Define function here

	while state.line do
		local s, e = string.find(state.line, "%w+", state.pos)
		if s then
			state.pos = e + 1
			return string.sub(state.line, s, e)
		else
			state.line = io.read()
			state.pos = 1
		end
	end

	return nil

end
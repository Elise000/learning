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
function print (...)
	for i,v in ipairs(arg) do
		printResult = printResult .. tostring(v) .. "\t"
	end
	printResult = printResult .. "\n"
end



--[[
Named arguments
]]--
function rename (arg)
	return os.rename(arg.old, arg.new)
end
rename{old="temp.lua", new="temp1.lua"}
a = {};
a.x = 1;
a.y = 2;

b = {};
b.x = 1;
b.y = 2;

c = a



--[[
Relational Operator
]]--
print(a == c) -- true, both objects are equal
print(a == b) -- false, a and b are separate objects
print(a ~= b) -- true, negating the object equality
print(2 >= 15) -- false
print(2 <= 15) -- true
print(2 > 15) -- false
print(2 < 15) -- true
print(2 >= 2) -- true, equal stands place
print(2 <= 2) -- true, equal stands place
print(2 > 2) -- false, since 2 are equals
print(2 < 2) -- false, since 2 are equals



--[[
Logical Operator
]]--
print(2 or 5) -- 2 goes in since it's valid and taken, 5 is neglected
print(2 and 5) -- 5 goes in since it's evaluated last
print(not true) -- false, since it's not true

-- the "a ? b : c" statement in other languages
print(false and "true statement" or "false statement")



--[[
if elseif else
]]--
op = "+"; a = 5; b = 6;

if op == "+" then
  r = a + b
elseif op == "-" then
  r = a - b
elseif op == "*" then
  r = a*b
elseif op == "/" then
  r = a/b
else
  error("invalid operation")
end



--[[
while loop - operate when condition is true, stop when condition is false
]]--
while true do
  print("new number");
  break;
end



--[[
repeat loop - operate when condition is false, stop when condition is true
]]--
repeat
  print("x throne")
  break;
until line ~= ""
print(line)



--[[
for loop - counting loop
]]--
-- count down for loop
for i=10,1,-1 do
	print("for loop" .. i)
	if (i == 5) then
		print("intercepted");
		break;
	end
end

-- count up for loop
for i=1,10,1 do
	print("for loop" .. i)
end

-- Generic for
days = {"Sunday", "Monday", "Tuesday", "Wednesday",
        "Thursday", "Friday", "Saturday"}
revDays = {}
for i,v in ipairs(days) do
  revDays[v] = i
  print(revDays[v] .. v .. i)
end



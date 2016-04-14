
--[[ This is a comment ]]--
--[[
This is
multi-line
comments.
]]--



--[[
Human Interface
]]--

-- Printout
print("Hello. What do you have in mind?");

-- Get user input
line = io.read();
print(line);



--[[
Chuck / Variables
]]--
a = 1;
b = a * 1;
print(b);

-- global variable
x = 10;

-- local variable
local i = 1        -- local to the chunk

while i<=x do
  local x = i*2    -- local to the while body
  print(x)         --> 2, 4, 6, 8, ...
  i = i + 1
end

if i > 20 then
  local x          -- local to the "then" body
  x = 20
  print(x + 2)
else
  print(x)         --> 10  (the global one)
end
print(x)           --> 10  (the global one)


--[[
Datatype
]]--
print(type("Hello world"));  --> string
print(type(10.4*3));         --> number
print(type(print));          --> function
print(type(type));           --> function
print(type(true));           --> boolean
print(type(nil));            --> nil
print(type(type(X)));        --> string

print(nil); --> null object
print(4); --> basic integer
print(0.4); --> basic float
print(4.57e-3); --> basic double

string = "Hello World";
print(string);

page = [[
<HTML>
<HEAD>
<TITLE>An HTML Page</TITLE>
</HEAD>
<BODY>
 <A HREF="http://www.lua.org">Lua</A>
</BODY>
</HTML>
]];
print(page);



--[[
String Operations
]]--
-- automatic mathematic conversion
print("10" + 1); --> 11
print("10 + 1"); --> 10 + 1
-- print("hello" + 1) --> error since "hello" can't be converted

-- concatenation
print(10 .. 20); --> 1020 concatenation between 10 and 20
print("hello " .. "world"); --> "hello world"



--[[
Tables
]]--
-- create a table
a = {};
a["x"] = 10;
print(a["x"]); --> 10
print(a.x); --> 10  # a.x is the same as a["x"]

a[20] = "great"; --> New Entry
print(a[20]);

-- Calling an invalid element
print(a[30]); --> nil


-- References
c = {};
c["a"] = 10;
b = c;
print(b["a"]); --> 10
c = nil;
print(c); --> nil
print(b); --> Table object
b = nil;
print(c); --> nil
print(b); --> nil. Table is garbage collected

-- Iterate over the table
a[1] = "a"; -- lua starts from 1, not 0
a[2] = "b";
a[3] = "c";
for i,line in ipairs(a) do
  print(i .. ": " .. line);
end




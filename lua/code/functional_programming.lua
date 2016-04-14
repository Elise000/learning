
--[[
Tail calling
]]--
function room1 ()
  local move = io.read()
  if move == "south" then return room3()
  elseif move == "east" then return room2()
  else print("invalid move")
       return room1()   -- stay in the same room
  end
end

function room2 ()
  local move = io.read()
  if move == "south" then return room4()
  elseif move == "west" then return room1()
  else print("invalid move")
       return room2()
  end
end

function room3 ()
  local move = io.read()
  if move == "north" then return room1()
  elseif move == "east" then return room4()
  else print("invalid move")
       return room3()
  end
end

function room4 ()
  print("congratulations!");
end

print(room1());



--[[
Functional Programming Annotation
]]--
a = {p = print}
a.p("Hello World") --> Hello World
print = math.sin  -- `print' now refers to the sine function
a.p(print(1))     --> 0.841470
sin = a.p         -- `sin' now refers to the print function
sin(10, 20)       --> 10      20

network = {
 {name = "grauna",  IP = "210.26.30.34"},
 {name = "arraial", IP = "210.26.30.23"},
 {name = "lua",     IP = "210.26.23.12"},
 {name = "derain",  IP = "210.26.23.20"},
}
table.sort(network, function (a,b)
  return (a.name > b.name)
end)
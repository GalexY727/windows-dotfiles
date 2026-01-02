local bands, b, rows, r, v = ...

local row = r / rows
local theta = -(b / bands * 6.28*2 + (r * 0.02454 * 1/16) - (1 - row)^2 * v * 1) + (v % 0.1 * 3)
local curve = math.sin(row * 1.57)
local x = .8 * math.cos(theta) * curve^2 * v * 2
local ytemp = .8 * math.sin(theta) * curve^2 * v * 2 - 0.2
local y = (ytemp > 0) and (ytemp) or (1/16 * ytemp)
local z = curve * v^0.3 * 2 - 1.4
z = (x^2 + ytemp^2 < 0.6) and (0/0) or (z)

return x, y, z

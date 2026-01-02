local bands, b, rows, r, v = ...

local theta = -((b / bands * 6.28 + r * 0.02454) * 1)
local curve = math.sin(r / rows * 1.57)
local x = math.cos(theta) * curve * 1.5
local y = math.sin(theta) * curve * 1.6
local z = curve^2 * v * 1.2 - 0.6
-- set z to -40 if x < 0.75 and y < 0.05 or if y < 0
if (x < 0.75 and y < 0.05) or y < 0 then
  z = -40
end

return x, y, z

---@meta

---Pico-8 math functions.
---The Picotron manual currently does not have a chapter on math functions.

---Returns the maximum of x and y.
---@param x number
---@param y number
---@return number
function max(x, y) end

---Returns the minimum of x and y.
---@param x number
---@param y number
---@return number
function min(x, y) end

---Returns the middle value of parameters.
---@param x number
---@param y number
---@param z number
---@return number
function mid(x, y, z) end

---Rounds x down to the nearest integer.
---@param x number
---@return integer
function flr(x) end

---Rounds x up to the nearest integer.
---@param x number
---@return integer
function ceil(x) end

---Returns the cosine of x.
---@param x number
---@return number
function cos(x) end

---Returns the sine of x.
---@param x number
---@return number
function sin(x) end

---Converts DX, DY into an angle from 0..1
---@param dx number
---@param dy number
---@return number
function atan2(dx, dy) end

---Returns the square root of x.
---@param x number
---@return number
function sqrt(x) end

---Returns the absolute value of x.
---@param x number
---@return number
function abs(x) end

---returns a random number n, 0 <= n < x.
---
---rnd() will return number n, 0 <= n < 1
---@param x number?
---@return number
function rnd(x) end

---Sets the random number seed. The seed is automatically randomized on cart startup.
---@param x number
function srand(x) end

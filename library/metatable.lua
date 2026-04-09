---@meta

---Set table TBL metatable to M
---
---[View documents](https://www.lexaloffle.com/dl/docs/pico-8_manual.html#SETMETATABLE)
---@param tbl table
---@param m table
function setmetatable(tbl, m) end

---return the current metatable for table t, or nil if none is set
---
---[View documents](https://www.lexaloffle.com/dl/docs/pico-8_manual.html#GETMETATABLE)
---@param tbl table
function getmetatable(tbl) end

---Raw access to the table, as if no metamethods were defined.
---
---[View documents](https://www.lexaloffle.com/dl/docs/pico-8_manual.html#RAWSET)
---@param tbl any
---@param key any
---@param value any
function rawset(tbl, key, value) end

---Raw access to the table, as if no metamethods were defined.
---
---[View documents](https://www.lexaloffle.com/dl/docs/pico-8_manual.html#RAWGET)
---@param tbl any
---@param key any
---@return any
function rawget(tbl, key) end

---Raw access to the table, as if no metamethods were defined.
---
---[View documents](https://www.lexaloffle.com/dl/docs/pico-8_manual.html#RAWRAWEQUAL)
---@param tbl1 table
---@param tbl2 table
function rawequal(tbl1, tbl2) end

---Raw access to the table, as if no metamethods were defined.
---
---[View documents](https://www.lexaloffle.com/dl/docs/pico-8_manual.html#RAWLEN)
function rawlen(tbl) end

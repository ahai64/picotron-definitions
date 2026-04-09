---@meta

---@class table: { [unknown]: any }
---@class table<K, V>: { [K]: V }

---Add value val to the end of table tbl.
---
---If index is given then the element is inserted at that position.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#add)
---@param tbl table
---@param val any
---@param index number?
function add(tbl, val, index) end

---Delete the first instance of value VAL in table TBL.
---
---The remaining entries are shifted left one index to avoid holes.
---
---Note that val is the value of the item to be deleted, not the index into the table.
---
---(To remove an item at a particular index, use deli() instead).
---
---del() returns the deleted item, or returns no value when nothing was deleted.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#del)
---@param tbl table
---@param val any
---@return any
function del(tbl, val) end

---Like del(), but remove the item from table tbl at index.
---
---When index is not given, the last element of the table is removed and returned.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#deli)
---@param tbl table
---@param index number?
---@return any
function deli(tbl, index) end

---Returns the length of table t (same as #tbl).
---
---When val is given, returns the number of instances of VAL in that table.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#count)
---@param tbl table
---@param val any?
---@return number
function count(tbl, val) end

---Used in for loops to iterate over all items in a table (that have a 1-based integer index), in the order they were added.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#all)
---@param tbl table
function all(tbl) end

---For each item in table tbl, call function func with the item as a single parameter.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#foreach)
---@param tbl table
---@param func function
function foreach(tbl, func) end

---Used in for loops to iterate over table tbl, providing both the key and value for each item.
---
---Unlike all(), pairs() iterates over every item regardless of indexing scheme.
---
---Order is not guaranteed.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#pairs)
---@generic T: table, K, V
---@param tbl T
---@return fun(table: table<K, V>, index?: K):K, V
---@return T
function pairs(tbl) end

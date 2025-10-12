---@meta

---Adds a custom item to the pause menu (invoked with the Enter key).
---
---There is no official documentation for `menuitem`, but there is a chance
---it works similar to PICO-8 version ([view online](https://www.lexaloffle.com/dl/docs/pico-8_manual.html#MENUITEM)).
---
---@param index number The place in the menu where to put the new item.
---@param label string
---@param callback? fun(bitfield: number): boolean? A funtion to be calledwhen the item is selected by the user. Takesa a single argument that is a bitfield of button presses. If the callback returns true, the pause menu remains open.
function menuitem(index, label, callback) end

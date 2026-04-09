---@meta

---@class Undostack
local Undostack = {}

---Create an undo stack.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#create_undo_stack)
---@param save function
---@param load function
---@param pod_flags? any default: 0x81
---@param item any?
---@return Undostack
function create_undo_stack(save, load, pod_flags, item) end

---Add an item to the undo stack by calling the stack's save function.
---
---extra is an optional arbitrary value associated with that checkpoint that is returned by :undo and :redo.
---
---To read the extra value without actually applying the checkpoint, use :undo(true) or :redo(true).
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#stack_checkpoint)
---@param extra any?
function Undostack:checkpoint(extra) end

---Call these when the user presses ctrl-y
---
---A checkpoint delta is popped off the redo stack and the stack's load function is called to restore the program state to that checkpoint.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#stack_redo)
function Undostack:redo() end

---Call these when the user presses ctrl-z
---
---A checkpoint delta is popped off the undo stack and the stack's load function is called to restore the program state to that checkpoint.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#stack_undo)
function Undostack:undo() end

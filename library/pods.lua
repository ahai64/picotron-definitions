---@meta

---Returns a binary string encoding val.
---
---When a table contains circular references, pod() returns nil.
---
---Functions and other non-encodable values can be present in this input, but are encoded with a value of nil.
---
---flags determine the encoding format (default: 0x0)
---
---The default flags value is 0x0 which gives plain text that is also legal Lua that returns the value being encoded
---
---metadata is an optional value that is encoded into the string and stores additional information about the pod.
---
---When the second or third parameter is a table, it is taken to be the metadata
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#pod)
---@param val any
---@param flags any?
---@param metadata any?
---@return string
function pod(val, flags, metadata) end

---returns the decoded value, and the decoded metadata as a second result.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#unpod)
---@param str string
---@return any,metadata
function unpod(str) end

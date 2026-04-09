---@meta

---read a byte from an address in ram.
---
---if n is specified, peek() returns that number of results (max: 65536).
---
---for example, to read the first 2 bytes of video memory:
---
---```
---a, b = peek(0x10000, 2)
---```
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#peek)
---@param addr number
---@param n number?
---@return number ...
function peek(addr, n) end

---write one or more bytes to an address in base ram.
---
---if more than one parameter is provided, they are written sequentially (max: 65536).
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#poke)
---@param addr any
---@param val1 any
---@param ... any?
function poke(addr, val1, ...) end

---peek i16 version
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#peek2)
function peek2(addr) end

---pook i16 version
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#poke2)
function poke2(addr, val, ...) end

---peek i32 version
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#peek4)
function peek4(addr) end

---pook i32 version
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#poke4)
function poke4(addr, val, ...) end

---peek i64 version
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#peek8)
function peek8(addr) end

---pook i64 version
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#poke8)
function poke8(addr, val, ...) end

---copy len bytes of base ram from source to dest.
---
---sections can be overlapping (but is slower)
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#memcpy)
function memcpy(dest_addr, src_addr, len) end

---write the 8-bit value val into memory starting at dest_addr, for len bytes.
---
---for example, to fill half of video memory with 0xc8:
---```
---memset(0x10000, 0xc8, 0x10000)
---```
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#memset)
function memset(dest_addr, val, len) end

---@meta

---Convert VAL to a string.
---
---This is a function in the PICO-8 but is still available in the Picotron.
---
---[View Online](https://www.lexaloffle.com/dl/docs/pico-8_manual.html#TOSTR)
---@param val any
---@param format_flags number?
---@return string
function tostr(val, format_flags) end

---Converts VAL to a number.
---
---This is a function in the PICO-8 but is still available in the Picotron.
---
---[View Online](https://www.lexaloffle.com/dl/docs/pico-8_manual.html#TONUM)
---@param val any
---@param format_flags number?
---@return number
function tonum(val, format_flags) end

---Convert one or more ordinal character codes to a string.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#chr)
---@param val0 number
---@param ... number
---@return string
function chr(val0, ...) end

---Convert one or more characters from string STR to their ordinal (0..255) character codes.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#ord)
---@param str string
---@param index number? -- specify which character in the string to use
---@param num_results number? -- When num_results is given, ord returns multiple values starting from index.
---@return number|nil -- When index is out of range or str is not a string, ord returns nil.
function ord(str, index, num_results) end

---grab a substring from string str, from pos0 up to and including pos1.
---
---when pos1 is not specified, the remainder of the string is returned.
---
---when pos1 is specified, but not a number, a single character at pos0 is returned.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#sub)
---@param str string
---@param pos0 number
---@param pos1 number?
function sub(str, pos0, pos1) end

---Split a string into a table of elements delimited by the given separator (defaults to ",").
---
---When separator is a number n, the string is split into n-character groups.
---
---When convert_numbers is true, numerical tokens are stored as numbers (defaults to true).
---
---Empty elements are stored as empty strings.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#split)
---@param str string
---@param separator string|number?
---@param convert_numbers boolean?
---@return table
function split(str, separator, convert_numbers) end

---Returns the type of val as a string.
---
---To find out if a number is an integer or float, use math.type(num).
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#type)
---@param val any
---@return string
function type(val) end

---create_delta returns a string encoding all of the information needed to get from str0 to str1 ("delta").
---
---The delta can then be used by apply_delta to reproduce str1 given only str0.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#create_delta)
---@param str0 string
---@param str1 string
---@return delta
function create_delta(str0, str1) end

---create_delta returns a string encoding all of the information needed to get from str0 to str1 ("delta").
---
---The delta can then be used by apply_delta to reproduce str1 given only str0.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#apply_delta)
---@param str0 string
---@param delta delta
---@return string
function apply_delta(str0, delta) end

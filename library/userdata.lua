---@meta

---Userdata in Picotron is a fixed-size allocation of memory that can be manipulated as a 1d or 2d array of typed data.
---
---It is used to repesent many things in Picotron: vectors, matrices, to store sprites, maps and the contents of display.
---
---Therefore, all of these things can be manipulated with the userdata API.
---
---It is also possible to expose the raw binary contents of a userdata to RAM (by giving it an address with memmap), in which case userdata API can be used to directly manipulate the contents of RAM.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#Userdata)
---@class Userdata
---@field x number the 1st element of a userdata
---@field y number the 2nd element of a userdata
---@field z number the 3rd element of a userdata
---@field u number the 4th element of a userdata
---@field v number the 5th element of a userdata
---@field w number the 6th element of a userdata
---@field t number the 7th element of a userdata
local Userdata = {}

---Create a userdata with a data type
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata)
---@param data_type string u8, i16, i32, i64, or f64
---@param width number
---@param height number
---@param data string?
---@return Userdata
function userdata(data_type, width, height, data) end

---A convenience function for constructing 1d vectors of f64s.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#vec)
---@param ... number
---@return Userdata
function vec(...) end

---Return the width of the userdata
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_width)
---@return number
function Userdata:width() end

---Return the height of the userdata
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_height)
---@return number
function Userdata:height() end

---Returns the width, height, type and dimensionality of a userdata. Unlike :height(), :attribs() returns 1 as the height for 1d userdata.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_attribs)
function Userdata:attribs() end

---Return n values starting at x (or x, y for 2d userdata), or 0 if out of range.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_get)
---@param x number
---@param y number?
---@param n number
---@return number
function Userdata:get(x, y, n) end

---Return n values starting at x (or x, y for 2d userdata), or 0 if out of range.
---
---[View Online under `userdata:set()`](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_set)
---@param u Userdata
---@param x number
---@param y number?
---@param n number
---@return number
function get(u, x, y, n) end

---Set one or more values starting at x (or x, y for 2d userdata).
---
---Values set at locations out of range are clipped and have no effect.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_set)
---@param x number
---@param y number?
---@param val0 any
---@param ... any
function Userdata:set(x, y, val0, ...) end

---Set one or more values starting at x (or x, y for 2d userdata).
---
---Values set at locations out of range are clipped and have no effect.
---
---When the global set() is passed a nil userdata, no error or action is performed.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_set)
---@param u Userdata
---@param x number
---@param y number?
---@param val0 any
---@param ... any
function set(u, x, y, val0, ...) end

---Return a row of a 2d userdata (0 is the first row), or nil when out of range.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_row)
---@param i number
---@return Userdata
function Userdata:row(i) end

---Return a column of a 2d userdata (0 is the first column), or nil when out of range.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_column)
---@param i number
---@return Userdata
function Userdata:column(i) end

---Copy a region of one userdata to another. Both src and dest must be the same type.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_blit)
---@param dest Userdata?
---@param src_x number?
---@param src_y number?
---@param dest_x number?
---@param dest_y number?
---@param width number?
---@param height number?
function Userdata:blit(dest, src_x, src_y, dest_x, dest_y, width, height) end

---Copy a region of one userdata to another. Both src and dest must be the same type.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#blit)
---@param src Userdata?
---@param dest Userdata?
---@param src_x number?
---@param src_y number?
---@param dest_x number?
---@param dest_y number?
---@param width number?
---@param height number?
function blit(src, dest, src_x, src_y, dest_x, dest_y, width, height) end

---Change the type or size of a userdata.
---
---When changing data type, only integer types can be used.
---
---The total data size given by the new data type and dimensions must be the same as or smaller than the old one.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_mutate)
---@param data_type string u8, i16, i32, i64, or f64
---@param width number?
---@param height number?
function Userdata:mutate(data_type, width, height) end

---Linearly interpolate between two elements of a userdata.
---
---Multiple lerps can be performed at once using num_lerps, and lerp_stride. lerp_stride is added to offset after each lerp.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_lerp)
---@param offset number? offset is the flat index to start from (default: 0)
---@param len number? len is the length of the lerp, including the end element but not the start element
---@param el_stride number? el_stride is the distance between elements (default: 1)
---@param num_lerps number?
---@param lerp_stride number?
function Userdata:lerp(offset, len, el_stride, num_lerps, lerp_stride) end

---Return a copy of userdata cast as a different type.
---
---When converting to ints, f64 values are flr()'ed and out of range values overflow.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_convert)
function Userdata:convert(data_type, dest) end

---Sort a 2d userdata of any type by the value found in the index column (0 by default).
---
---When descending is true, sort from largest to smallest.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_sort)
---@param index number?
---@param descending boolean?
function Userdata:sort(index, descending) end

--------------------------------------------------------------------------------
-- Userdata Operations
--------------------------------------------------------------------------------

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:add(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:sub(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:mul(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:div(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:idiv(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:mod(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:pow(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---abs(x) for each element (except: int_min -> int_min, not int_max)
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:abs(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---returns -1 for negative values and 1 for positive values and zero
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:sgn(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---returns -1 for negative values and 1 for positive values, and 0 for zero
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:sgn0(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:band(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:bor(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:bxor(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:max(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Applies operator to each element and written to a new userdata. All parameters are optional.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_op)
---@param src Userdata|number?
---@param dest Userdata|boolean?
---@param src_offset number?
---@param dest_offset number?
---@param len number?
---@param src_stride number?
---@param dest_stride number?
---@param spans number?
---@return Userdata
function Userdata:min(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

---Equivalent to :add(0, ...) when src is nil
---
---When :copy is given a table as the first argument (after self), it is taken to be a lookup table into that userdata for the start of each span.
---
---This form will be **deprecated in 0.1.2** -- use :take() instead with the same parameters.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_copy)
---@param idx Userdata|number?
---@param dest Userdata|boolean?
---@param idx_offset number?
---@param dest_offset number?
---@param len number?
---@param idx_stride number?
---@param dest_stride number?
function Userdata:copy(idx, dest, idx_offset, dest_offset, len, idx_stride, dest_stride) end

---Take values from the userdata at locations specified by idx.
---
---By default, the userdata returned by :take is the same shape as idx.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_take)
---@param idx Userdata|number?
---@param dest Userdata|boolean?
---@param idx_offset number?
---@param dest_offset number?
---@param len number?
---@param idx_stride number?
---@param dest_stride number?
function Userdata:take(idx, dest, idx_offset, dest_offset, len, idx_stride, dest_stride) end

--------------------------------------------------------------------------------
-- Matrics and Vectors
--------------------------------------------------------------------------------

---Multiply two matrixes together. matmul is part of the userdata metatable, so it can also be called using the equivalent form: `m0:matmul(m1)`.
---
---When m_out is given, the output is written to that userdata. Otherwise a new userdata is created of width `m1:width()` and height `m0:height()`.
---
---As per standard matrix multiplication rules, the width of m0 and the height of m1 must match -- otherwise no result is returned.
---
---> In version 0.1.1d, matmul() can not be called directly, use Userdata:matmul() instead.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#matmul)
---@param m0 Userdata|number
---@param m1 Userdata|number
---@param m_out any?
---@return Userdata
function matmul(m0, m1, m_out) end

Userdata.matmul = matmul

---For 2d 4x4 transformation matrices, matmul2d can be used.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#matmul)
---@param m0 Userdata|number
---@param m1 Userdata|number
---@param m_out any?
---@return Userdata
function matmul2d(m0, m1, m_out) end

Userdata.matmul2d = matmul2d

---For 3d 4x4 transformation matrices, matmul3d can be used.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#matmul3d)
---@param m0 Userdata|number
---@param m1 Userdata|number
---@param m_out any?
---@return Userdata
function matmul3d(m0, m1, m_out) end

Userdata.matmul3d = matmul3d

---Transpose any type of matrices
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#Matrix_methods)
---@param m_out any?
---@return Userdata
function transpose(m_out) end

--------------------------------------------------------------------------------
--- Userdata Memory Functions
--------------------------------------------------------------------------------

---Map the contents of an integer-type userdata to ram.
---
---addr is the starting memory address, which must be in 4k increments (i.e. end in 000 in hex).
---
---Userdata does not need to be sized to fit 4k boundaries, with one exception: addresses below 0x10000 must always be fully mapped, and memmap calls that break that rule return with no effect.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#memmap)
---@param ud Userdata
---@param addr number
function memmap(ud, addr) end

---Unmap userdata from ram. When an address is given, only the mapping at that address is removed. This is relevant only when there are multiple mappings of the same userdata to different parts of memory.
---
---`unmap(ud)` is needed in order for a userdata to be garbage collected, as mapping it to ram counts as an object reference. Overwriting mappings with memmap() is not sufficient to release the reference to the original userdata.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#memunmap)
---@param ud Userdata
---@param addr number?
function memunmap(ud, addr) end

---read from ram into an integer-typed userdata.
---
---addr is the address to peek
---
---offset is the userdata element to start from (flattened 1d index), and len is the number of elements to peek.
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_peek)
---@param addr number
---@param offset number?
---@param elements any?
function Userdata:peek(addr, offset, elements) end

---write from ram into an integer-typed userdata.
---
---addr is the address to poke
---
---offset is the userdata element to start from (flattened 1d index), and len is the number of elements to poke.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_poke)
---@param addr number
---@param offset number?
---@param elements any?
function Userdata:poke(addr, offset, elements) end

--------------------------------------------------------------------------------
--- Batch GFX Operations
--------------------------------------------------------------------------------

---A userdata can be used to represent lists of arguments to be passed to gfx functions, so that multiple draws can be made with only the overhead of a single function call.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#gfx_func)
---
---@param p Userdata p is the f64 userdata -- normally 2d with a row for each call
---@param offset number? offset is the flat offset into the userdata for the first call. Default: 0
---@param num number? num is the number of gfx calls to make. Default: p:height()
---@param num_params number? params is the number of parameters to pass to the gfx function. Default: p:width()
---@param stride number? stride is the number of elements to jump after each call. Default: p:width()
function pset(p, offset, num, num_params, stride) end

---A userdata can be used to represent lists of arguments to be passed to gfx functions, so that multiple draws can be made with only the overhead of a single function call.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#gfx_func)
---
---@param p Userdata p is the f64 userdata -- normally 2d with a row for each call
---@param offset number? offset is the flat offset into the userdata for the first call. Default: 0
---@param num number? num is the number of gfx calls to make. Default: p:height()
---@param num_params number? params is the number of parameters to pass to the gfx function. Default: p:width()
---@param stride number? stride is the number of elements to jump after each call. Default: p:width()
function circfill(p, offset, num, num_params, stride) end

---A userdata can be used to represent lists of arguments to be passed to gfx functions, so that multiple draws can be made with only the overhead of a single function call.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#gfx_func)
---
---@param p Userdata p is the f64 userdata -- normally 2d with a row for each call
---@param offset number? offset is the flat offset into the userdata for the first call. Default: 0
---@param num number? num is the number of gfx calls to make. Default: p:height()
---@param num_params number? params is the number of parameters to pass to the gfx function. Default: p:width()
---@param stride number? stride is the number of elements to jump after each call. Default: p:width()
function rectfill(p, offset, num, num_params, stride) end

---A userdata can be used to represent lists of arguments to be passed to gfx functions, so that multiple draws can be made with only the overhead of a single function call.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#gfx_func)
---
---@param p Userdata p is the f64 userdata -- normally 2d with a row for each call
---@param offset number? offset is the flat offset into the userdata for the first call. Default: 0
---@param num number? num is the number of gfx calls to make. Default: p:height()
---@param num_params number? params is the number of parameters to pass to the gfx function. Default: p:width()
---@param stride number? stride is the number of elements to jump after each call. Default: p:width()
function tline3d(p, offset, num, num_params, stride) end

---A userdata can be used to represent lists of arguments to be passed to gfx functions, so that multiple draws can be made with only the overhead of a single function call.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#gfx_func)
---
---@param p Userdata p is the f64 userdata -- normally 2d with a row for each call
---@param offset number? offset is the flat offset into the userdata for the first call. Default: 0
---@param num number? num is the number of gfx calls to make. Default: p:height()
---@param num_params number? params is the number of parameters to pass to the gfx function. Default: p:width()
---@param stride number? stride is the number of elements to jump after each call. Default: p:width()
function spr(p, offset, num, num_params, stride) end

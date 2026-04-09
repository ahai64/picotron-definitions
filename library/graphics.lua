--- @meta

---sets the clipping rectangle in pixels.
---
---all drawing operations will be clipped to the rectangle at x, y with a width and height of w,h.
---
---clip() to reset.
---
---when clip_previous is true, clip the new clipping region by the old one.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#clip)
---@param  x number
---@param y number
---@param w number
---@param h number
---@param clip_previous boolean?
function clip(x, y, w, h, clip_previous) end

---sets the clipping rectangle in pixels.
---
---all drawing operations will be clipped to the rectangle at x, y with a width and height of w,h.
---
---clip() to reset.
---
---when clip_previous is true, clip the new clipping region by the old one.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#clip)
function clip() end

---sets the pixel at x, y to colour index col (0..63).
---
---when col is not specified, the current draw colour is used.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#pset)
---@param x number
---@param y number
---@param col number?
function pset(x, y, col) end

---returns the colour of a pixel on the screen at (x, y).
---
---when x and y are out of bounds, pget returns 0.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#pget)
---@param x number
---@param y number
---@return number
function pget(x, y) end

---set the value (val) of sprite n's flag f.
---
---the initial state of flags 0..7 are settable in the sprite editor, so can be used to create custom sprite attributes.
---
---it is also possible to draw only a subset of map tiles by providing a mask in @map().
---
---when f is omitted, all flags are retrieved/set as a single bitfield.
---
---```
---fset(2, 1 | 2 | 8) -- sets bits 0,1 and 3
---fset(2, 4, true)   -- sets bit 4
---print(fget(2))     -- 27 (1 | 2 | 8 | 16)
---```
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#fset)
---@param n number
---@param f number? -- flag index 0..7
---@param val boolean
function fset(n, f, val) end

---get the value of sprite n's flag f.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#fget)
---@param n number
---@param f number? -- flag index 0..7
function fget(n, f) end

---print a string str and optionally set the draw colour to col.
---
---shortcut: written on a single line, ? can be used to call print without brackets: `?"hi"`
---
---when x, y are not specified, a newline is automatically appended. this can be omitted by ending the string with an explicit termination control character
---
---print returns the right-most x position and lowest y position that occurred while printing, relative to the camera position. This can be used to find out the width of some text by printing it off-screen
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#print)
---@param str any
---@param x number
---@param y number
---@param col number?
---@return number
function print(str, x, y, col) end

---print a string str and optionally set the draw colour to col.
---
---shortcut: written on a single line, ? can be used to call print without brackets: `?"hi"`
---
---when x, y are not specified, a newline is automatically appended. this can be omitted by ending the string with an explicit termination control character
---
---print returns the right-most x position and lowest y position that occurred while printing, relative to the camera position. This can be used to find out the width of some text by printing it off-screen
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#print)
---@param str any
---@param col number?
---@return number
function print(str, col) end

---set the cursor position.
---
---if col is specified, also set the current colour.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#cursor)
---@param x number
---@param y number
---@param col number?
function cursor(x, y, col) end

---set the current colour to be used by shape drawing functions (pset, circ, rect..), when one is not given as the last argument.
---
---if col is not specified, the current colour is set to 6.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#color)
---@param col number?
function color(col) end

---clear the screen and reset the clipping rectangle.
---
---col defaults to 0 (black)
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#cls)
---@param col number?
function cls(col) end

---set a screen offset of -x, -y for all drawing operations
---
---camera() to reset
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#camera)
---@param x number?
---@param y number?
function camera(x, y) end

---draw a circle at x,y with radius r
---
---if r is negative, the circle is not drawn.
---
---When bit 0x800000000 in col is set, circfill draws inverted (everything outside the circle is drawn).
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#circ)
---@param x number
---@param y number
---@param r number
---@param col number?
function circ(x, y, r, col) end

---draw a filled circle at x,y with radius r
---
---if r is negative, the circle is not drawn.
---
---When bit 0x800000000 in col is set, circfill draws inverted (everything outside the circle is drawn).
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#circfill)
---@param x number
---@param y number
---@param r number
---@param col number?
function circfill(x, y, r, col) end

---draw an oval that is symmetrical in x and y (an ellipse), with the given bounding rectangle.
---
---When bit 0x800000000 in col is set, ovalfill is drawn inverted.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#oval)
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param col number?
function oval(x0, y0, x1, y1, col) end

---draw an filled oval that is symmetrical in x and y (an ellipse), with the given bounding rectangle.
---
---When bit 0x800000000 in col is set, ovalfill is drawn inverted.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#ovalfill)
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param col number?
function ovalfill(x0, y0, x1, y1, col) end

---draw a line from (x0, y0) to (x1, y1)
---
---if (x1, y1) are not given, the end of the last drawn line is used.
---
---line() with no parameters means that the next call to line(x1, y1) will only set the end points without drawing.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#line)
---@param x0 number
---@param y0 number
---@param x1 number?
---@param y1 number?
---@param col number?
function line(x0, y0, x1, y1, col) end

---draw a rectangle or filled rectangle with corners at (x0, y0), (x1, y1).
---
---When bit 0x800000000 in col is set, rectfill draws inverted.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#rect)
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param col number?
function rect(x0, y0, x1, y1, col) end

---draw a filled rectangle or filled rectangle with corners at (x0, y0), (x1, y1).
---
---When bit 0x800000000 in col is set, rectfill draws inverted.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#rectfill)
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param col number?
function rectfill(x0, y0, x1, y1, col) end

---draw a rounded rectangle.
---
---Width and height are in pixels, and must both be more than 0 for the shape to be drawn.
---
---Radius defaults 0, and is the size of the quarter-circle to be drawn at each corner.
---
---The radius used is clamped to fall the range 0 .. min(width,height)/2.
---
---When bit 0x800000000 in col is set, rrectfill draws inverted.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#rrect)
---@param x number
---@param y number
---@param width number
---@param height number
---@param radius number
---@param col number?
function rrect(x, y, width, height, radius, col) end

---draw a filled rectangle with rounded corners.
---
---Width and height are in pixels, and must both be more than 0 for the shape to be drawn.
---
---Radius defaults 0, and is the size of the quarter-circle to be drawn at each corner.
---
---The radius used is clamped to fall the range 0 .. min(width,height)/2.
---
---When bit 0x800000000 in col is set, rrectfill draws inverted.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#rrectfill)
---@param x number
---@param y number
---@param width number
---@param height number
---@param radius number
---@param col number?
function rrectfill(x, y, width, height, radius, col) end

---pal() swaps colour c0 for c1 for one of three palette re-mappings (p defaults to 0):
---
---0: draw palette
---
---The draw palette re-maps colours when they are drawn.
---
---Changing the draw palette does not affect anything that was already drawn to the screen.
---
---1: display palette
---
---The display palette re-maps the whole screen when it is displayed at the end of a frame.
---
---2: RGB display palette
---
---The raw red, green, blue values that are finally displayed for a given colour index.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#pal)
---@param c0 number
---@param c1 number
---@param p number?
function pal(c0, c1, p) end

---Set transparency for colour index c to is_transparent (boolean) transparency is observed by spr(), sspr(), map() and tline3d()
---```
---palt(8, true) -- red pixels not drawn in subsequent sprite/tline draw calls
---```
---When c is the only parameter, it is treated as a bitfield used to set all 64 values. for example: to set colours 0 and 1 as transparent:
---```
---palt(0x13) -- set colours 0,1 and 4 as transparent
---```
---palt() resets to default: all colours opaque except colour 0. Same as palt(1)
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#palt)
---@param c? number
---@param is_transparent? boolean
function palt(c, is_transparent) end

---Draw sprite s at position x,y
---
---s can be either a userdata (type "u8" -- see Userdata) or sprite index (0..255 for bank 0 (gfx/0.gfx), 256..511 for bank 1 (gfx/1.gfx) etc).
---
---Colour 0 drawn as transparent by default (see palt())
---
---When flip_x is true, flip horizontally. When flip_y is true, flip vertically.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#spr)
---@param s number
---@param x number
---@param y number
---@param flip_x boolean?
---@param flip_y boolean?
function spr(s, x, y, flip_x, flip_y) end

---Stretch a source rectangle of sprite s (sx, sy, sw, sh) to a destination rectangle on the screen (dx, dy, dw, dh).
---
---In both cases, the x and y values are coordinates (in pixels) of the rectangle's top left corner, with a width of w, h.
---
---s can be either a userdata (type "u8") or the sprite index.
---
---Colour 0 drawn as transparent by default (see palt())
---
---dw, dh defaults to sw, sh.
---
---When flip_x is true, flip horizontally. When flip_y is true, flip vertically.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#sspr)
---@param s number
---@param sx number
---@param sy number
---@param sw number
---@param sh number
---@param dx number
---@param dy number
---@param dw number?
---@param dh number?
---@param flip_x number?
---@param flip_y number?
function sspr(s, sx, sy, sw, sh, dx, dy, dw, dh, flip_x, flip_y) end

---Get the sprite (a 2d userdata object of type "u8") for a given index (0..16383).
---
---When a cartridge is run, files in gfx/ that start with an integer (0..63) are automatically loaded if they exist.
---
---Each file has 256 sprites indexes, so the sprites in gfx/0.gfx are given indexes 0..255, the sprites in gfx/1.gfx are given indexes 256..511, and so on up to gfx/63.gfx (16128..16383).
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#get_spr)
---@param index number
---@return Userdata
function get_spr(index) end

---Set the sprite (a 2d userdata object of type "u8") for a given index (0..16383).
---
---When a cartridge is run, files in gfx/ that start with an integer (0..63) are automatically loaded if they exist.
---
---Each file has 256 sprites indexes, so the sprites in gfx/0.gfx are given indexes 0..255, the sprites in gfx/1.gfx are given indexes 256..511, and so on up to gfx/63.gfx (16128..16383).
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#set_spr)
---@param index number
---@param userdata Userdata
function set_spr(index, userdata) end

---Set a 4x4 fill pattern using PICO-8 style fill patterns. p is a bitfield in reading order starting from the highest bit.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#fillp)
---@param p any
function fillp(p) end

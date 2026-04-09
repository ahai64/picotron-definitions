---@meta

---Returns the current display as a u8, 2d userdata.
---
---There is no way to set the display userdata directly;
---
---it can be resized using the window() function.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#get_display)
function get_display() end

---Set the draw target to ud, which must be a u8, 2d userdata.
---
---When ud is not given, set_draw_target() defaults to the current display.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#set_draw_target)
---@param ud Userdata
function set_draw_target(ud) end

---get the current draw target, which is a u8, 2d userdata.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#get_draw_target)
---@return Userdata
function get_draw_target() end

---@class Window
---@field x? number                --  x position in pixels
---@field y? number                --  y position in pixels
---@field dx? number               --  x-offset to move the window
---@field dy? number               --  y-offset to move the window
---@field z? number                --  windows with higher z are drawn on top. Defaults to 0
---@field width? number            --  width in pixels (not including the frame)
---@field height? number           --  height in pixels
---@field title? string            --  set a title displayed on the window's titlebar
---@field pauseable? boolean       --  false to turn off the app menu that normally comes up with ENTER
---@field tabbed? boolean          --  true to open in a tabbed workspace (like the code editor)
---@field has_frame? boolean       --  default: true
---@field moveable? boolean        --  default: true
---@field resizeable? boolean      --  default: true
---@field wallpaper? boolean       --  act as a wallpaper (z defaults to -1000 in that case)
---@field autoclose? boolean       --  close window when is no longer in focus or when press escape
---@field cursor? number|userdata  --  0 for no cursor, 1 for default, or a userdata for a custom cursor

---Create a window and/or set the window's attributes.
---
---attribs is table of desired attributes for the window.
---```
---x                   --  x position in pixels
---y                   --  y position in pixels
---z                   --  windows with higher z are drawn on top. Defaults to 0
---width               --  width in pixels (not including the frame)
---height              --  height in pixels
---title               --  set a title displayed on the window's titlebar
---pauseable           --  false to turn off the app menu that normally comes up with ENTER
---tabbed              --  true to open in a tabbed workspace (like the code editor)
---has_frame           --  default: true
---moveable            --  default: true
---resizeable          --  default: true
---wallpaper           --  act as a wallpaper (z defaults to -1000 in that case)
---autoclose           --  close window when is no longer in focus or when press escape
---cursor              --  0 for no cursor, 1 for default, or a userdata for a custom cursor
---squashable          --  window resizes itself to stay within the desktop region
---observe_drag_offset -- indicates that when items are dropped, their .xo,.yo is used
---background_updates  -- allow _update() callbacks when parent window is not visible
---background_draws    -- allow _draw() callbacks when parent window is not visible
---```
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#window)
---@param attribs Window
function window(attribs) end

---Create a window and/or set the window's attributes.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#window)
---@param width number
---@param height number
function window(width, height) end

---Set a fullscreen video mode. Currently supported modes:
---- vid(0): 480x270
---- vid(1): 320x180
---- vid(2): 240x180
---- vid(3): 240x135
---- vid(4): 160x90
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#vid)
---@param video_mode number
function vid(video_mode) end

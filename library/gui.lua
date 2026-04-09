---@meta

---A GUI in Picotron is a tree of tables ("gui elements"), where each element has some basic attributes like size and position, along with optional callbacks for responding to events like clicking and dragging.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#GUIs)
---@class GUI
---@field x number top left position relative to parent
---@field y number top left position relative to parent
---@field width number width of the element in pixels
---@field height number height of the element in pixels
---@field sx number evaluated position relative to window (normally not used in userland programs)
---@field sy number evaluated position relative to window (normally not used in userland programs)
---@field width_rel number? width relative to parent (1.0 to match)
---@field height_rel number? height relative to parent (1.0 to match)
---@field justify string? horizontal justification: "left" "center" "right"
---@field vjustify string? vertical justification: "top" "center" "bottom"
---@field hidden boolean? self and children are not drawn and not interactive
---@field ghost boolean? drawn but not interactive
---@field min_width number? clamp element width to be no smaller that this value in pixels
---@field min_height number? clamp element height to be no smaller that this value in pixels
---@field clip_to_parent boolean? clip drawing and interaction to the parent's region
---@field confine_to_parent boolean? force the position of the element inside parent with no overlaps
---@field confine_to_clip boolean? force the position of the element inside clip rect with no overlaps
---@field squash_to_parent boolean? automatically adjust size of element to remain inside parent region
---@field squash_to_clip boolean? automatically adjust size of element to remain inside clipping region
local GUI = {}

---Returns a root gui element.
---
---The root element is the same as any other gui element, with the addition of two special methods:
---
---draw_all() and update_all(), that are normally called oncer per frame from _draw and _update.
---
---The root element can be expanded into a tree by using gui_el:attach() to add child elements.
---@param attribs any?
---@return GUI
function create_gui(attribs) end

---Attaches an element (el) to the given gui_el, and returns the newly attached element.
---
---el is a table that should have (at least) x, y, width and height attributes.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#gui_el_attach)
---@param el table
---@return GUI
function GUI:attach(el) end

---Remove self from the parent's list of child elements.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#gui_el_detach)
function GUI:detach() end

---Remove a particular child from the element.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#gui_el_detach)
function GUI:detach(child) end

---el should have .x and .y and optionally any of the following attributes:
---
---- label   the text on the button
---- fgcol   foreground colours
---- bgcol   background colours
---- border  border colours
---
---Colours are 16-bit values, where the high 8 bits are used when has_pointer.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#gui_el_attach_button)
---@param el table
function GUI:attach_button(el) end

---gui_el is expected to be a "container" element that has a single child (the "contents").
---
---A vertical scrollbar will appended to the container element with the following attributes:
---
---- bgcol     background colour (high 8 bits used when has_pointer)
---- fgcol     foreground colour
---- autohide  when true, the bar disappears when there is nothing to scroll
---
---attach_scrollbars() also attaches a mousewheel event handler to the container element that allows the contents to be scrolled vertically and horizontally (hold ctrl).
---
---Currently there is no option to add a visual horizontal scrollbar.
---
---Scrolling is achieved by modifying contents.x and contents.y. These values are clamped by the scrollbar's update callback so that the contents never scrolls out of view.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#gui_el_attach_scrollbars)
---@param attribs table
function GUI:attach_scrollbars(attribs) end

--- Create a pulldown menu with a list items, that closes when an item is selected.
---
--- The height is automatically determined by the number of items.
---
--- pulldown attributes: onclose a function that is called when the pulldown is dismissed
---
--- pulldown item attributes, also used by menus created with menuitem below:
---
---- label The main item text shortcut
---- Text on the right showing a keyboard shortcut (e.g. "CTRL-A")
---- stay_open When true, the pulldown does not automatically close on selection
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#gui_el_attach_pulldown)
---@param attribs table
function GUI:attach_pulldown(attribs) end

function GUI:draw_all() end

function GUI:update_all() end

---@class TestEditor
---@field show_line_numbers boolean?     show_line_numbers
---@field embed_pods boolean?            render images
---@field syntax_highlighting boolean?   syntax_highlighting
---@field show_tabs boolean?
---@field max_lines number?              maximum lines of text allowed
---@field has_search boolean?            ctrl+f brings up a search box
---@field bgcol number?                  background colour
---@field fgcol number?                  foreground
---@field curcol number?                 cursor colour (default: 14)
---@field selcol number?                 selection colour (default: 10)
---@field lncol number?                  line numbers background (default:16)
---@field block_scrolling boolean?       when true, do not scroll
---@field key_callback table?            per-key callbacks e,g, {enter=function() end, tab=function() end}
---@field text_callback table?           similar, but for textinput events, e.g. {[" "] = function() end}
---@field margin_top number?             pixels at top (default: 3)
---@field margin_left number?            pixels at left (default: 4)
local TestEditor = {}

---Return a text editor.
---
---This is a general purpose element that can used used for single-line text fields, and large multi-line texts.
---
---Both the bundled code editor and notepad.p64 both use this element to do most of the work.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#gui_attach_text_editor)
--- @param el table
function GUI:attach_text_editor(el) end

---Text is returned as a table of strings (one for each line), which is how it is stored internally.
---
---To get the text as a single string: table.concat(el:get_text(), "\n")
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#text_editor_get_text)
---@return table
function TestEditor:get_text() end

---Set the text of the editor, as a table of strings (one for each line).
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#text_editor_set_text)
---@param str_tbl table
function TestEditor:set_text(str_tbl) end

---Get the cursor position
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#text_editor_get_cursor)
---@return number x The x-coordinate of the cursor.
---@return number y The y-coordinate of the cursor.
function TestEditor:get_cursor() end

---Set the cursor position.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#text_editor_set_cursor)
---@param cur_x number The x-coordinate of the cursor.
---@param cur_y number The y-coordinate of the cursor.
function TestEditor:set_cursor(cur_x, cur_y) end

---Add a custom menu item to the app menu. This works for both fullscreen and windowed apps.
---
---attribs is a table that extends the attributes used by attach_pulldown_
---
---- `id`         an identifying string used to update a particular menu item
---- `label`      a string, or a function returning the string shown to the user
---- `shortcut`   an optional shortcut to invoke that item (e.g. CTRL-C to copy)
---- `action`     a function that is called when the user selects that item
---- `stay_open`  when true, the pulldown / pause menu does not close on selection
---- `divider`    when true, a single non-interactive divider item is added
---
---Shortcuts in the form "CTRL-A".."CTRL-Z" and "CTRL-0".."CTRL-9" automatically
---
---To clear the app menu, use menuitem() with no parameters.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#menuitem)
---@param attribs table
function menuitem(attribs) end

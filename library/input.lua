---@meta

---Returns the state of button b for player index pl  (default 0 -- means Player 1)
---```
---0 1 2 3     LEFT RIGHT UP DOWN
---4 5         Buttons: O X
---6           MENU
---7           reserved
---8 9 10 11   Secondary Stick L,R,U,D
---12 13       Buttons (not named yet!)
---14 15       SL SR
---```
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#btn)
---@param b number? -- 0~15
---@param pl number? -- default 0 -- means Player 1
---@return boolean|number
function btn(b, pl) end

---btnp returns true when a button is down and it was not down the last frame.
---
---It also repeats after 30 frames, returning true every 8 frames after that.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#btnp)
---@param b number? -- 0~15
---@param pl number? -- default 0 -- means Player 1
---@return boolean|number
function btnp(b, pl) end

---returns the state of key k
---
---key() uses the local keyboard layout by default.
---
---To get the raw layout, use true as the second parameter to indicate that k should be the name of the raw scancode.
---
---key() with no parameters return true when any key is pressed.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#key)
---@param k string?
---@param raw boolean?
---@return boolean
function key(k, raw) end

---keyp() has the same behaviour key(), but true when the key is pressed or repeating.
---
---keyp() uses the local keyboard layout by default.
---
---To get the raw layout, use true as the second parameter to indicate that k should be the name of the raw scancode.
---
---keyp() with no parameters return true when any key is pressed.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#keyp)
---@param k string?
---@param raw boolean?
---@return boolean
function keyp(k, raw) end

---To read text from the keyboard via the host operating system's text entry system.
---
---peektext() can be used to find out if there is some text waiting.
---
---and readtext() can be used to consume the next piece of text:
---```
---while (peektext())
---  c = readtext()
---  printh("read text: "..c)
---end
---```
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#peektext)
---@return string
function peektext() end

---To read text from the keyboard via the host operating system's text entry system.
---
---peektext() can be used to find out if there is some text waiting.
---
---and readtext() can be used to consume the next piece of text:
---```
---while (peektext())
---  c = readtext()
---  printh("read text: "..c)
---end
---```
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#readtext)
---@param clear boolean?
---@return string
function readtext(clear) end

---Returns mouse_x, mouse_y, mouse_b, wheel_x, wheel_y
---
---mouse_b is a bitfield: 0x1 means left mouse button, 0x2 right mouse button
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#mouse)
---@return number mouse_x, number mouse_y, number mouse_b, number wheel_x, number wheel_y
function mouse() end

---when lock is true, Picotron makes a request to the host operating system's window manager to capture the mouse, allowing it to control sensitivity and movement speed.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#mouselock)
---@param lock boolean
---@param event_sensitivity number -- 0~4, determines how fast dx, dy change (1.0 means once per picotron pixel)
---@param move_sensitivity number -- 0~4, 1.0 means the cursor continues to move at the same speed.
---@return number dx,number dy -- the relative position since the last frame
function mouselock(lock, event_sensitivity, move_sensitivity) end

---The input function allows terminal programs to be interactive. Execution of the program is blocked until the user enters a response.
---
---prompt is a string that is shown to the left of user input. It defaults to "? ".
---
---flags:
---- 0x1 hide the prompt once input() has returned
---- 0x2 complete the input when a single character is given (do not wait for enter)
---- 0x4 do not block -- return nil when there is no response that frame
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#input)
---@param prompt string
---@param flags number?
function input(prompt, flags) end

---@meta

---print a string to the host operating system's console for debugging.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#printh)
---@param str any
function printh(str) end

---Returns a table of environment variables given to the process at the time of creation.
---
---view contents of env(): `?pod(env())`
---
---The contents of the environment never change during a program's lifetime.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#env)
---@return table
function env() end

---Cause a crash showing description (a string) at the top of the stack trace.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#error)
---@param description string?
function error(description) end

---Halt the program and print a message to terminal.
---
---This is meant to be used during development, when running the present working cart with ctrl-r.
---
---Unlike error, stop() does not cause a crash but simply suspends the program.
---
---It can still be resumed from terminal ("> resume") when it is the present working cartridge.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#stop)
---@param message any?
function stop(message) end

---Immediately end the program. This can be used to terminate a terminal program early.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#exit)
function exit() end

---if condition is false, stop the program and print message if it is given.
---
---this can be useful for debugging cartridges, by assert()'ing that things that you expect to be true are indeed true.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#assert)
---@param condition any
---@param message any?
function assert(condition, message) end

---Returns the number of seconds elapsed since the cartridge was run.
---
---This is not the real-world time, but is calculated by counting the number of times _update60 is called.
---
---multiple calls of time() from the same frame return the same result.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#time)
---@return number
function time() end

---Returns the number of seconds elapsed since the cartridge was run.
---
---This is not the real-world time, but is calculated by counting the number of times _update60 is called.
---
---multiple calls of time() from the same frame return the same result.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#time)
---@return number
function t() end

---Returns the current day and time formatted using Lua's standard date strings.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#date)
---@param format string -- specifies the output string format, and defaults to "!%Y-%m-%d %H:%M:%S" (UTC) when not given.
---@param t string -- specifies the moment in time to be encoded as a string
---@param delta number --  number of seconds to add to t.
---@return string
function date(format, t, delta) end

---Read the contents of the clipboard.
---
---The value is always a single plaintext string;
---
---to copy structured objects to the clipboard, use pod() and unpod() to decode them.
---
---Note that plaintext format must be used, so use flags 0x0 or 0x7 with pod()
---
---For security reasons, get_clipboard() only has access to the host clipboard after ctrl-v is pressed while Picotron is active.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#get_clipboard)
---@return string
function get_clipboard() end

---Write the contents of the clipboard.
---
---The value is always a single string;
---
---to copy structured objects to the clipboard, use pod() and unpod() to decode them.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#set_clipboard)
---@param text string
function set_clipboard(text) end

---Get system status where x is:
---
---```text
--- 0  memory usage(triggers a garbage collection)
--- 1  cpu usage(try to stay under ~0.9 to maintain 60fps)
--- 2  reserved
--- 3  raw memory usage(no GC, so value jumps around)
--- 5  runtime, system version
--- 7  operating fps (60,30,20,15)
--- 64  user id of the currently logged in user (unique and doesn't change)
--- 65  username of the currently logged in user (might change over time)
--- 86  epoch time
--- 87  timezone delta in seconds
--- 101  web: player cart id (when playing a bbs cart; nil otherwise)
--- 150  web: window.location.href
--- 151  web: stat(150) up to the end of the window.location.pathname
--- 152  web: window.location.host
--- 153  web: window.location.hash
---```
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#stat)
---@param x number
---@return any
function stat(x) end

---Create a new process running the program at prog_path.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#create_process)
---@param prog_path string the name of the program to run; either a cartridge (.p64) or .lua file
---@param env table? optional, a table that is added to the program's environment, accessible from env()
---@return number
function create_process(prog_path, env) end

---Install a collection of callbacks and menu items to support a standard pattern of loading and saving files.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#wrangle_working_file)
---@param options table
function wrangle_working_file(options) end

---Open a location using /system/util/open.lua
---
---location is a string, and can be relative to the present working directory.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#open)
---@param location string can be relative to the present working directory
function open(location) end

---Open a file chooser.
---
---In its simplest form, chooser() allows the user to choose one or more existing files and folders,
---
---as if they were dragged and dropped from filenav into the application's window.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#chooser)
---@param options table? a table containing path, intention, title, verb and prompt(all optional)
---@param handler function? a function that handles the response
function chooser(options, handler) end

---Send a message to process proc_id.
---
---msg is a table that should include at least an "event" field that is used to identify a matching event handler in the receiving process (see on_event).
---
---When reply is true, send_message blocks until the process responds with a reply.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#send_message)
---@param proc_id number
---@param msg table
---@param reply boolean?
function send_message(proc_id, msg, reply) end

---Create an event handler for the current process.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#on_event)
---@param event string a string that matches the event field of the message
---@param func function a function that handles the message
function on_event(event, func) end

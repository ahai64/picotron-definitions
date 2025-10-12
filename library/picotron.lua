---@meta

--------------------------------------------------------------------------------
-- Main Loop
--------------------------------------------------------------------------------

---called once just before the main loop
function _init() end

---called 60 times per second
function _update() end

---called each time the window manager asks for a frame
---normally 60, 30 or 20 times per second
function _draw() end

--------------------------------------------------------------------------------
-- OS library functions
--------------------------------------------------------------------------------

---@param path string
---@param options? {
---  argv: string[],
---}
function create_process(path, options) end

function notify(str) end

function send_message(num, tbl) end

function tostr(var) end

--------------------------------------------------------------------------------
-- Variables
--------------------------------------------------------------------------------

_ENV = {}

---@class metadata
metadata = {}

---@class delta
delta = {}

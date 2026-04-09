---@meta

---store a lua object (tables, strings, userdata, booleans and numbers are allowed) as a file.
---
---filenames can contain alphanumeric characters, "_", "-" and "."
---
---When metadata is given, each field is added to the file's metadata without clobbering any existing fields.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#store)
---@param filename string
---@param obj any
---@param metadata metadata?
function store(filename, obj, metadata) end

---Return a lua object stored in a given file. Returns the object and metadata.
---
---options is a table with fields for http requests
---
---- on_complete: a function that is called when the fetch is complete (means that fetch is not blocking)
---- method: can be "get", "post", "put" (defaults to "get")
---- headers: a table of strings send as headers
---- body: the body of the request
---- raw_str: when true, the raw contents of the host file is returned as a string
---- argb: when true, png files are returned as "u32" userdata of argb pixel values
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#fetch)
---@param filename string
---@param options table?
---@return any,metadata
function fetch(filename, options) end

---Store just the metadata fork of a file or directory. This can be faster in some cases.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#store_metadata)
---@param filename string
---@param metadata metadata
function store_metadata(filename, metadata) end

---Fetch just the metadata fork of a file or directory. This can be faster in some cases.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#fetch_metadata)
---@param filename string
---@return metadata
function fetch_metadata(filename) end

---Create a directory
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#mkdir)
---@param name any
function mkdir(name) end

---list files and folders in given path relative to the current directory.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#ls)
---@param path any?
function ls(path) end

---Copy a file from src to dest. Folders are copied recursively, and dest is overwritten.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#cp)
---@param src any
---@param dest any
function cp(src, dest) end

---Move a file from src to dest. Folders are moved recursively, and dest is overwritten.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#mv)
---@param src any
---@param dest any
function mv(src, dest) end

---Delete a file or folder (recursive).
---
---Mount points are also deleted, but the contents of their origin folder are not deleted unless explicitly given as a parameter to rm.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#rm)
function rm(filename) end

---Return the present working directory.
---
---Relative filenames (that do not start with "/") all resolve relative to this path.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#pwd)
function pwd() end

---Change directory.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#cd)
function cd() end

---Resolve a filename to its canonical path based on the present working directory (pwd()).
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#fullpath)
function fullpath(filename) end

---returns 3 attributes of given filename (if it exists)
---- string: "file" or "folder"
---- number: size of file
---- string: origin of path
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#fstat)
---@param filename any
---@return string,number,string -- file or folder, size of file, origin of path
function fstat(filename) end

---Load and run a lua file.
---
---The filename is relative to the present working directory, not the directory that the file was included from.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#include)
---@param filename string
---@return any
function include(filename) end

---@class Location: string
local Location = {}

---Return the path (without the spot).
---@return string
function Location:path() end

---Returns just the spot of a location.
---@return string
function Location:spot() end

---Return the protocol of a location, or nil if it is a local path.
---@return string|nil
function Location:port() end

---Returns the path of the directory the file is inside.
---@return string
function Location:dirname() end

---Returns the file or directory name with its containing directory path and locus omitted.
---@return string
function Location:basename() end

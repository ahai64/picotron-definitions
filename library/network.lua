---@meta

---Sockets allow Picotron to send data to other machines (or local programs) that support the same type of socket;
---
---currently TCP and UDP is supported.
---
---There is currently no web support, but web sockets will be added in the future.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#Sockets)
---@class Socket
local Socket = {}

---Create a socket.
---
---addr is a string consisting of the protocol (tcp:// or udp://), the ip address, followed by a port number ":1234".
---
---ipv6 addresses should be enclosed in square brackets.
---
---For example:
---```
---sock = socket("tcp://example.com:80")
---sock:write("GET / HTTP/1.1\r\nHost: example.com\r\nConnection: close\r\n\r\n")
---?sock:read()
---```
---To create a socket that listens to any incoming traffic on a given port, use * for the address:
---```
---sock = socket("udp://*:8899")
---```
---A socket with remote hosts writing (or connecting to) that port can then be accepted using sock:accept().
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#socket)
function socket(addr) end

---Read a string from a socket.
---
---This function is not blocking; it will return nothing when there is no data available on the socket.
---
---On error, returns nil followed by an error message.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#sock_read)
---@return string|nil
---@return string?
function Socket:read() end

---Write string str to socket.
---
---Returns the number of bytes written (which may be less than #str), or nil followed by an error message string.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#sock_write)
---@param str string
---@return number|nil
---@return string?
function Socket:write(str) end

---Close the connection if there is one.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#sock_close)
function Socket:close() end

---Returns a string describing the sockets status:
---- `ready` means the socket that is ready to read/write
---- `listening` means the socket was created with a wildcard address and ready to :accept() connections
---- `closed` means :close() was called on the socket
---- `disconnected` means the socket was closed by peer, or disconneted for some other reason
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#sock_status)
---@return string
function Socket:status() end

---This can be used with sockets that are listening to all traffic on a given port.
---
---When a new connection is made with TCP, or a UDP message is receieved from a new address+port,
---
---`:accept()` will return a new socket that can be used to communicate with that particular client, or nil if there are none waiting.
---```
---sock2 = listener_socket:accept()
---```
---The remote ip address and port number are stored in the socket table as: sock2.addr and sock2.port.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#sock_accept)
function Socket:accept() end

---Submit a score (when one is given) and return the state of the table.
---
---table_name determines which table to fetch / store to, and is automatically created if it doesn't already exist.
---
---It is a string up to 40 chars long, containing only characters a..z, 0..9 and _.
---
---To fetch the state of the table without submitting a score:
---```
---scoresub("mytable")
---```
---score is a number, and indicates the score entry should be submitted to the server.
---
---extra is an string (cropped to a maximum of 1024 characters) that can optionally be used to store anything related to that score entry, for example a puzzle solution or additional game stats.
---
---scoresub returns a table of up to 64 entry, where each entry is also a table with the fields:
---- user_id  --  a string that uniquely identifies the player
---- username --  the player's username (might change over time)
---- score    --  a number
---- extra --  the extra string
---- icon  --  the 16x16 icon for that player
---
---When attempting to submit a score when there is no user logged in (not stat(64)) or the BBS is not reachable, scoresub returns nil.
---
---In the case where the network is temporarily unavailable (e.g. wifi is off on the host OS), the process will periodically re-attempt to submit the score.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#scoresub)
---@param table_name string
---@param score number?
---@param extra string?
---@return table|nil
function scoresub(table_name, score, extra) end

-- Parsing functions

local astHeadline = require("luaorgparser/ast/headline")

local parser = {}

function parser.parseHeadline(line)
    local newHeadline = astHeadline:new()
    return newHeadline
end

return parser

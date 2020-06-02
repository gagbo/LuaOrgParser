#!/usr/bin/env lua5.1

-- Documentation lives here https://luaunit.readthedocs.io/en/latest/
local parser = require("luaorgparser/parser")

-- Unit testing starts
local lu = require("luaunit")

-- luacheck: globals TestParser
TestParser = {}
function TestParser:testBasicHeadline()
    local headline = "* Level 1"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(result.node_type, "headline")
    lu.assertEquals(result.level, 1)
end

os.exit(lu.LuaUnit.run())

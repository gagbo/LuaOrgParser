#!/usr/bin/env lua5.1
-- Documentation lives here https://luaunit.readthedocs.io/en/latest/

local parser = require("luaorgparser/parser")
local astHeadline = require("luaorgparser/ast/headline")

-- Unit testing starts
local lu = require("luaunit")

-- luacheck: globals TestParser
TestParser = {}
function TestParser:testBasicHeadline()
    local headline = "* Level 1"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(
        result,
        astHeadline:new(
            {
                level = 1,
                title = "Level 1"
            }
        )
    )
end

function TestParser:testDeepLevelHeadline()
    local headline = "***** Level 5"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(
        result,
        astHeadline:new(
            {
                level = 5,
                title = "Level 5"
            }
        )
    )
end

function TestParser:testSingleWordHeadline()
    local headline = "** Single"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(
        result,
        astHeadline:new(
            {
                level = 2,
                title = "Single"
            }
        )
    )
end

function TestParser:testSingleTODOHeadline()
    local headline = "*** TODO This is a todo"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(
        result,
        astHeadline:new(
            {
                level = 3,
                title = "This is a todo",
                todo_keyword = "TODO"
            }
        )
    )
end

function TestParser:testSinglePriorityHeadline()
    local headline = "**** [#A] This is an important item"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(
        result,
        astHeadline:new(
            {
                level = 4,
                title = "This is an important item",
                priority = "A"
            }
        )
    )
end

function TestParser:testSingleTagHeadline()
    local headline = "****** One tag :test:"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(
        result,
        astHeadline:new(
            {
                level = 6,
                title = "One tag",
                tags = {"test"}
            }
        )
    )
end

function TestParser:testEmptyHeadline()
    local headline = "*******"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(
        result,
        astHeadline:new(
            {
                level = 7,
                title = ""
            }
        )
    )
end

function TestParser:testOnlyTagsHeadline()
    local headline = "******** :ARCHIVE:%Paris:"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(
        result,
        astHeadline:new(
            {
                level = 8,
                title = "",
                tags = {"ARCHIVE", "%Paris"}
            }
        )
    )
end

os.exit(lu.LuaUnit.run())

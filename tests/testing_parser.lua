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
    lu.assertEquals(result.title, "Level 1")
    lu.assertEquals(result.priority, nil)
    lu.assertEquals(result.todo_keyword, nil)
    lu.assertEquals(result.tags, nil)
end

function TestParser:testDeepLevelHeadline()
    local headline = "***** Level 5"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(result.node_type, "headline")
    lu.assertEquals(result.level, 5)
    lu.assertEquals(result.title, "Level 5")
    lu.assertEquals(result.priority, nil)
    lu.assertEquals(result.todo_keyword, nil)
    lu.assertEquals(result.tags, nil)
end

function TestParser:testSingleWordHeadline()
    local headline = "** Single"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(result.node_type, "headline")
    lu.assertEquals(result.level, 2)
    lu.assertEquals(result.title, "Single")
    lu.assertEquals(result.priority, nil)
    lu.assertEquals(result.todo_keyword, nil)
    lu.assertEquals(result.tags, nil)
end

function TestParser:testSingleTODOHeadline()
    local headline = "*** TODO This is a todo"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(result.node_type, "headline")
    lu.assertEquals(result.level, 3)
    lu.assertEquals(result.title, "This is a todo")
    lu.assertEquals(result.priority, nil)
    lu.assertEquals(result.todo_keyword, "TODO")
    lu.assertEquals(result.tags, nil)
end

function TestParser:testSinglePriorityHeadline()
    local headline = "**** [#A] This is an important item"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(result.node_type, "headline")
    lu.assertEquals(result.level, 4)
    lu.assertEquals(result.title, "This is an important item")
    lu.assertEquals(result.priority, "[#A]")
    lu.assertEquals(result.todo_keyword, nil)
    lu.assertEquals(result.tags, nil)
end

function TestParser:testSingleTagHeadline()
    local headline = "****** One tag :test:"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(result.node_type, "headline")
    lu.assertEquals(result.level, 6)
    lu.assertEquals(result.title, "One tag")
    lu.assertEquals(result.priority, nil)
    lu.assertEquals(result.todo_keyword, nil)
    lu.assertEquals(result.tags, {"test"})
end

function TestParser:testEmptyHeadline()
    local headline = "*******"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(result.node_type, "headline")
    lu.assertEquals(result.level, 7)
    lu.assertEquals(result.title, "")
    lu.assertEquals(result.priority, nil)
    lu.assertEquals(result.todo_keyword, nil)
    lu.assertEquals(result.tags, nil)
end

function TestParser:testOnlyTagsHeadline()
    local headline = "******** :ARCHIVE:%Paris:"
    local result = parser.parseHeadline(headline)
    lu.assertEquals(result.node_type, "headline")
    lu.assertEquals(result.level, 8)
    lu.assertEquals(result.title, "")
    lu.assertEquals(result.priority, nil)
    lu.assertEquals(result.todo_keyword, nil)
    lu.assertEquals(result.tags, {"ARCHIVE", "%Paris"})
end

os.exit(lu.LuaUnit.run())

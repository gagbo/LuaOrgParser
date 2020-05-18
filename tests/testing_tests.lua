#!/usr/bin/env lua5.1

-- Documentation lives here https://luaunit.readthedocs.io/en/latest/

-- Some super function to test
local function my_super_function( arg1, arg2 ) return arg1 + arg2 end

-- Unit testing starts
local lu = require('luaunit')

TestMyStuff = {}
    function TestMyStuff:testWithNumbers()
        local a = 1
        local b = 2
        local result = my_super_function( a, b )
        lu.assertEquals( type(result), 'number' )
        lu.assertEquals( result, 3 )
    end

    function TestMyStuff:testWithRealNumbers()
        local a = 1.1
        local b = 2.2
        local result = my_super_function( a, b )
        lu.assertEquals( type(result), 'number' )
        lu.assertAlmostEquals( result, 3.3, 1e-8 )
    end

-- class TestMyStuff

os.exit(lu.LuaUnit.run())

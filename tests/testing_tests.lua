#!/usr/bin/env lua5.1

-- Documentation lives here https://luaunit.readthedocs.io/en/latest/
-- Some super function to test
function my_super_function( arg1, arg2 ) return arg1 + arg2 end

-- Unit testing starts
lu = require('luaunit')

TestMyStuff = {} --class
    function TestMyStuff:testWithNumbers()
        a = 1
        b = 2
        result = my_super_function( a, b )
        lu.assertEquals( type(result), 'number' )
        lu.assertEquals( result, 3 )
    end

    function TestMyStuff:testWithRealNumbers()
        a = 1.1
        b = 2.2
        result = my_super_function( a, b )
        lu.assertEquals( type(result), 'number' )
        -- I would like the result to be always rounded to an integer
        -- but it won't work with my simple implementation
        -- thus, the test will fail
        lu.assertEquals( result, 3 )
    end

-- class TestMyStuff

os.exit(lu.LuaUnit.run())

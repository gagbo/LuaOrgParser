-- -*- mode: lua; -*- vim: ft=lua tw=80
package = "LuaOrgParser"
version = "dev-1"
source = {
   url = "https://github.com/gagbo/LuaOrgParser.git"
}
description = {
   homepage = "https://github.com/gagbo/LuaOrgParser",
   license = "MIT"
}
dependencies = {
    "lua >= 5.1, < 5.4",
    "lpeg >= 1.0.2, < 1.1"
}
build = {
   type = "builtin",
   modules = {
      luaorgparser = "src/luaorgparser/init.lua",
      ["luaorgparser.fileUtils"] = "src/luaorgparser/fileUtils.lua",
      ["luaorgparser.ast"] = "src/luaorgparser/ast/init.lua",
      ["luaorgparser.ast.headline"] = "src/luaorgparser/ast/headline.lua",
      ["luaorgparser.ast.section"] = "src/luaorgparser/ast/section.lua",
      ["luaorgparser.ast.paragraph"] = "src/luaorgparser/ast/paragraph.lua",
      ["luaorgparser.ast.text"] = "src/luaorgparser/ast/text.lua",
      ["luaorgparser.parser"] = "src/luaorgparser/parser.lua"
   },
   copy_directories = {
      "doc",
      "tests"
   }
}

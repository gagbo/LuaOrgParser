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
    "lua >= 5.1, < 5.4"
}
build = {
   type = "builtin",
   modules = {
      luaorgparser = "src/luaorgparser/init.lua",
      ["luaorgparser.fileUtils"] = "src/luaorgparser/fileUtils.lua",
   },
   copy_directories = {
      "doc",
      "tests"
   }
}

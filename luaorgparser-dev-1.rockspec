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
    "lpeg >= 1.0.2"
}
build = {
   type = "builtin",
   modules = {
      luaorgparser = "src/luaorgparser/init.lua",
      ["luaorgparser.fileUtils"] = "src/luaorgparser/fileUtils.lua",
      ["luaorgparser.orgGrammar"] = "src/luaorgparser/orgGrammar.lua"
   },
   copy_directories = {
      "doc",
      "tests"
   }
}

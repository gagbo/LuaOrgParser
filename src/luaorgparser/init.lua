local fileUtils = require("fileUtils")
local orgGrammar = require("orgGrammar")

local test_file_path = "../../tests/test-files/headings/simple_headings.org"
local file_content = fileUtils.read_file(test_file_path)
if file_content then
  print(orgGrammar.orgGrammar:match(file_content))
else
  print("could not read file")
  os.exit(1)
end

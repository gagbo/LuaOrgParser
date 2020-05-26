local fileUtils = require("fileUtils")

local test_file_path = "../../tests/test-files/headings/simple_headings.org"
local file_content = fileUtils.lines_from(test_file_path)
if file_content then
    for k, v in pairs(file_content) do
        print("line[" .. k .. "]", v)
    end
else
    print("could not read file")
    os.exit(1)
end

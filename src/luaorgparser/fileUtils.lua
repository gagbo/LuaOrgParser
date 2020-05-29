local fileUtils = {}

local function file_exists(path)
  local f = io.open(path, "rb")
  if f then f:close() end
  return f ~= nil
end

function fileUtils.read_file(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if not file then
        return nil
    end
    local content = file:read("*all") -- *a or *all reads the whole file
    file:close()
    return content
end

function fileUtils.lines_from(path)
  if not file_exists(path) then return {} end
  local lines = {}
  for line in io.lines(path) do
    lines[#lines + 1] = line
  end
  return lines
end

return fileUtils

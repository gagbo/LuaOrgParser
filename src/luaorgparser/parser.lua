-- Parsing functions

local lpeg = require("lpeg")
local P, R, S, C, Cg, Ct, Cf = lpeg.P, lpeg.R, lpeg.S, lpeg.C, lpeg.Cg, lpeg.Ct, lpeg.Cf

local astHeadline = require("luaorgparser/ast/headline")

local parser = {}

-- Parsing helpers
local whitespace = S("\r\n\f\t ") ^ 1

-- range of valid characters after first character of identifier
local tagsafe = R("AZ", "az", "09") + S("_@#%")
local tagname = tagsafe ^ 1
local function toList(acc, newValue)
    -- local inspect = require("inspect")
    -- print("Adding " .. newValue .. " to " .. inspect(acc))
    table.insert(acc, newValue)
    return acc
end

-- Headline patterns
local stars = P("*") ^ 1
-- TODO : affect the correct list of org-todo-keywords here
local keyword = P("TODO") + P("DONE")
local priority = P("[#") * R("AZ", "az") * P("]")
-- Need to use Ct here to instantiate a new empty table for
-- the initial value of the fold in toList
local tags = Ct("") * P(":") * C(tagname) * (":" * C(tagname)) ^ 0 * P(":")
local tagsOrEndOfInput = tags + S("\r\n") + -1
local headlinePattern =
    Ct(
    Cg(stars, "stars") * -- Stars followed by whitespace or EOL
        whitespace ^ 0 *
        Cg(keyword, "keyword") ^ -1 * -- Optional todo keyword
        whitespace ^ 0 *
        Cg(priority, "priority") ^ -1 * -- Optional Priority
        whitespace ^ 0 *
        (Cg((P(1) - tagsOrEndOfInput) ^ 0, "title") * #tagsOrEndOfInput) ^ -1 * -- Optional Title
        whitespace ^ 0 *
        Cg(Cf(tags, toList), "tags") ^ -1 * -- Optional Tags
        -- Cg(tags, "tags") ^ -1 * -- Optional Tags
        (whitespace + -1) ^ -1
)

local function trim1(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function parser.parseHeadline(line)
    local parsedHeadline = headlinePattern:match(line)

    -- local inspect = require("inspect")
    -- print(inspect(parsedHeadline))

    if not parsedHeadline then
        return nil
    end

    local headlinePriority = nil
    if parsedHeadline.priority then
        headlinePriority = string.sub(parsedHeadline.priority, 3, 3)
    end

    local headlineTitle = ""
    if parsedHeadline.title then
        headlineTitle = trim1(parsedHeadline.title)
    end

    local headlineLevel = string.len(parsedHeadline.stars)

    local newHeadline =
        astHeadline:new(
        {
            level = headlineLevel,
            title = headlineTitle,
            priority = headlinePriority,
            todo_keyword = parsedHeadline.keyword,
            tags = parsedHeadline.tags
        }
    )
    return newHeadline
end

return parser

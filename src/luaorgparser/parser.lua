-- Parsing functions

local lpeg = require("lpeg")
local P, R, S, Cg, Ct = lpeg.P, lpeg.R, lpeg.S, lpeg.Cg, lpeg.Ct

local astHeadline = require("luaorgparser/ast/headline")

local parser = {}

-- Parsing helpers
local whitespace = S("\r\n\f\t ") ^ 1
local whitespaceOrEndOfInput = whitespace + -1

-- range of valid characters after first character of identifier
local tagsafe = R("AZ", "az", "09") + S("_", "@", "#", "%")

-- Headline patterns
local stars = P("*") ^ 1
-- TODO : affect the correct list of org-todo-keywords here
local keyword = P("TODO") + P("DONE")
local priority = P("[#") * R("AZ", "az") * P("]")
local tags = P(":") * tagsafe * (":" * tagsafe) ^ 0 * P(":")
local headlinePattern =
    Ct(
    (Cg(stars, "stars") * whitespaceOrEndOfInput) * -- Stars followed by whitespace or EOL
        (Cg(keyword, "keyword") * whitespaceOrEndOfInput) ^ -1 * -- Optional todo keyword
        (Cg(priority, "priority") * whitespaceOrEndOfInput) ^ -1 * -- Optional Priority
        (Cg((P(1) - tags) ^ 0, "title") * whitespaceOrEndOfInput) ^ -1 * -- Optional Title
        (Cg(tags, "tags") * whitespaceOrEndOfInput) ^ -1 -- Optional Tags
)

function parser.parseHeadline(line)
    local parsedHeadline = headlinePattern:match(line)

    -- local inspect = require("inspect")
    -- print(inspect(parsedHeadline))

    if not parsedHeadline then
        return nil
    end

    local newHeadline =
        astHeadline:new(
        {
            level = string.len(parsedHeadline.stars),
            title = parsedHeadline.title,
            priority = parsedHeadline.priority,
            todo_keyword = parsedHeadline.keyword,
            tags = parsedHeadline.tags
        }
    )
    return newHeadline
end

return parser

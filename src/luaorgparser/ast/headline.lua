-- Headline structure

local headline = {}
-- create the prototype with default values
headline.prototype = {x = 0, y = 0, width = 100, height = 100}
-- create a metatable
headline.mt = {
    raw_value = nil,
    begin_pos = nil, -- begin
    end_pos = nil, -- end
    pre_blank = nil,
    contents_begin = nil,
    contents_end = nil,
    level = nil,
    priority = nil,
    tags = nil,
    todo_keyword = nil,
    todo_type = nil,
    post_blank = nil,
    footnote_section_p = nil,
    archivedp = nil,
    commentedp = nil,
    post_affiliated = nil,
    title = nil,
    parent = nil
}
-- declare the constructor function
function headline.new(o)
    setmetatable(o, headline.mt)
    return o
end

headline.mt.__index = function(table, key)
    -- TODO : error if the key is not in the prototype
    return headline.prototype[key]
end

return headline

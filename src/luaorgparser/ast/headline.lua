-- Headline structure

-- create a Class with default values
local Headline = {
    node_type = "headline",
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
function Headline:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

return Headline

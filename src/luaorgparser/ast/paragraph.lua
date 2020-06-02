-- Paragraph structure

local Paragraph = {
    node_type = "paragraph",
    begin_pos = nil,
    end_pos = nil,
    contents_begin = nil,
    contents_end = nil,
    post_blank = nil,
    post_affiliated = nil,
    parent = nil
}


function Paragraph:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

return Paragraph

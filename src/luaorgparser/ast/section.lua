-- Section structure

local Section = {
    node_type = "section",
    begin_pos = nil,
    end_pos = nil,
    contents_begin = nil,
    contents_end = nil,
    post_blank = nil,
    post_affiliated = nil,
    parent = nil
}


function Section:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

return Section

-- Text structure

local Text = {
    node_type = "text",
    value = nil,
    begin_pos = nil,
    end_pos = nil,
    parent = nil
}

function Text:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

return Text

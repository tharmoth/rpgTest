GameObject = Object:extend()

function GameObject:new(level, x, y, opts)
    local opts = opts or {}
    if opts then for k, v in pairs(opts) do self[k] = v end end
    self.x, self.y = x, y

    self.level = level
    self.id = UUID()
    self.dead = false
    self.timer = Timer()
end

function GameObject:update(dt)
    if self.timer then self.timer:update(dt) end
end
function GameObject:getCenter()
  return  self.x + self.w / 2,  self.y + self.h / 2
end
function GameObject:draw()

end
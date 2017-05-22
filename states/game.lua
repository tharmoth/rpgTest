Game = Object:extend()

function Game:new()
  currentState = Level1()
end
function Game:update(dt)
  if currentState then currentState:update(dt) end
end
function Game:draw()
  if currentState then currentState:draw() end
end
function gotoState(room_type, ...)
  currentState = _G[room_type](...)
end
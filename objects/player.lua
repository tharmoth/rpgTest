Player = GameObject:extend()

function Player:new(level, x, y, opts)
  Player.super.new(self, level, x, y, opts)
  
  self.sprite = love.graphics.newImage("assets/imgAssets/sprite.png")
  image = love.graphics.newImage("assets/imgAssets/male_sprites.png")
  level.world:add(self, self.x, self.y, self.sprite:getWidth(), self.sprite:getHeight()+15)
  
  g = Anim8.newGrid(62, 62, image:getWidth(), image:getHeight(),-1,-1,2)
  animation = Anim8.newAnimation(g(1,11), .12)
  
  self.ox = 32 / 2
  self.oy = 32 / 2
  currentAnimation = "standing"
end
function Player:update(dt)
  animation:update(dt)
  --Player.super.update(self, dt)
  -- 96 pixels per second
  local speed = 96
  self.level.cam:setPosition(self.x, self.y)
  -- Move player up
  if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
    local goalX, goalY = self.x, self.y  - speed * dt
    local actualX, actualY, cols, len = self.level.world:move(self, goalX, goalY, self.filter)
    self.x, self.y = actualX, actualY
    --print(tostring(cols[i].other.properties.name))
    if currentAnimation ~= "walkingUp" and not love.keyboard.isDown("d") and not love.keyboard.isDown("a") then
      animation = Anim8.newAnimation(g('2-9',9), .12)
      currentAnimation = "walkingUp"
    end
  end
  -- Move player down
  if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
    local goalX, goalY = self.x, self.y  + speed * dt
    local actualX, actualY, cols, len = self.level.world:move(self, goalX, goalY, self.filter)
    self.x, self.y = actualX, actualY
    if currentAnimation ~= "walkingDown" and not love.keyboard.isDown("d") and not love.keyboard.isDown("a") then
      animation = Anim8.newAnimation(g('2-9',11), .12)
      currentAnimation = "walkingDown"
    end
  end
  -- Move player left
  if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
    local goalX, goalY = self.x - speed * dt, self.y
    local actualX, actualY, cols, len = self.level.world:move(self, goalX, goalY, self.filter)
    self.x, self.y = actualX, actualY
    if currentAnimation ~= "walkingLeft" then
      animation = Anim8.newAnimation(g('2-9',10), .12)
      currentAnimation = "walkingLeft"
    end
  end
  -- Move player right
  if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
    local goalX, goalY = self.x + speed * dt, self.y
    local actualX, actualY, cols, len = self.level.world:move(self, goalX, goalY, self.filter)
    self.x, self.y = actualX, actualY
    --!print(world:queryRect(0,0,512,512)[2])
    if currentAnimation ~= "walkingRight" then
      animation = Anim8.newAnimation(g('2-9',12), .12)
      currentAnimation = "walkingRight"
    end
  end
  if not (love.keyboard.isDown("d") or love.keyboard.isDown("a") or love.keyboard.isDown("s") or love.keyboard.isDown("w"))then
    animation = Anim8.newAnimation(g(1,11), .12)
    currentAnimation = "standing"
  end
end
function Player:draw()
  local x,y,w,h = self.level.world:getRect(self)
  --love.graphics.rectangle("line",x,y,w,h)
  animation:draw(image, math.floor(self.x), math.floor(self.y),0,1,1,self.ox,self.oy)
end

Level1 = Object:extend()

function Level1:new()
   self.cam = Gamera.new(0, 0, nativeWidth,nativeHeight)
   local scaly = (screenWidth-nativeWidth*(screenHeight/nativeHeight))/2

   --!self.cam:setWindow(100,0,screenWidth-200,screenHeight)
   --self.cam:setScale(math.floor(screenHeight/nativeHeight*100)/100)
  self.cam:setScale(1.6)
  
  self.map = Sti("maps/level1.lua", {"bump"})
  self.world = Bump.newWorld()
  self.map:bump_init(self.world)
    local layer 
  for k, object in pairs(self.map.layers) do
    print(object.name)
    if object.name == "Spawn Point" then
      print("Yatta")
      layer = self.map:addCustomLayer("Sprites",8)
      break
    end
  end

  local newPlayer
  for k, object in pairs(self.map.objects) do
    if object.name == "Player" then
      newPlayer = object
      break
    end
  end
  
  layer.player = Player(self, newPlayer.x, newPlayer.y, {})
  layer.update = function(self, dt) layer.player:update(dt) end
  layer.draw = function(self, dt) layer.player:draw() end
  
  self.map:removeLayer("Spawn Point")
end
function Level1:update(dt)
  self.map:update(dt)
end
function Level1:draw()
  self.cam:draw(function(l,t,w,h)
  for _, layer in ipairs(self.map.layers) do
		if layer.visible and layer.opacity > 0 then
			self.map:drawLayer(layer)
		end
	end
  end)
end

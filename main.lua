--! main.lua
--! This is my test function to test things
Object = require "libraries/classic/classic"
Input = require "libraries/BYTEPATH/Input"
Timer = require "libraries/BYTEPATH/enhancedTimer"
Bump = require 'libraries/kikito/bump'
Gamera = require 'libraries/kikito/gamera'
Sti = require 'libraries/sti'
Anim8 = require 'libraries/kikito/anim8'
require "utils/utils"
require "utils/startup"

function love.load()
  startup()
  game = Game()
end
function love.update(dt)
  game:update(dt)
end
function love.draw()
  game:draw()
end


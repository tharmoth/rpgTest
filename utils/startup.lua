function startup()
  --! loads all the files in given folders
  love.graphics.setDefaultFilter( 'nearest', 'nearest' )

  loadfolder("objects")
  loadfolder("states")
  pewpew = love.audio.newSource("assets/audioAssets/pew.wav", "static")
  input = Input()
   
  --!love.window.setMode(384, 256, {fullscreen = false})
  love.window.setMode(768*1.5, 512*1.5, {fullscreen = false})
  screenHeight = love.graphics.getHeight()
  screenWidth  = love.graphics.getWidth()
  nativeWidth = 768
  nativeHeight = 512
end
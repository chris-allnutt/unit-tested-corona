local ChangeTextColorButton = {}
local ChangeTextColorButton_mt = { __index = ChangeTextColorButton }

-- opt_button is used for dependency injection when testing
function ChangeTextColorButton.new (textObject, opt_button)

  local newChangeTextColorButton      = {}
  newChangeTextColorButton.textObject = textObject
  newChangeTextColorButton.button     = opt_button or display.newImage("images/button.png")
  
  local object = setmetatable(newChangeTextColorButton, ChangeTextColorButton_mt)
  object:bindTapListener();
  
  return object
end

function ChangeTextColorButton.setPosition(self, x_coordinate, y_coordinate)
  self.button.x = x_coordinate
  self.button.y = y_coordinate
end

function ChangeTextColorButton.bindTapListener(self)
  local this = self
  
  function self.button.tap (self, textObject)
    media.playEventSound("sounds/beep.caf")

    local r = math.random( 0, 255 )
    local g = math.random( 0, 255 )
    local b = math.random( 0, 255 )

    this.textObject:setTextColor(r, g, b)
  end
  
  self.button:addEventListener("tap", button)
end

return ChangeTextColorButton
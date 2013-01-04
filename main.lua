local ChangeTextColorButton = require("lib.ChangeTextColorButton")

local textObject = display.newText( "Hello World!", 50, 50, nil, 24)
textObject:setTextColor(255,0,0)

-- Create our text change color button
local changeColorButton = ChangeTextColorButton.new(textObject)
changeColorButton:setPosition(display.contentWidth / 2, display.contentWidth - 50)

transition.to(textObject, {time=1000, y=textObject.y+100} )
describe("Busted unit testing framework", function()
  local ChangeTextColorButton = require('lib.ChangeTextColorButton')
  
  -- mocking coronas display object
  display = {
    newImage = function () end
  }
  
  it("sets x and y properties on button when calling setPosition", function ()
    local button, changeTextColorButton
    local button = {
      x = 0,
      y = 0,
      addEventListener = function() end
    }
    
    changeTextColorButton = ChangeTextColorButton.new(nil, button)
    changeTextColorButton:setPosition(2, 3)
    
    assert.are.same(button.x, 2)
    assert.are.same(button.y, 3)
  end)
  
  it("binds a tap event to the button when instantiated", function ()
    local button, changeTextColorButton
    
    button = {
      addEventListener = function() end
    }
    mock(button, 'addEventListener')
    
    changeTextColorButton = ChangeTextColorButton.new('abc', button)
    
    assert.spy(button.addEventListener).was.called_with(button, "tap", nil)
  end)
  
  
  it("should call button bindTapListener on instantiation", function()
    local changeTextColorButton
    
    stub(ChangeTextColorButton, 'bindTapListener')
    
    changeTextColorButton = ChangeTextColorButton.new()
    
    assert.spy(ChangeTextColorButton.bindTapListener).was.called(1)
  end)
end)
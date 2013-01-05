describe("Hello World Tested", function()
  local ChangeTextColorButton = require('lib.ChangeTextColorButton')
  
  -- mocking coronas display object, must be global
  display = require('mocks.display')
  
  it("sets x and y properties on button when calling setPosition", function ()
    local button, changeTextColorButton
    button = require('mocks.button')
    
    changeTextColorButton = ChangeTextColorButton.new(nil, button)
    changeTextColorButton:setPosition(2, 3)
    
    assert.are.same(button.x, 2)
    assert.are.same(button.y, 3)
  end)
  
  it("binds a tap event to the button when instantiated", function ()
    local button, changeTextColorButton
    
    local button = require('mocks.button');
    
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
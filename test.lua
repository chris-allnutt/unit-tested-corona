describe("Busted unit testing framework", function()
  local ChangeTextColorButton = require('lib.ChangeTextColorButton')
  
  -- mocking coronas display object
  display = {
    newImage = function () end
  }
  
  it("binds a tap event to the button when instantiated", function ()
    local button, changeTextColorButton
    
    button = {
      addEventListener = function() end,
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
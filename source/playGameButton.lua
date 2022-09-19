local pd <const> = playdate
local gfx <const> = pd.graphics

class('PlayGameButton').extends(gfx.sprite)

function PlayGameButton:init(x, y)
    local playGameButtonImage = gfx.image.new("images/playGameMessage")
    assert( playGameButtonImage )
    self:setImage(playGameButtonImage)
    self:moveTo( x, y )
    self:add()
end

-- When the A button is pressed and released, the game state changes and the user can play the game
function playdate.AButtonUp()
    if gameState == 'start' or gameState == 'game over' then
        setGameScene()
        resetGame()
    end
end
local pd <const> = playdate
local gfx <const> = pd.graphics

-- Removes all sprites from the screen
function clearSprites()
    local allSprites = gfx.sprite.getAllSprites()
    for index, sprite in ipairs(allSprites) do
        sprite:remove()
    end
end

-- Sets the background image
function setBackground(imageName)
    -- Display a background image
    local backgroundImage = gfx.image.new( "images/" .. imageName )
    assert( backgroundImage )

    gfx.sprite.setBackgroundDrawingCallback(
        function( x, y, width, height )
            backgroundImage:draw( 0, 0 )
        end
    )
end

-- Sets up the starting scene
function setStartingScene()
    gameState = 'start'
    clearSprites()

    setBackground('startingBackground')
end

-- Sets up the game scene
function setGameScene()
    gameState = 'game'
    clearSprites()

    setBackground('background')
end

-- Sets up the game over scene
function setGameOverScene()
    gameState = 'game over'
    clearSprites()
    setBackground('endingBackground')
end
local pd <const> = playdate
local gfx <const> = pd.graphics

local scoreSprite

function createScoreDisplay()
    -- Current score sprite
    scoreSprite = gfx.sprite.new()
    score = 0
    scoreSprite:setCenter(0, 0)
    scoreSprite:moveTo(320, 4)
    scoreSprite:add()
end

function updateDisplay()
    -- Current score
    local scoreText = 'Score: ' .. score
    local textWidth, textHeight = gfx.getTextSize(scoreText)
    local scoreImage = gfx.image.new(textWidth, textHeight)
    gfx.pushContext(scoreImage)
        gfx.drawText(scoreText, 0, 0)
    gfx.popContext()
    scoreSprite:setImage(scoreImage)
end

function incrementScore()
    -- Updates the score
    score += 1
    updateDisplay()
end

function resetScore()
    score = 0
    updateDisplay()
end

function getScore()
    return score
end
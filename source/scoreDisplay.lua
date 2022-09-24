local pd <const> = playdate
local gfx <const> = pd.graphics

local scoreSprite
local highscoreSprite
local highscore
local scoreTable

-- If there is a highscore stored, it loads it to the game, otherwise it initialises it to zero
function loadHighscore()
    scoreTable = playdate.datastore.read('scoreInfo')
    if scoreTable ~= nil then
        highscore = scoreTable[1]
    else
        scoreTable = {}
        scoreTable[1] = 0
        highscore = 0
    end
end

-- Saves the score to the device if it's higher than the highscore
function saveScore(newScore)
    if scoreTable ~= nil then
        if newScore > scoreTable[1] then
            scoreTable[1] = newScore
            playdate.datastore.write(scoreTable, 'scoreInfo')
        end
    end
end

function createScoreDisplay()
    -- Current score sprite
    scoreSprite = gfx.sprite.new()
    score = 0
    scoreSprite:setCenter(0, 0)
    scoreSprite:moveTo(320, 4)
    scoreSprite:add()

    -- Highscore sprite
    highscoreSprite = gfx.sprite.new()
    highscoreSprite:setCenter(0, 0)
    highscoreSprite:moveTo(8, 4)
    highscoreSprite:add()
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

    -- Highscore
    local highscoreText = 'Highscore: ' .. highscore
    local highscoreTextWidth, highscoreTextHeight = gfx.getTextSize(highscoreText)
    local highscoreImage = gfx.image.new(highscoreTextWidth, highscoreTextHeight)
    gfx.pushContext(highscoreImage)
        gfx.drawText(highscoreText, 0, 0)
    gfx.popContext()
    highscoreSprite:setImage(highscoreImage)
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
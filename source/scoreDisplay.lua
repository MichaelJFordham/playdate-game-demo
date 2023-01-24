local pd <const> = playdate
local gfx <const> = pd.graphics

local scoreSprite
local highscoreSprite
local highscore
local scoreTable
local finalScoreSprite

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

function showFinalScore()
    -- Final score sprite
    finalScoreSprite = gfx.sprite.new()
    finalScoreSprite:setCenter(0, 0)
    finalScoreSprite:moveTo(190, 110)
    finalScoreSprite:add()
    local finalScoreText = score
    local finalScoreTextWidth, finalScoreTextHeight = gfx.getTextSize(finalScoreText)
    local finalScoreImage = gfx.image.new(finalScoreTextWidth, finalScoreTextHeight)
    gfx.pushContext(finalScoreImage)
        -- Wrapping the text with asterisks makes the text bold
        gfx.drawText('*' .. finalScoreText .. '*', 0, 0)
    gfx.popContext()
    finalScoreSprite:setImage(finalScoreImage)
end

function incrementScore()
    -- Updates the score
    score += 1 * pointsMultiplier
    
    -- Update highscore if current score is a new highscore
    if score > highscore then
        highscore = score
    end
    
    updateDisplay()

    -- Increases the speed of the music
    increaseMusicRate(0.005)
end

function resetScore()
    score = 0
    updateDisplay()
end

function getScore()
    return score
end
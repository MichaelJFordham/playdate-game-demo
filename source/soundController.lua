local sound <const> = playdate.sound.sampleplayer
local backgroundMusic = sound.new('./sounds/background-music.wav')
local rate = 1;

-- Plays the background music on a loop at the a specific rate
function playBackgroundMusic()
    backgroundMusic:play(0, rate)
end

-- Increases the rate of the music by the value which is passed in
function increaseMusicRate(newRate)
    rate += newRate
    backgroundMusic:setRate(rate)
end

-- Halves the rate of the music (slows it down)
function halveMusicRate()
    rate = rate / 2
    backgroundMusic:setRate(rate)
end

-- Resets the music rate back to before any mutations by powerups were applied
function resetMusicRate()
    rate = 1 + (score * 0.01)
    backgroundMusic:setRate(rate)
end

-- Resets the music rate to the original default at the start of the game
function resetDefaultMusicRate()
    rate = 1
    backgroundMusic:setRate(rate)
end

-- Stops the background music
function stopMusic()
    backgroundMusic:stop()
end

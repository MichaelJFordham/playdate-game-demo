import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "globals"
import "sceneController"
import "playGameButton"
import "player"
import "ballSpawner"
import "goal"
import "scoreDisplay"
import "powerUpSpawner"
import "soundController"

local gfx <const> = playdate.graphics

function resetGame()
    loadHighscore()
    resetScore()
    clearBalls()
    clearPowerUps()
    stopBallSpawner()
    stopPowerUpSpawner()
    startBallSpawner()
    startPowerUpSpawner()
end

setStartingScene()

function playdate.update()
    -- Update the sprites and the timer
    gfx.sprite.update()
    playdate.timer.updateTimers()
end
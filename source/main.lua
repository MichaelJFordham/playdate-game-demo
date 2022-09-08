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

local gfx <const> = playdate.graphics

setStartingScene()

function playdate.update()
    -- Update the sprites and the timer
    gfx.sprite.update()
    playdate.timer.updateTimers()
end
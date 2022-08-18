import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "globals"
import "player"
import "goal"
import "wall"
import "wallController"
import "ballSpawner"
import "scoreDisplay"
import "sceneController"
import "playGameButton"
import "powerUp"
import "powerUpSpawner"
import "soundController"

-- Declaring this "gfx" shorthand will make your life easier. Instead of having
-- to preface all graphics calls with "playdate.graphics", just use "gfx."
-- Performance will be slightly enhanced, too.
-- NOTE: Because it's local, you'll have to do it in every .lua source file.

local gfx <const> = playdate.graphics

function helloPlaydate()
    print("beep boop beep")
 end

helloPlaydate()

function playdate.update()
    -- Update the sprites and the timer
    gfx.sprite.update()
    playdate.timer.updateTimers()
end
import "powerUp"

local pd <const> = playdate
local gfx <const> = pd.graphics

local spawnTimer

function startPowerUpSpawner()
    -- Makes the game randomly spawn powerups
    math.randomseed(pd.getSecondsSinceEpoch())
    createPowerUpTimer()
end

function createPowerUpTimer()
    -- Generates a random period between spawning the next powerup
    local spawnTime = math.random(8000, 20000)

    -- Waits for the random amount of time, then calls the callback functions to spawn the powerup
    spawnTimer = pd.timer.performAfterDelay(spawnTime, function()
        createPowerUpTimer()
        spawnPowerUp()
    end)
end

-- Spawns a powerup at a random location
function spawnPowerUp()
    local spawnX = math.random(20, 380)
    local spawnY = math.random(30, 140)
    local spawnType = math.random(1, 4)

    -- Resets and removes any powerups currently impacting gameplay to incentivise the player getting the new one
    clearPowerUps()
    resetPowerUps()

    -- Spawns a random powerup at a random position on screen
    if (spawnType == 1) then
        PowerUp(spawnX, spawnY, 'all', 'allPowerUp')
    elseif (spawnType == 2) then
        PowerUp(spawnX, spawnY, 'slow ball', 'slowBallPowerUp')
    elseif (spawnType == 3) then
        PowerUp(spawnX, spawnY, 'fast keeper', 'fastKeeperPowerUp')
    elseif (spawnType == 4) then
        PowerUp(spawnX, spawnY, 'double points', 'doublePointPowerUp')
    end
end

-- Stops the powerup spawner
function stopPowerUpSpawner()
    if spawnTimer then
        spawnTimer:remove()
    end
end

-- Clears all the powerups from the display
function clearPowerUps()
    local allSprites = gfx.sprite.getAllSprites()
    for index, sprite in ipairs(allSprites) do
        if sprite:isa(PowerUp) then
            sprite:remove()
        end
    end
end
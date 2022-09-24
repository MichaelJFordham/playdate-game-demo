local pd <const> = playdate
local gfx <const> = pd.graphics

class('PowerUp').extends(gfx.sprite)

function PowerUp:init(x, y, type, imageName)
    local powerUpImage = gfx.image.new("images/" .. imageName)
    assert( powerUpImage )

    self:setImage(powerUpImage)
    self:moveTo( x, y )
    self:setCollideRect(4, 4, 24, 24)
    self.type = type
    self:add()
end

function PowerUp:update()
    local actualX, actualY, collisions, length = self:moveWithCollisions(self.x, self.y)

    -- If there is a collision
    if length > 0 then
        for index, collision in ipairs(collisions) do
            local collidedObject = collision['other']
            
            if collidedObject:isa(Player) then
                -- If the player hits the powerup, change the game somehow
                activatePowerUp(self.type)
                self:remove()
            end

            if collidedObject:isa(Ball) then
                -- If the ball hits the powerup, remove the powerup
                self:remove()
            end
        end
    end
end

-- Changes a global powerup to impact the gameplay
function activatePowerUp(type)
    if (type == 'all') then
        -- Activate all powerups
        keeperSpeedMultiplier = 2
        ballSpeedMultiplier = 0.5
        pointsMultiplier = 2
    elseif (type == 'slow ball') then
        -- Makes the balls slower
        ballSpeedMultiplier = 0.5
    elseif (type == 'fast keeper') then
        -- Makes the keeper faster
        keeperSpeedMultiplier = 2
    elseif (type == 'double points') then
        pointsMultiplier = 2
    end
end

-- Resets all the global powerups back to their defaults
function resetPowerUps()
    keeperSpeedMultiplier = 1
    ballSpeedMultiplier = 1
    pointsMultiplier = 1
end

-- Ensures the sprites overlap each other rather
function PowerUp:collisionResponse()
    return 'overlap'
end
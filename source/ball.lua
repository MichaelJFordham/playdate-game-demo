local pd <const> = playdate
local gfx <const> = pd.graphics

class('Ball').extends(gfx.sprite)

function Ball:init(x, y, speed, direction)
    local ballImage = gfx.image.new("images/ball")
    assert( ballImage )

    self:setImage(ballImage)
    self:moveTo( x, y )
    self:setCollideRect(8, 8, 16, 16)
    self.speed = speed
    self.direction = direction
    self:add()
end

function Ball:update()
    local actualX, actualY, collisions, length = self:moveWithCollisions(self.x + self.direction, self.y + (self.speed * ballSpeedMultiplier))

    -- If there is a collision
    if length > 0 then
        for index, collision in ipairs(collisions) do
            local collidedObject = collision['other']

            if collidedObject:isa(Player) then
                -- If we save a shot, the score is incremented by 1
                incrementScore()
                self:remove()
            end

            -- If we concede a goal, the game is over
            if collidedObject:isa(Goal) then
                setGameOverScene()
                self:remove()
            end
        end
    end

    -- If the ball has flown off screen, it is removed from the list of sprites for performance reasons
    if (self.y > 240) then
        self:remove()
    end
end

-- Ensures the Balls overlap each other rather than bumping into each other and sliding slowly
function Ball:collisionResponse()
    return 'overlap'
end
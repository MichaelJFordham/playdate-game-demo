local pd <const> = playdate
local gfx <const> = pd.graphics

class('Goal').extends(gfx.sprite)

function Goal:init(x, y)
    local goalImage = gfx.image.new("images/goal")
    assert( goalImage )

    self:setImage(goalImage)
    self:moveTo( x, y )
    self:setCollideRect(16, 8, 222, 16)
    self:add()
end

function Goal:collisionResponse()
    return 'overlap'
end

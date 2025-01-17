Paddle = Class{}

function Paddle:init()
    -- The position of the Paddle.
    self.x = VIRTUAL_WIDTH / 2 - 32
    self.y = VIRTUAL_HEIGHT - 32

    -- The movements of the Paddle on the X axis.
    self.dx = 0

    -- The Width and Height of the Paddle.
    self.width = 64
    self.height = 16

    -- The current Skin of the Paddle.
    self.skin = 1
    
    -- The size of the paddle from Smallest to Largest.
    self.size = 2

    -- To get the desired Paddle, multiply the skin with size.
end

function Paddle:update(dt)
    
    if love.keyboard.isDown('left') then
        self.dx = -PADDLE_SPEED
    elseif love.keyboard.isDown('right') then
        self.dx = PADDLE_SPEED
    else
        self.dx = 0
    end

    if self.dx < 0 then
        self.x = math.max(0, self.x + self.dx * dt)
    else
        self.x = math.min(VIRTUAL_WIDTH - self.width, self.x + self.dx * dt)
    end
end    

function Paddle:render()
    love.graphics.draw(gTextures['main'], gFrames['paddles'][self.size + 4 * (self.skin - 1)],
    self.x, self.y)
end
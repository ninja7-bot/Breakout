require 'src/Dependencies'


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- Fonts table
    gFonts = {
        ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
        ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
        ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
    }
    love.graphics.setFont(gFonts['small'])

    -- Textures table
    gTextures = {
        ['background'] = love.graphics.newImage('graphics/background.png'),
        ['main'] = love.graphics.newImage('graphics/breakout.png'),
        ['arrows'] = love.graphics.newImage('graphics/arrows.png'),
        ['hearts'] = love.graphics.newImage('graphics/hearts.png'),
        ['particle'] = love.graphics.newImage('graphics/particle.png'),
    }

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    gSounds = {
        ['paddle-hit'] = love.audio.newSource('sounds/paddle_hit.wav', 'static'),
        ['score'] = love.audio.newSource('sounds/score.wav', 'static'),
        ['wall-hit'] = love.audio.newSource('sounds/wall_hit.wav', 'static'),
        ['confirm'] = love.audio.newSource('sounds/confirm.wav', 'static'),
        ['select'] = love.audio.newSource('sounds/select.wav', 'static'),
        ['no-select'] = love.audio.newSource('sounds/no_select.wav', 'static'),
        ['brick-hit-1'] = love.audio.newSource('sounds/brick_hit_1.wav', 'static'),
        ['brick-hit-2'] = love.audio.newSource('sounds/brick_hit_2.wav', 'static'),
        ['hurt'] = love.audio.newSource('sounds/hurt.wav', 'static'),
        ['victory'] = love.audio.newSource('sounds/victory.wav', 'static'),
        ['recover'] = love.audio.newSource('sounds/recover.wav', 'static'),
        ['high-score'] = love.audio.newSource('sounds/high_score.wav', 'static'),
        ['pause'] = love.audio.newSource('sounds/pause.wav', 'static'),

        ['music'] = love.audio.newSource('sounds/music.wav', 'static'),

    }


    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end
    }
    gStateMachine:change('start')

    love.keyboard.keysPressed = {}
end    

function love.resize(w, h)
    push:resize(w, h)
end    

function love.keyPressed(key)
    love.keyboard.keysPressed[key] = true
end    

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.draw()
    push:start()

    local bgWidth = gTextures['background']:getWidth()
    local bgHeight = gTextures['background']:getHeight()

    love.graphics.draw(gTextures['background'],
    0, 0, --Coordinates at X, Y
    0, --Orientation
    -- The below function finds a scale multiplier by dividing 
    -- VIRTUAL_WIDTH and VIRTUAL_HEIGHT by actual values of the background
    -- so as to scale the image perfectly on the screen
    VIRTUAL_WIDTH / (bgWidth - 1), VIRTUAL_HEIGHT / (bgHeight - 1))

    gStateMachine:render()

    displayFPS()

    push:finish()
end    

function displayFPS()
    love.graphics.setFont(gFonts['small'])
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print('FPS: ' ..  tostring(love.timer.getFPS()), 5, 5)
end
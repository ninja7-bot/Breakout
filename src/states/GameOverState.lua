GameOverState = Class{__includes = BaseState()}

function GameOverState:enter(params)
    self.score = params.score
end

function GameOverState:update(dt)
    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('return') then
        gStateMachine:change('start')
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function GameOverState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.print('Game Over', 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.print('Your score: ' .. tostring(self.score), 0, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, 'center')
    love.graphics.print('Press Enter!', 0, VIRTUAL_HEIGHT - VIRTUAL_HEIGHT/4, VIRTUAL_WIDTH, 'center')
end
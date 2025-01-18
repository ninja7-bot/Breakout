LevelMaker = Class{}

function LevelMaker.createMap(level)
    local bricks = {}

    local numRows = math.random(3, 7)

    local numCols = math.random(7, 13)

    for y = 1, numRows do
        for x = 1, numCols do
            b = Brick(
            -- The below function assigns X and Y coordinates respectively.
            -- The X coordinate involves: (x - 1) to keep the coordinate to 0 rather than 1.
            -- * 32: to ensure that each brick's width is taken into account.
            -- + 8: it is the padding provided in the left side of the screen.
            -- (13 - numCols) * 16: When the number of Columns is less than 13, the bricks should be center aligned 
                (x - 1) * 32 + 8 + (13 - numCols) * 16,
                y * 16
            )

            table.insert(bricks, b)
        end
    end

    return bricks
end
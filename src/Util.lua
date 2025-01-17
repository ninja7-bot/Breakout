function GenerateQuads(atlas, tileWidth, tileHeight)
    local sheetWidth = atlas:getWidth() / tileWidth
    local sheetHeight = atlas:getHeight() / tileHeight

    local Counter = 1
    local spriteSheet = {}


    --The below loop begins for Y at 0 till the bottomRight corner of the sheet for Y index.
    -- Similarly, X iterates from 0 till sheet's Width.
    -- spriteSheet[Counter] basically appends a new quad to the table spriteSheet.
    -- newQuad is the method involved to generate a Quad and append it to the spriteSheet.
    
    -- newQuad(texture, x, y, dimensions): This is the Parameter format for the same.
    -- Here, texture refers to the Sprite from where the Quad is to be generated.
    -- X and Y are the coordinates of the sprite sheet where the desired Quad is present.
    -- dimensions are basically either 2D or 3D derivable from the spriteSheet.

    for y = 0, sheetHeight - 1 do
        for x = 0, sheetWidth - 1 do

            -- In the below statement, the new quad is taking 
            -- x of the width by multiplying current location with the width of the tile.
            -- y of the height by multiplying current location with height of the tile.
            -- atlas:getDimensions() returns the dimension of the spriteSheet.
            spriteSheet[Counter] = love.graphics.newQuad(x * tileWidth, y * tileHeight, 
                tileWidth, tileHeight, atlas:getDimensions())
            Counter = Counter + 1
        end
    end

    return spriteSheet
end

function table.slice(table, first, last, step)
    local slice = {}

    for i = first or 1, last or #table, step or 1 do
        slice[#slice+1] = table[i]
    end

    return slice
end

function GenerateQuadsPaddles(atlas)
    local x = 0
    local y = 64

    local Counter = 1
    local quads = {}

    for i = 0, 3 do
        quads[Counter] = love.graphics.newQuad(x, y, 32, 16, 
        atlas:getDimensions())

        Counter = Counter + 1

        quads[Counter] = love.graphics.newQuad(x + 32, y, 64, 16, 
        atlas:getDimensions())

        Counter = Counter + 1

        quads[Counter] = love.graphics.newQuad(x + 96, y, 96, 16,
        atlas:getDimensions())
        Counter = Counter + 1

        quads[Counter] = love.graphics.newQuad(x, y + 16, 128, 16,
        atlas:getDimensions())
        Counter = Counter + 1

        x = 0
        y = y + 32
    end

    return quads
end    

function GenerateQuadsBalls(atlas)
    local x = 96
    local y = 48

    local Counter = 1
    local quads = {}

    for i = 0, 3 do
        quads[Counter] = love.graphics.newQuad(x, y, 8, 8, atlas:getDimensions())
        x = x + 8
        Counter = Counter + 1
    end

    x = 96
    y = 56

    for i = 0, 2 do
        quads[Counter] = love.graphics.newQuad(x, y, 8, 8, atlas:getDimensions())
        x = x + 8
        Counter = Counter + 1
    end

    return quads
end
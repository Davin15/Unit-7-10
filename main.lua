-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Mr. Coxall
-- Created on: Jan 2018
-- 
-- This file animates a charact using a spritesheet
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
 
centerX = display.contentWidth * .5
centerY = display.contentHeight * .5

local sheetOptionsIdle =
{
    width = 587,
    height = 707,
    numFrames = 10
}
local sheetIdleKnight = graphics.newImageSheet( "assets/knightIdle.png", sheetOptionsIdle )

local sheetOptionsIdle2 =
{
    width = 232,
    height = 439,
    numFrames = 10
}

local sheetIdleNinja = graphics.newImageSheet ("assets/ninjaBoyIdle.png", sheetOptionsIdle2)

local sheetOptionsWalk =
{
    width = 587,
    height = 707,
    numFrames = 10
}
local sheetWalkingKnight = graphics.newImageSheet( "assets/knightWalking.png", sheetOptionsWalk )

local sheetOptionsWalk2 =
{
    width = 232,
    height = 439,
    numFrames = 10
}
local sheetWalkingNinja = graphics.newImageSheet("assets/ninjaBoyRun.png", sheetOptionsWalk2)

-- sequences table
local sequence_data = {
    -- consecutive frames sequence
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleKnight
    },
    {
        name = "walk",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetWalkingKnight
    }
}

local sequence_data2= {   

   {    
        name = "idle2",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleNinja
    },
    {
        name = "walk2",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetWalkingNinja
    }
}

local knight = display.newSprite( sheetIdleKnight, sequence_data )
knight.x = centerX
knight.y = centerY
knight.xScale= 200/587
knight.yScale= 200/707

knight:play()

local Ninja = display.newSprite ( sheetIdleNinja, sequence_data2)
Ninja.x= centerX
Ninja.y = centerY
Ninja.xScale= 200/232
Ninja.yScale= 200/439

Ninja:play()

-- After a short time, swap the sequence to 'seq2' which uses the second image sheet
local function swapSheet()
    knight:setSequence( "walk" )
    knight:play()
    print("walk")
end

local function swapSheet2()
    Ninja:setSequence( "Run" )
    Ninja:play()
    print("Run")
end



timer.performWithDelay( 2000, swapSheet )
timer.performWithDelay(2000, swapSheet2)
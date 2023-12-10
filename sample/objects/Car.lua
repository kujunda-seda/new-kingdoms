local GameObject = require "types.GameObject"

--- Game object is responsible for car logic
---@class Car:GameObject
---@field roadPosition number Fraction of relative position on the road
---@field speed number Current car speed
---@field isActivated boolean
local Car = GameObject:new {}

--- Constants

local START_OF_ROAD = 0
local END_OF_ROAD = 1
local MOVEMENTS_PER_SEC = 100

---@return Car
function Car:new()
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable({}, self)
    self.__index = self

    newObject.roadPosition = START_OF_ROAD
    newObject.speed = 0
    newObject.isActivated = false

    return newObject
end

--- Moves car according to its current speed and repositions it at the beginning of the road
---@param time number Game timing difference from previous update
function Car:moveWith(time)
    self.roadPosition = self.roadPosition + self.speed * time / MOVEMENTS_PER_SEC
    if self.roadPosition > END_OF_ROAD then
        self.roadPosition = START_OF_ROAD
    end
end

--- Notifies object of interaction
function Car:objectInteracted()
    self.isActivated = not self.isActivated
end

return Car
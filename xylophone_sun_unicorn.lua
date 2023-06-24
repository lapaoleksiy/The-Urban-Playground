--The Urban Playground

--Game Initialization

local Player = { x = 0, y = 0, speed = 10 }

function Player:new()
  local o = {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Player:init()
  self.x = 0
  self.y = 0
  self.speed = 10
end

function Player:update(dt)
  self.x = self.x + self.speed * dt
  self.y = self.y + self.speed * dt
end

--Level Objects

local Objects = {}

function Objects:new()
  local o = {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Objects:init()
  self.trees = { x = 5, y = 0, width = 10, height = 20 }
  self.cars = { x = 15, y = 0, speed = 8 }
  self.buildings = { x = 30, y = 0, width = 40, height = 60 }
end

--Level Logic

local Level = {}

function Level:new()
  local o = {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Level:init()
  self.objects = Objects:new()
  self.player = Player:new()
end

function Level:update(dt)
  self.player:update(dt)
  self.objects:update(dt)
end

function Level:render()
  love.graphics.setColor(255,255,255)
  love.graphics.rectangle("fill", self.objects.trees.x, self.objects.trees.y, self.objects.trees.width, self.objects.trees.height)
  love.graphics.setColor(255,0,0)
  love.graphics.rectangle("fill", self.objects.cars.x, self.objects.cars.y, 10, 10)
  love.graphics.setColor(0,0,255)
  love.graphics.rectangle("fill", self.objects.buildings.x, self.objects.buildings.y, self.objects.buildings.width, self.objects.buildings.height)
  love.graphics.setColor(0,255,0)
  love.graphics.rectangle("fill", self.player.x, self.player.y, 10, 10)
end

--Game Loop

function love.load()
  level = Level:new()
  level:init()
end

function love.update(dt)
  level:update(dt)
end

function love.draw()
  level:render()
end
--rainlib v0.1
--by spalter
--source: https://github.com/spalter/rainlib

rainlib = {
    rain = false,           -- enable/disable rain
    has_thunder = false,    -- enable/disable thunder
    has_puddles = true,     -- enable/disable puddles
    thunder = 0,            -- tick counter for thunder, don't change this
    intensity = 1,          -- how many drops per frame are spawned
    direction = 0.2,        -- how fast the drops move in the x direction
    color = 7,              -- color of the drops and puddles
    drops = {},             -- list of drops, don't change this
    puddles = {},           -- list of puddles, don't change this
    area = {
        x = 0,
        y = 0,
        w = 128,
        h = 128,
    },                      -- squared area to let it rain

    -- init function to enable rain
    init = function(self)
        self.rain = true
    end,

    -- update function to move drops, show thunder and spawn puddles
    update = function(self)
        if (not self.rain) return

        self:spawn_drops()
        self:move_drops()

        if (self.has_thunder and rnd(5) > 4.9) self.thunder = 5
        if (self.thunder > 0) self.thunder -=1
    end,

    -- draw function to display rain, put it as last draw call before UI elements
    draw = function(self)
        if (not self.rain) return

        self:render_drops()
        self:render_puddles()

        if (self.thunder > 0 and self.thunder != 3) rectfill(self.area.x,self.area.y,self.area.w,self.area.h,7)
    end,

    -- random number function for integers
    rand = function(a)
        return flr(rnd(a))
    end,

    range = function(a,b)
        if(a<0) then
            return flr(a + rnd(b+(a*-1)))
        else
            return flr(rnd(b-a) + a)
        end
    end,

    -- spawn drops based on intensity per frame
    spawn_drops = function(self)
        for i=0,self.intensity,1 do
            drop = {
                x = self.range(self.area.x, self.area.w),
                y = 0,
                len = self.range(3,9),
                target = self.range(self.area.y, self.area.h),
                hit = false,
            }

            add(self.drops,drop)
        end
    end,

    -- spawn puddles based on position a drop hit the ground
    -- exclude puddles that are out of bounds
    spawn_puddle = function(self, x, y)
        if (not self.has_puddles) return
        if (x < self.area.x or x > self.area.w) return
        if (y < self.area.y or y > self.area.w) return

        puddle = {
            x = x,
            y = y,
            age = 0,
        }

        add(self.puddles, puddle)
    end,

    -- move drops based on direction and register hits
    move_drops = function(self)
        for drop in all(self.drops) do
            if (not drop.hit) then
                drop.y += 1
                drop.x += self.direction
            end

            if (drop.y >= drop.target) then 
                if(not drop.hit) self:spawn_puddle(drop.x, drop.y)
                drop.hit = true
                drop.len -= 1
            end

            if (drop.len <= 0) del(self.drops, drop)
        end
    end,

    -- draw drops based on length and direction
    render_drops = function(self)
        for drop in all(self.drops) do
            for i=0,drop.len,1 do
                pset(drop.x-(i*self.direction), drop.y-i, self.color)
            end
        end
    end,

    -- draw puddles with size based on age
    render_puddles = function(self)
        for puddle in all(self.puddles) do
            local s = puddle.age
            oval(puddle.x-s, puddle.y-(s/2), puddle.x+s, puddle.y+(s/2), self.color)
            puddle.age += 1
            if (puddle.age >= 5) del(self.puddles, puddle)
        end
    end,
}

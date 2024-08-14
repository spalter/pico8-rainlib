--rainlib v0.1
--by spalter
--source: https://github.com/spalter/rainlib

rainlib = {
    rain = true,
    debug = true,
    has_thunder = true,
    has_puddles = true,
    thunder = 0,
    intensity = 1,
    direction = 0,
    color = 7,
    drops = {},
    puddles = {},

    init = function(self)
        if (self.debug) printh("init", 'rainlib', true)
    end,

    update = function(self)
        if (not self.rain) return
        self:log("update")
        self:spawn_drops()
        self:move_drops()

        if (self.has_thunder and rnd(5) > 4.9) self.thunder = 5
        if (self.thunder > 0) self.thunder -=1
    end,

    draw = function(self)
        if (not self.rain) return
        self:log("draw")
        self:render_drops()
        self:render_puddles()

        if (self.thunder > 0 and self.thunder != 3) rectfill(0,0,128,128,7)
    end,

    log = function(self, s)
        if (self.debug) printh(s, 'rainlib', false)
    end,

    range = function(self, a, b)
        return flr(a + self.rand((b * 2)))
    end,

    rand = function(a)
        return flr(rnd(a))
    end,

    spawn_drops = function(self)
        for i=0,self.intensity,1 do
            drop = {
                x = self:range(-128,256),
                y = 0,
                len = self.rand(9),
                target = self.rand(128),
                hit = false,
            }
            add(self.drops,drop)
        end
    end,

    spawn_puddle = function(self, x, y)
        if (not self.has_puddles) return
        puddle = {
            x = x,
            y = y,
            age = 0,
        }
        add(self.puddles, puddle)
    end,

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

    render_drops = function(self)
        for drop in all(self.drops) do
            for i=0,drop.len,1 do
                pset(drop.x-(i*self.direction), drop.y-i, self.color)
            end
        end
    end,

    render_puddles = function(self)
        for puddle in all(self.puddles) do
            local s = puddle.age / 2
            circ(puddle.x, puddle.y, puddle.age, self.color)
            puddle.age += 1
            if (puddle.age >= 5) del(self.puddles, puddle)
        end
    end,
}

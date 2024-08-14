--rainlib
--by spalter
--source: https://github.com/spalter/rainlib

rainlib = {
    rain = true,

    init = function(self)
        log("init")
    end,

    update = function(self)
        log("update")
    end,

    draw = function(self)
        log("draw")
    end,

    log = function(self, s)
        printh(s, 'rainlib.log', false)
    end
}
rainlib={rain=true,debug=true,has_thunder=true,has_puddles=true,thunder=0,intensity=1,direction=0,color=7,drops={},puddles={},init=function(n)if(n.debug)printh("init","rainlib",true)
end,update=function(n)if(not n.rain)return
n:log("update")n:spawn_drops()n:move_drops()if(n.has_thunder and rnd(5)>4.9)n.thunder=5
if(n.thunder>0)n.thunder-=1
end,draw=function(n)if(not n.rain)return
n:log("draw")n:render_drops()n:render_puddles()if(n.thunder>0and n.thunder~=3)rectfill(0,0,128,128,7)
end,log=function(n,e)if(n.debug)printh(e,"rainlib",false)
end,range=function(n,e,i)return flr(e+n.rand(i*2))end,rand=function(n)return flr(rnd(n))end,spawn_drops=function(n)for e=0,n.intensity,1do i={x=n:range(-128,256),y=0,len=n.rand(9),target=n.rand(128),hit=false}add(n.drops,i)end end,spawn_puddle=function(n,e,i)if(not n.has_puddles)return
f={x=e,y=i,age=0}add(n.puddles,f)end,move_drops=function(e)for n in all(e.drops)do if(not n.hit)n.y+=1n.x+=e.direction
if n.y>=n.target then if(not n.hit)e:spawn_puddle(n.x,n.y)
n.hit=true n.len-=1end if(n.len<=0)del(e.drops,n)
end end,render_drops=function(n)for e in all(n.drops)do for i=0,e.len,1do pset(e.x-i*n.direction,e.y-i,n.color)end end end,render_puddles=function(e)for n in all(e.puddles)do local i=n.age/2circ(n.x,n.y,n.age,e.color)n.age+=1if(n.age>=5)del(e.puddles,n)
end end}

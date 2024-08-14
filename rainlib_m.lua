rainlib={rain=false,has_thunder=false,has_puddles=true,thunder=0,intensity=1,direction=.2,color=7,drops={},puddles={},init=function(n)n.rain=true end,update=function(n)if(not n.rain)return
n:spawn_drops()n:move_drops()if(n.has_thunder and rnd(5)>4.9)n.thunder=5
if(n.thunder>0)n.thunder-=1
end,draw=function(n)if(not n.rain)return
n:render_drops()n:render_puddles()if(n.thunder>0and n.thunder~=3)rectfill(0,0,128,128,7)
end,rand=function(n)return flr(rnd(n))end,spawn_drops=function(n)for f=0,n.intensity,1do e={x=-128+n.rand(512),y=0,len=n.rand(9),target=n.rand(128),hit=false}add(n.drops,e)end end,spawn_puddle=function(f,n,e)if(not f.has_puddles)return
if(n<0or n>128)return
o={x=n,y=e,age=0}add(f.puddles,o)end,move_drops=function(f)for n in all(f.drops)do if(not n.hit)n.y+=1n.x+=f.direction
if n.y>=n.target then if(not n.hit)f:spawn_puddle(n.x,n.y)
n.hit=true n.len-=1end if(n.len<=0)del(f.drops,n)
end end,render_drops=function(n)for f in all(n.drops)do for e=0,f.len,1do pset(f.x-e*n.direction,f.y-e,n.color)end end end,render_puddles=function(e)for n in all(e.puddles)do local f=n.age oval(n.x-f,n.y-f/2,n.x+f,n.y+f/2,e.color)n.age+=1if(n.age>=5)del(e.puddles,n)
end end}
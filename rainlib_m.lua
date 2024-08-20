rainlib={rain=false,has_thunder=false,has_puddles=true,thunder=0,intensity=1,direction=.2,color=7,drops={},puddles={},area={x=0,y=0,x2=128,y2=128},init=function(n)n.rain=true end,update=function(n)if(not n.rain)return
n:spawn_drops()n:move_drops()if(n.has_thunder and rnd(5)>4.9)n.thunder=5
if(n.thunder>0)n.thunder-=1
end,draw=function(n)if(not n.rain)return
n:render_drops()n:render_puddles()if(n.thunder>0and n.thunder~=3)rectfill(n.area.x,n.area.y,n.area.w,n.area.h,7)
end,rand=function(n)return flr(rnd(n))end,range=function(n,f)if(sgn(n))n*=-1
return flr(rnd(f)-n)end,spawn_drops=function(n)for f=0,n.intensity,1do e={x=n.range(n.area.x,n.area.x2),y=n.area.y,len=n.range(3,9),target=n.range(n.area.y,n.area.y2),hit=false}add(n.drops,e)end end,spawn_puddle=function(n,f,e)if(not n.has_puddles)return
if(f<n.area.x or f>n.area.x2)return
if(e<n.area.y or e>n.area.y2)return
o={x=f,y=e,age=0}add(n.puddles,o)end,move_drops=function(f)for n in all(f.drops)do if(not n.hit)n.y+=1n.x+=f.direction
if n.y>=n.target then if(not n.hit)f:spawn_puddle(n.x,n.y)
n.hit=true n.len-=1end if(n.len<=0)del(f.drops,n)
end end,render_drops=function(n)for f in all(n.drops)do for e=0,f.len,1do pset(f.x-e*n.direction,f.y-e,n.color)end end end,render_puddles=function(e)for n in all(e.puddles)do local f=n.age oval(n.x-f,n.y-f/2,n.x+f,n.y+f/2,e.color)n.age+=1if(n.age>=5)del(e.puddles,n)
end end}

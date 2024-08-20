rainlib={rain=false,has_thunder=false,has_puddles=true,thunder=0,intensity=1,direction=.2,color=7,drops={},puddles={},area={x=0,y=0,w=128,h=128},init=function(n)n.rain=true end,update=function(n)if(not n.rain)return
n:spawn_drops()n:move_drops()if(n.has_thunder and rnd(5)>4.9)n.thunder=5
if(n.thunder>0)n.thunder-=1
end,draw=function(n)if(not n.rain)return
n:render_drops()n:render_puddles()if(n.thunder>0and n.thunder~=3)rectfill(n.area.x,n.area.y,n.area.w,n.area.h,7)
end,rand=function(n)return flr(rnd(n))end,range=function(n,e)if(n<0)return flr(n+rnd(e+n*-1))else return flr(rnd(e-n)+n)
end,spawn_drops=function(n)for e=0,n.intensity,1do f={x=n.range(n.area.x,n.area.w),y=0,len=n.range(3,9),target=n.range(n.area.y,n.area.h),hit=false}add(n.drops,f)end end,spawn_puddle=function(n,e,f)if(not n.has_puddles)return
if(e<n.area.x or e>n.area.w)return
if(f<n.area.y or f>n.area.w)return
o={x=e,y=f,age=0}add(n.puddles,o)end,move_drops=function(e)for n in all(e.drops)do if(not n.hit)n.y+=1n.x+=e.direction
if n.y>=n.target then if(not n.hit)e:spawn_puddle(n.x,n.y)
n.hit=true n.len-=1end if(n.len<=0)del(e.drops,n)
end end,render_drops=function(n)for e in all(n.drops)do for f=0,e.len,1do pset(e.x-f*n.direction,e.y-f,n.color)end end end,render_puddles=function(f)for n in all(f.puddles)do local e=n.age oval(n.x-e,n.y-e/2,n.x+e,n.y+e/2,f.color)n.age+=1if(n.age>=5)del(f.puddles,n)
end end}

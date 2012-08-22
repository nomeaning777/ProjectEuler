x0,y0=2,1
x,y=2,1
sum=0
loop do
  #次の解を求める
  x,y = x0*x+3*y0*y,x0*y+y0*x
  p [x,y]
  s=0
  if x%3==1 
    s=x+1
  else
    s=x-1
  end
  break if s*2>1e9
  sum+=s*2
end
p sum

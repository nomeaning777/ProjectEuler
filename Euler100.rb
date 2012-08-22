x0,y0=3,2
x,y=41,29
loop do
  #次の解を求める
  x,y = x0*x+2*y0*y,x0*y+y0*x
  p [x,y]
  if x%2==1 && y%2==1
    m=(x+1)/2
    n=(y+1)/2
    if m>1e12 then
      puts n
      break
    end
  end
end

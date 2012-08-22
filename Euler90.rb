$sq = ["01","04","06","16","25","36","46","64","81"]
$ans = 0
def check(a,b)
  a.push(6) if a.include?(9)
  b.push(6) if b.include?(9)
  $sq.each do |s|
    next if a.include?(s[0].to_i) && b.include?(s[1].to_i)
    next if b.include?(s[0].to_i) && a.include?(s[1].to_i)
    return false
  end
  return true
end
def dfs(a,b)
  if a.size == 6
    if b.size == 6
      if check(a+[],b+[])
        $ans += 1
      end
    else
      max=0
      if b.size()==0 then
        max=0
      else
        max=b.max+1
      end
      max.upto(9) do |i|
        if b.include?(i)==false then
          dfs(a+[],b+[i])
        end 
      end
    end
  else
    max=0
    if a.size()==0 then
      max=0
    else
      max=a.max+1
    end
    max.upto(9) do |i|
      if a.include?(i)==false then
        dfs(a+[i],b+[])
      end 
    end
  end
end

dfs([],[])
puts $ans/2

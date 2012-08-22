n = gets.to_i
$b = n.to_s(2)
$n = $b.size
$memo = Hash.new

def rec(n,m)
  s=[n,m]
  return 0 if m<0
  if $memo.key?(s)
    return $memo[s]
  end
  if n == -1
    if m != 0
      return 0
    else
      return 1
    end
  else
    ret=0
    now = 1<<n
    return 0 if now*4<=m
    ret += rec(n-1,m-now*2)
    ret += rec(n-1,m-now)
    ret += rec(n-1,m)
    return $memo[s]=ret
  end
end
p rec($n-1, n)


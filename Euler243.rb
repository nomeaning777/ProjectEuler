def euler_phi(n)
  res = Array.new(n)
  n.times do |i|
    res[i] = i
  end
  n.times do |i|
    next if i < 2
    if res[i] == i
      j = i
      while j < n
        res[j] = res[j] / i * (i-1)
        j += i
      end
    end
  end
  return res
end

N = 100000000
min = 1.0
phi = euler_phi(N)
for i in 2..N-1
  if phi[i].to_f/(i-1)< min
    min=phi[i].to_f/(i-1)
    p [i,min]
  end
  if phi[i] * 94744 < 15499 * (i-1)
    puts i
    exit
  end
end


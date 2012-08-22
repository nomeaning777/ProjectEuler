def dr(x)
	tmp=0
	while x>0
		tmp+=x%10
		x/=10
	end
	return dr(tmp) if tmp>9 
	return tmp
end
N=1000000
dp=Array.new(N)
dp[1]=1
sum=0
for i in 2..N-1
	j=2
	dp[i]=dr(i)
	while j*j<=i
		if i%j==0 then
			dp[i]=[dp[i],dp[j]+dp[i/j]].max
		end
		j+=1
	end
	sum+=dp[i]
end
p sum

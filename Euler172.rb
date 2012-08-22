$dp=Hash.new
$dp.default=-1
def solve(remain,count)
	return 1 if count==18
	return $dp[[remain,count]] if $dp[[remain,count]]>=0
	ans=0
	for i in 0..9
		next if i==0 && count==0
		if remain[i]>0 then
			remain[i]-=1
			ans+=solve(remain,count+1)
			remain[i]+=1
		end
	end
	return $dp[[remain,count]]=ans
end

remain=Array.new(10){3}
p solve(remain,0)


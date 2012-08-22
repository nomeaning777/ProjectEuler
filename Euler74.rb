$next_value=Hash.new

def fact(v)
	return 1 if v<=1 
	return fact(v-1)*v
end
def calc_next(x)
	return $next_value[x] if $next_value.key?(x)
	tmp=x
	res=0
	while tmp>0
		res+=fact(tmp%10)
		tmp/=10
	end
	$next_value[x]=res
end
def solve(x)
	test=Hash.new
	ans=0
	while !test.key?(x)
		test[x]=1
		x=calc_next(x)
		ans+=1
	end
	return ans
end
ans=0
1000000.times{|i|
	if solve(i)==60 then
		ans+=1
	end
}
p ans

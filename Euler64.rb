def solve(a,b,c)
	((a*Math.sqrt($N)+b)/c).truncate
end
def next_calc(a,b,c)
	# a sqrt(N)+b / C
	x=solve(a,b,c)
	b-=c*x
	a_=c*a
	b_=-c*b
	c_=a*a*$N-b*b

	a=a_
	b=b_
	c=c_
	g=a_.gcd(b).gcd(c)
	a/=g
	b/=g
	c/=g
	return [a,b,c]
end
m=gets.to_i
ans=0
for q in 1..m
	$N=q
	r=Math.sqrt(q).truncate
	if r*r==q then 
		next
	end
	a=1
	b=0
	c=1

	ac=Hash.new
	ac.store([a,b,c],0)
	i=0
	loop {
		a,b,c=next_calc(a,b,c)
		if ac.key?([a,b,c]) then
			if (i-ac[[a,b,c]])%2==1 then
				ans+=1
			end
			break
		end
		ac.store([a,b,c],i)
		i+=1
	}
end

puts ans

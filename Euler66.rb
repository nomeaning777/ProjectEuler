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
ans=0
x=0
d=-1
for q in 1..1000
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
	v=[]
	fs=0
	loop {
		v.push(solve(a,b,c))

		a,b,c=next_calc(a,b,c)
		if ac.key?([a,b,c]) then
			if (i-ac[[a,b,c]])%2==1 then
				ans+=1
			end
			fs=i-ac[[a,b,c]]
			break
		end
		ac.store([a,b,c],i)
		i+=1
	}
	p fs
	s=[1,0]
	if fs%2==0 then
			
	else
		
	end
	(v.length-1).downto(0){|i|
		s[1],s[0]=s[0],s[1]
		s[0]+=s[1]*v[i]
		g=s[0].gcd(s[1])
		s[0]/=g
		s[1]/=g
	}
	print "#{q} "
	p [s[0],s[1]]
	t=s[0]*s[0]-q*s[1]*s[1]
	if t!=1 then
		puts "ERROR:#{t}"
		exit
	end
	x=[x,s[0]].max
	if x==s[0] then
		d=q
	end
end	
puts x
puts d

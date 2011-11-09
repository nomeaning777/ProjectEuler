	n=gets.to_i
	$e=[2]
	for i in 1..n
		$e+=[1,i*2,1]
	end
	s=[1,0]

	(n-1).downto(0){|i|
		s[1],s[0]=s[0],s[1]
		s[0]+=s[1]*$e[i]
		g=s[0].gcd(s[1])
		s[0]/=g
		s[1]/=g
	}
	ans=0
	while s[0]>0
		ans+=s[0]%10
		s[0]/=10
	end
	puts ans

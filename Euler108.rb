require 'rational'

def solve(n)
	c=Rational(1,n)
	ans=0
	for x in n+1..2*n
		a=c-Rational(1,x)
		if a.numerator==1 then
			ans+=1
		end
	end
	ans
end
k=99250
loop {
	r=solve(k)
	if r>1000 then
		p k
		break
	end
	puts "#{k};#{r}"
	STDOUT.flush
	k+=1
}

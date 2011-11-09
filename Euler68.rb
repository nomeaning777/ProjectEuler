$lines=[[0,5,6],[1,6,7],[2,7,8],[3,8,9],[4,9,5]]
def check() #魔方陣になっているかのチェック
	sum=$vals[0]+$vals[5]+$vals[6]
	for i in 1..4
		ts=0
		for j in 0..2
			ts+=$vals[$lines[i][j]]
		end
		if ts!=sum then
			return false
		end
	end
	return true
end

def make_value()
	mv=0
	for i in 0..4
		if $vals[i]<$vals[mv] then
			mv=i
		end
	end
	res=""
	for i in 0..4
		t=(mv+i)%5
		for j in 0..2
			res+=$vals[$lines[t][j]].to_s
		end
	end
	return res
end
ans=[]
[1,2,3,4,5,6,7,8,9,10].permutation{|p|
	$vals=p
	if check() && make_value.length==16 then
		ans.push(make_value)
	end
}
puts ans.max

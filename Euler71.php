<?php
	function gcd($a,$b){
		return $b==0?$a:gcd($b,$a%$b);
	}
	define("d",1000000);
	$ansa=10000;
	$ansb=1;
	$sub=2.11111;
	for($i=1;$i<=d;$i++){
		$a=(int)($i*3/7);
		while($a*7<3*$i){
			if(gcd($a,$i)==1){
				$sub2=3.0/7-$a/$i;
				if($sub2<$sub){
					$ansa=$a;
					$ansb=$i;
					$sub=$sub2;
				}
			}
			$a++;
		}
	}
	echo $ansa;
	echo "\n";
	echo $ansb;

?>

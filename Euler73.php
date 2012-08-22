<?php	
	$ans=0;
	function sternBrocot($B,$pl=0,$ql=1,$pr=1,$qr=0){
		$pm=$pl+$pr;$qm=$ql+$qr;
		if($pm>$B||$qm>$B)return;
		global $ans;
		if($pm*2<1*$qm){
			if($pm*3>1*$qm){
				$ans++;
			}
		}
		if($pm*3>$qm)	
		sternBrocot($B,$pl,$ql,$pm,$qm);
		if($pm*2<$qm)
		sternBrocot($B,$pm,$qm,$pr,$qr);


	}
	sternBrocot(12000);
	echo $ans
?>

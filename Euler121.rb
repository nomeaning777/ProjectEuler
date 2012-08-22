require 'pp'
class Main
  def run
    dp = Array.new(16){Array.new(16,0)}
    dp[0][0]=Rational(1,1)
    cnt=2
    for i in 1..15
      for j in 0..i-1
        dp[i][j]+=(1-Rational(1,cnt))*dp[i-1][j]
        dp[i][j+1]+=(Rational(1,cnt))*dp[i-1][j]
      end
      cnt+=1
    end
    pp dp
    ret=0
    for i in 8..15
      ret+=dp[15][i]
    end
    p ret
    
  end
end

Main.new.run


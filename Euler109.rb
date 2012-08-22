class Main
  def run
    @score = Hash.new
    @score.default = 0
    for i in 1..20
      @score["D"+i.to_s]=i*2
      @score["S"+i.to_s]=i*1
      @score["T"+i.to_s]=i*3
    end
    @score["D25"]=50
    @score['S25']=25
    @res = Hash.new
    @cnt = Array.new(200,0)
    dfs(0,[],0)
    @cnt = @cnt.slice(0..99)
    p @cnt.inject(:+)
  end
  def dfs(cnt,arr,score)
    if arr.size > 0 && arr[arr.size-1][0]=="D" 
      last=arr.pop
      cp = arr.sort
      arr.push(last)
      cp.push(last)
      if @res.key?(cp) == false
        @res[cp]=1
        @cnt[score]+=1
      end
    end
    
    return if cnt == 3

    @score.each do |a,b|
      dfs(cnt+1,arr+[a], score+b)
    end

  end
end
Main.new.run

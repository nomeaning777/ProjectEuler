#!/usr/local/bin/rdmd
import std.stdio;


int count(int n){
  int ret=0;
  for(int x=n+1;x<=2*n;x++){
    if(cast(long)(n)*x % (n-x)==0){
      ret++;
    }
  }
  return ret;
}
void main(){
  for(int i=78000;;i++){
    if(count(i)>1000){
      printf("Answer: %d\n", i);
      return;
    }
    if(i%1000==0)printf("%d,%d\n",i,count(i));
  }
}

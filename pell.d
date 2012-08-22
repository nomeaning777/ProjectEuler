#!/usr/local/bin/rdmd
import std.bigint;
import std.cstream;
import std.typecons;
import std.math;
import std.string;
import std.conv;
import std.stdio;

alias Tuple!(BigInt,"x",BigInt,"y") Result;

// ニュートン法によりsqrt(x)を求める
BigInt sqrt(BigInt x){
  BigInt a=x,b=1;
  while(!(a<=b)){
    a=a/2;b=b*2;
  }
  a=b+1;
  while(!(a<=b)){
    a=b;
    b=(a+x/a)/2;
  }
  return a;
}

BigInt gcd(BigInt a,BigInt b){
  if(a==0)return b;
  else return gcd(b%a,a);
}

Result init_pell_equ(BigInt D){
  BigInt b=0,c=1,d=1;
  BigInt p1=0,q1=1,p2=1,q2=0;
  BigInt t1,t2,t3;
  for(;;){
    BigInt a=(b+sqrt(c*c*D))/d;
    
    t1=p1;t2=p2;
    p2=t2*a+t1;
    p1=t2;
     
    t1=q1;t2=q2;
    q2=t2*a+t1;
    q1=t2;

    if(p2*p2-D*q2*q2==1)
      return Result(p2,q2);
    
    b-=a*d;
    t1=b;t2=c;t3=d;
    b=-t1*t3;
    c=t2*t3;
    d=t2*t2*D-t1*t1;
    BigInt div=gcd(d,gcd(c,b));
    if(div!=1){
      b/=div;
      c/=div;
      d/=div;
    }
  }
}

void main(){
  BigInt a;
  a=to!BigInt(readln().chomp());

  writeln(init_pell_equ(a).x);
  writeln(init_pell_equ(a).y);
}




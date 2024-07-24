clear;clc;close all;

syms s;
bm = 4.6723;
jeq= 1.72;
kt=5.6627;
kw=6.2;
R=0.973;
L=0.0199;
A=[0,1,0;0,-bm/jeq,kt/jeq;0,-kw/L,-R/L];
%C=[1,0,0];
C=[1,0,0];
B=[0;0;1/L];
D=0;
poles=[-9.999,-9.9998,-9.9997];
K=ackerData(A,B,poles);

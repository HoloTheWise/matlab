function [Phi,pdA,K,S,G_max,w_max] = ackerData(A,B,poles)
syms s;

D=0;
pds=prod(s-poles);
pdscoef=double(coeffs(pds,'s','all'));
indx=length(pdscoef)-1;
pdA=pdscoef(end)*eye(indx);
C = [1 zeros(1, indx - 1)];
for i=1:indx
    pdA=pdA+pdscoef(i)*A^(indx-i+1);
end
Phi=B;
for i=1:indx-1
    Phi=[Phi A^i*B];
end
K_new=linspace(0,0,indx);
K_new(end) = 1;
K=K_new*inv(Phi)*pdA;
A_cl=A-B*K;
Ts=ss(A_cl,B,C,D);
Ts=tf(Ts);
S=1-Ts;
[G_max,w_max] = getPeakGain(S);
Phi
pdA
K
S
G_max
w_max
end
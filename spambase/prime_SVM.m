function [loss,gradient]=prime_SVM(w,xTr,yTr,lambda)
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
% loss function: \lambda w^Tw + max(1-y*w^T*x,0)
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);
loss = sum(max(1-yTr.*(w'*xTr),zeros(1,n)))+ lambda*w'*w;
D = diag(sign(max(1-yTr.*(w'*xTr),zeros(1,n))));
gradient = (-xTr * D*yTr')+2*lambda*w;

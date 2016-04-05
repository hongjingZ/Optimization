function [loss,gradient_w,gradient_b]=prime_SVM(w,b,xTr,yTr,lambda)
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0,dx1)
% b bias term default  1xn
% loss function: \lambda w^Tw + max(1-y*(w^T*x+b),0)
% OUTPUTS:
%
% loss = the total loss obtained with w,b on xTr and yTr
% gradient_w = the gradient at w
% gradient_b = the gradient at b

[d,n]=size(xTr);
loss = sum(max(1-yTr.*(w'*xTr+b),zeros(1,n)))+ lambda*w'*w;
D = diag(sign(max(1-yTr.*(w'*xTr+b),zeros(1,n))));
gradient_w = (-xTr * D*yTr')+2*lambda*w;
gradient_b = -yTr*D;

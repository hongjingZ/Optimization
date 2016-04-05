function [w] = train_primeSVM(xTr,yTr,lambda);
%function trainspamfilter(xTr,yTr);
% INPUT:	
% xTr
% yTr

[d,n] = size(xTr);
f = @(w,b) prime_SVM(w,b,xTr,yTr,lambda);
w0 = zeros(size(xTr,1),1); % initialize with all-zeros vector
b0 = zeros(1,size(xTr,2));
[w,b] = GD(f,w0,b0,1e-02,5000);
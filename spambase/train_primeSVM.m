function [w] = train_primeSVM(xTr,yTr,lambda);
%function trainspamfilter(xTr,yTr);
% INPUT:	
% xTr
% yTr

[d,n]=size(xTr);
f=@(w) prime_SVM(w,xTr,yTr,lambda);
w0=zeros(size(xTr,1),1); % initialize with all-zeros vector
w=GD(f,w0,1e-02,50000);
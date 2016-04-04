function [prediction,accuracy] = predict_SVM(xTe,yTe,w);
%function trainspamfilter(xTr,yTr);
% INPUT:	
% xTr
% yTr

[d,n]=size(xTe);
prediction = sign(w' * xTe);
correct = 0;
for i = 1:n
    if prediction(i) == yTe(i)
        correct = correct + 1;
    end
end
accuracy = correct / n;
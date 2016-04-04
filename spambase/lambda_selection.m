acc = zeros(1,7);
i = 1;
for lambda = [10^-3,10^-2,10^-1,10^0,10^1,10^2,10^3]
    w0 = train_primeSVM(xTr,yTr,lambda);
    [prediction,accuracy] = predict_SVM(xTv,yTv,w0);
    acc(i) = accuracy;
    i = i + 1;
end
    
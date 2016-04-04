load '/Users/hongjing/Documents/CSE543T/spambase/spambase.data';
%% Split data
spambase = spambase';
[d,n]=size(spambase);
k = randperm(n);
spambase = spambase(:,k);
X = spambase(1:end-1,:);
Y = spambase(end,:);
for i = 1:n
    if Y(i) == 0
        Y(i) = -1;
    end
end
itr=1:ceil(0.8*n);
ite=ceil(0.8*n)+1:n;
xTr=X(:,itr);
yTr=Y(:,itr);
xTv=X(:,ite);
yTv=Y(:,ite);
clear('itr','ite','n','d','k','spambase','X','Y');
%%

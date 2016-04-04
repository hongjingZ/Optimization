function [w]=GD(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end;
iter_num = 0;
[loss,gradient] = func(w0);
 while norm(gradient) >= tolerance && iter_num <= maxiter
     if iter_num == 0
         w = w0-stepsize*gradient;
         iter_num = iter_num+ 1;
     else
         w = w - stepsize * gradient;
         iter_num = iter_num+ 1;
     end
     [n_loss,n_gradient] = func(w);
     
     if n_loss < loss
         stepsize = stepsize * 1.01;%if decrease, we do nothing, increase the stepsize slightly    
         loss = n_loss;
         gradient = n_gradient;
     else
         w = w + stepsize*gradient;
         stepsize = stepsize * 0.5;%if increase, slow down and recover the last update.
     end

 end
 iter_num
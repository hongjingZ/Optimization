function [w,b]=GD(func,w0,b0,stepsize,maxiter,tolerance)
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

if nargin<6,tolerance=1e-02;end;
iter_num = 0;
[loss,gradient_w,gradient_b] = func(w0,b0);
 while norm(gradient_w) >= tolerance && iter_num <= maxiter
     if iter_num == 0
         w = w0 - stepsize * gradient_w;
         b = b0 - stepsize * gradient_b;
         iter_num = iter_num+ 1;
     else
         w = w - stepsize * gradient_w;
         b = b - stepsize * gradient_b; 
         iter_num = iter_num+ 1;
     end
     [n_loss,n_gradient_w,n_gradient_b] = func(w,b);
     
     if n_loss < loss
         stepsize = stepsize * 1.01;%if decrease, we do nothing, increase the stepsize slightly    
         loss = n_loss;
         gradient_w = n_gradient_w;
         gradient_b = n_gradient_b;
     else
         w = w + stepsize * gradient_w;
         b = b + stepsize * gradient_b
         stepsize = stepsize * 0.5;%if increase, slow down and recover the last update.
     end

 end
 iter_num
 loss
 norm(gradient_w)
 
 
function [theta,cost_val] = GradientDescent(X, y, theta, alpha, num_iters)

m = length(y);
cost_val = zeros(num_iters,1);

for i = 1:num_iters

    yHat = X * theta;
    theta = theta -  (alpha/m)  * ( X' * (yHat - y) );
    cost_val(i) = CostFunc(X, y, theta);

end

end


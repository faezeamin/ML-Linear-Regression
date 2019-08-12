function [theta,cost_val] = GradientDescentMulti(X, y, theta, alpha, num_iters)

m = length(y);
cost_val = zeros(num_iters,1);
for i = 1:num_iters
    
        theta = theta - alpha/m * X' * (X*theta - y);

        cost_val(i) = CostFunctionMulti(X,y,theta);
end

end


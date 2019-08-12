function [mu, sigma, norm_data] = FeatureNormalizer(X)
% this function normalizes the date X and returns mean and standard
% deviation of each feature as well as the normalized data points.

m = size(X,1);

mu = mean(X);
sigma = std(X);
norm_data = ( X - repmat(mu,m,1) ) ./ repmat (sigma,m,1);

end


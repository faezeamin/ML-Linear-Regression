% This program is linear regression algorithm. it gets training data in 
%the form of m*n matrix, where m is the number of data points, each has n 
%features. It gives theta using two methods: Gradient Descent and Normal
%Equation. The graph demonstrates the evolution of Cost Function across
%iterations.


clear all; close all; clc
data = load('dataB.txt');

% X is the matrix of training data of independent variable, and y is the
% dependent variable
m = size(data,1);
n = size(data,2);
X = data(:,1:n-1);
y = data(:,n);

% Normalizing features using Standatrs Deviation
[X_mu, X_sigma, X] = FeatureNormalizer(X);

X = [ones(m,1),X];

%Setting initialized values
theta = zeros(n,1);
alpha = .01;
num_iters = 400;

%Gradient Descent
[theta,cost_val] = GradientDescentMulti(X, y, theta, alpha, num_iters);

%reporting theta
fprintf ('theta computed using Gradient Descent is: \n');
fprintf( '%f \n', theta);
fprintf('\n');

%Plotting evolution of the Cost Function
figure;
plot(cost_val, '-g', 'linewidth',2);
xlabel('Number of Iterations');
ylabel('Cost J')

%predictiing the price of a house with arbitrary features using gradient Descent:
features = [1650, 3];
f_normalized = (features - X_mu) ./ X_sigma;
f_normalized = [1, f_normalized];
price = f_normalized * theta;

%Caculating theta using normal equation
X2 = data(:,1:n-1);
X2 = [ones(m,1),X2];
theta_norm = NormalEqu(X2,y);

%Reporting theta using normal equation
fprintf ('theta computed using Normal Equation is: \n')
fprintf ('%f \n',theta_norm)
fprintf('\n')



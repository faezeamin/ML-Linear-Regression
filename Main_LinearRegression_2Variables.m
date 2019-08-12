
%This program implements Linear Regression for two variables using Gradient 
%Descent to fit a linear model on the date and predict the dependent variable for 
%new unseen independent variable.
%In the output, you can see the graph of training data points and the 
%fitted linear line, the dynamics of Cost Function across iteration number,
%surface and contour plot of the Cost Function.
%The training dataset is generated.
%theta is the vector of coefficients in the model.

clear all; close all; clc

data = load('dataA.txt');

figure(1)
scatter(data(:,1),data(:,2),'gx');
xlabel('1st Variable')
ylabel('2nd Variable')

m = size (data, 1);
n = size (data, 2);
y = data(:,2);
X = [ones(m,1) , data(:,1)];

alpha = .01;
theta = zeros(2,1);
numIters = 1500;


[theta,costValue] = GradientDescent(X,y,theta,alpha,numIters);

hold on;
plot (X(:,2),X*theta,'r')
legend('data','model')


hold off
figure(2)
plot(costValue, 'm');
ylabel('cost function');
xlabel('iteration number')


%visualizing Cost Function
theta0 =  linspace(-10,10,100) ;
theta1 =  linspace(-1,4,40) ;

t = zeros(2,1);
c = zeros(length(theta0),length(theta1));
for i = 1:length(theta0)
    for j = 1:length(theta1)
        t = [theta0(i) ; theta1(j)];
        c(i,j) = CostFunc(X, y, t);
    end
end

c = c';
figure
surf (theta0,theta1,c);
ylabel('\theta_1');
xlabel('\theta_0');

figure
contour(theta0, theta1,c, logspace(-2, 3, 20))

%Reporting theta
fprintf ('theta computed using Gradient Discent is: \n')
fprintf ('%f \n',theta)
fprintf('\n')

% %an alternative for visualizing Cost Function
% [theta0, theta1] =  meshgrid(linspace(-10,10,100),linspace(-1,4,40)) ;
% 
% 
% t = zeros(2,1);
% c = zeros(size(theta1,1),size(theta0,2));
% XY = cat(3,theta0,theta1);
% for i = 1:size(theta0,1)
%     for j = 1:size(theta0,2)
%         t = [XY(i,j,1);XY(i,j,2)];
%         c(i,j) = CostFunc(X, y, t);
%     end
% end
% 
% figure
% surf (theta0,theta1,c);
% ylabel('\theta_1');
% xlabel('\theta_0');
% 
% figure
% contour(theta0, theta1,c, logspace(-2, 3, 20))
% 







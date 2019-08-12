function [theta] = NormalEqu(X,y)

theta = (X'*X) \ (X'*y);

end


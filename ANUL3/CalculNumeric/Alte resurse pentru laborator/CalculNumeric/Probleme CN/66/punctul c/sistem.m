function [f] = sistem(x)

f(1) = 1 + x(1) ^ 2 - x(2) ^ 2 + exp(x(1)) * cos(x(2));
f(2) = 2 * x(1) * x(2) + exp(x(1)) * sin(x(2));
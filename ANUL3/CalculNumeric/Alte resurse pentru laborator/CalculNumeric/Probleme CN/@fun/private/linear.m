function map = linear(ends)

a = ends(1); b = ends(2);
map = struct('for',@(y) b*(y+1)/2+a*(1-y)/2, ...
             'inv',@(x) (x-a)/(b-a)-(b-x)/(b-a), ...
             'der',@(y) (b-a)/2 + 0*y,'name','linear','par', ends) ;
    
% Note: writting the map in this form ensures that -1 is mapped to a and 1
% is mapped to b (in the presence of rounding errors).

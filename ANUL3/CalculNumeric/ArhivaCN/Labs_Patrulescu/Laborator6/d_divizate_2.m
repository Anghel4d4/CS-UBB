function  r = d_divizate_2(k)
    x = [1.3,1.6,1.9];
    f = [0.62,0.45,0.28];
    fd = [-0.52,-0.56,-0.58];
    n_z = 2*length(x);
    n = length(x);
    
    z = zeros(1,2*n)
    A = zeros(2*n,2*n)
    
    z(1:2:2*n-1) = x;
    z(2:2:2*n) = x;
    
    A(1:2:2*n-1,1) = f';
    A(2:2:2*n,1) = f';
    A(1:2:2*n-1,2)=fd';
   
    for i = 2:2:2*n-2
        A(i,2) = (A(i+1,1)-A(i,1))/(z(i+1)-z(i))
    end
    
    for j = 3:2*n
        for i=1:2*n-j+1
            A(i,j) = (A(i+1,j-1)-A(i,j-1))/(z(i+j-1)-z(i))
        end
    end
    
    A
    
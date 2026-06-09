function X = J(size, nr)
   a=[5 -1 0; -1 5 -1; 0 -1 5];
   b=[4 3 4]';
    rez = zeros(size,1);
    prev = zeros(size,1);
   
    y=prev(1);
    for k = 1:nr
        for i = 1:size
            s = 0;
            for j = 1:size
                if j ~= i
                    s = s + a(i,j)* y;
                end
            end
            y=prev(j);
            rez(i) = (1/a(i,i))*(b(i)-s);
            prev(i)= rez(i); 
        end
        
    end
    
    X = rez;
end
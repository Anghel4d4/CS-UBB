function X = gauss(size, nr)
   a=[5 -1 0; -1 5 -1; 0 -1 5];
   b=[4 3 4]';
    rez = zeros(size,1);
    prev = zeros(size,1);
   
    y=prev(1);
    for k = 1:nr
        for i = 1:size
            s1 = 0;
            s2=0;
            for j = 1:size
                if j ~= i
                    s1 = s1 + a(i,j)* prev(j);
                    if(j<size)
                        p=j+1;
                        s2= s2 +a(i,p)* y;
                    end
                end
            end
            y=prev(j);
            rez(i) = (1/a(i,i))*(b(i)-s1-s2);
            prev(i)= rez(i); 
        end
        
    end
    
    X = rez;
end
function errel()
    % pr 1 a
    % ; unde vreau sa se termine linia
    A = [10 7 8 7; 7 5 6 5; 8 6 10 9; 7 5 9 10];
    b = [32; 23; 33; 31];
    % bp- b perturbat
    bp = [32.1; 22.9; 33.1; 30.9];
    y = A\b;
    yp = A\bp;
    er1 = norm((b-bp),1)/norm(b,1)
    er2 = norm((y-yp),1)/norm(y,1)
    er2/er1
    %afisati nr de conditionare a matricii A, norma p=1
    cond(A,1)
end
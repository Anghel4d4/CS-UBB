function errelb()
    % 1 b
    % ; unde vreau sa se termine linia
    A = [10 7 8 7; 7 5 6 5; 8 6 10 9; 7 5 9 10];
    Ap = [10 7 8.1 7.2; 7.8 5.04 6 5; 8 5.98 9.89 9; 6.99 4.99 9 9.98];
    b = [32; 23; 33; 31];
    % \ - Matrix left divison
    y = A\b;
    yp = Ap\b;
    er1 = norm((A-Ap),1)/norm(A,1)
    er2 = norm((y-yp),1)/norm(y,1)
    er2/er1
    %afisati nr de conditionare a matricii A
    cond(A,1)
end
function Xs = NewtonRoot(Fun,FunDer,Xest,Err,imax)
    %fun the function
    %funder the derivative of fun
    %Xest an initial estimated root
    %Err the error
    %imax the max number of iterations
    for i=1:imax
        Xi = Xest - feval(Fun,Xest)/feval(FunDer,Xest);
        if abs((Xi - Xest)/Xest) < Err
            Xs = Xi;
            break
        end
        Xest = Xi;
    end
    if i == imax
        fprintf('Sol not obtained in %i iter', imax)
        Xs = ('No answer');
    end
end


function myexp1=myexp1(x)
  x=1;
  i=0;
  ti=[];
  
  while true
    elem_p=(x^i);
    elem_f=factorial(i);
    elem=elem_p/elem_f;
    
    ti=[ti elem];
    si=sum(ti);
    
    myabs_ti=abs(ti(i+1));
    myabs_si=abs(si);
    myabs=myabs_ti/myabs_si;
    
    if myabs<eps
      break;
    end
    
    i=i+1;
  end
  
  disp(i);
end

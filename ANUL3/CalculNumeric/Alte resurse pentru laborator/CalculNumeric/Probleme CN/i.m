function result = i(t)
    i0 = 100;
    t0 = 0.01;
  
    result = i0 * exp((-t/t0)) * sin(2*t/t0);
end
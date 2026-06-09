function val = v(X,Y,Z)
d = length(Z);
val=1:length(Z);
for i=1:d
      val(i) = interpL(X,Y,Z(i));
end

end
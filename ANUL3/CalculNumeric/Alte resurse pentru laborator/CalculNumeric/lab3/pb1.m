function pb1()

A = [10 7 8 7; 7 5 6 5; 8 6 10 9; 7 5 9 10]
b = [32; 23; 33; 31]
xe = A\b
inv(A)
format short
xe = A\b
inv(A)
det(A)
 
a) 
bp = [32.1; 22.9; 33.1; 30.9]
xep = A\bp
eri1 = norm(b-bp)/norm(b) -> eroare la intrare
ero1 = norm(xep-xe)/norm(xe) -> eroare la iesire
ero1/eri1 -> raportul erorilor
cond(A) -> conditionarea matricei

b)
 
  
end
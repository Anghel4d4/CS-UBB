%Problema 2.49. Implementati o procedura pentru inversarea unei matrice triunghiulare 
%inferior cu 1 pe diagonala principala. Testati-o pentru matricea

  %    [1 0 0 0
  %     3 1 0 0
  %     5 2 1 0
  %     7 4 -3 1]

U=[1 0 0 0
    3 1 0 0
    5 2 1 0
    7 4 -3 1];
	
% apelam functia invU pentru matricea U

Uinversa=invMatrice(U)

U*Uinversa


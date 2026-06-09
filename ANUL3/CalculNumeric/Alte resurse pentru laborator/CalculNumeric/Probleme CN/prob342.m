
%Sa se scrie o functie MATLAB pentru inversarea unei matrice Vandermonde
%utilizand proprietatile polinoamelor Lagrange fundamentale.
x=2:5; 
V=vander(x);
U=invvandermonde(x);

%verificare:
U*V
V*U
    
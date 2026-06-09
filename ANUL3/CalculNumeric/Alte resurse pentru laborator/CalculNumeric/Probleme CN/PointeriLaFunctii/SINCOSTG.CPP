#include<math.h>
#include<iostream.h>
#include<conio.h>

double (*fTable[]) (double) = {sin,cos,tan};

int main()
 {clrscr();
  for(int i=0;i<3;i++)
    cout << (*fTable[i])(30*M_PI/180)<<endl;
  getch();

 }
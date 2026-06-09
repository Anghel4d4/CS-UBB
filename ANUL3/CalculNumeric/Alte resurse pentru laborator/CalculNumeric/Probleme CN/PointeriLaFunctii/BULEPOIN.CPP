#include <iostream.h>
#include <conio.h>
#include <iomanip.h>
#define DIM 10

enum BOOL {false, true};

typedef BOOL (*functCmp) (int, int);    // tipul "BOOL functCmp(int,int)"

BOOL cresc (int a, int b)
	 { /*if (a>=b) return true;  mai clar si mai corect
		       return false;
	   */
	   return (a>=b);
	 }
BOOL descresc (int a, int b)
	 { return (a<=b);
	 }


void sortare( int x[], int n, functCmp f)
{ BOOL ind;			  // sortarea sirului
  int i,j,aux,poz;
  poz    = n-1;
     do
       { ind=true;
	 for (i=0;i<poz;i++)
	   if ( f( x[i],x[i+1]))
			{ aux    = x[i];
			  x[i]   = x[i+1];
			  x[i+1] = aux;
			  j      = i;
			  ind=false;
			}
	 poz=j;
       }
     while (!ind);
}

void citire( int x[], int &n)
{ int  i;
  n   = DIM;
  while  (n<0 || n>(DIM-1) )           // citirea dimensiunii
      { cout<<"\ndati lungime sir:";
	cin>>n;
      }
  for (i=0;i<n;i++)                     // citirea sirului
      { cout<<"x["<<i<<"]=";
	cin>>x[i];
      }
}

void tiparire( int x[], int n)
{ int i;				 // tiparirea sirului nesortat
  for(i=0;i<n;i++)
   { cout<<setw(5)<<x[i];
     if (!((i+1) % 5)) cout<<endl;
   }
}

int main()
   { clrscr();
     int a[]={0,3,44,2, 6};
     cout<<"cresc: "<<endl;
     sortare (a,5, cresc);
     tiparire(a,5);
     cout<<"descrec: "<<endl;
     sortare (a, 5, descresc);
     tiparire(a,5);
     getch();
     return 1;
   }

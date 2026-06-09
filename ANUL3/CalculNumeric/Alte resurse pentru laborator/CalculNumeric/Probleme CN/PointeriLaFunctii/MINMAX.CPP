#include <iostream.h>
#include <conio.h>

enum BOOL {false, true};

typedef BOOL (*FunCmp) (int, int);

BOOL min (int a, int b)
	 {return a<b;}

BOOL max (int a, int b)
	 {return a>b;}

int determine(int x[], int n, FunCmp f)
    { int m=x[0];
      for(int i=1; i<n; i++)
	if ( f(x[i], m) ) m=x[i];
      return m;
    }

int main()
   { clrscr();
     int a[]={0,3,44,2, 6};
     cout<<"Min: "<<determine(a, 5, min)<<endl;
     cout<<"Max: "<<determine(a, 5, max);
     getch();
     return 1;
   }



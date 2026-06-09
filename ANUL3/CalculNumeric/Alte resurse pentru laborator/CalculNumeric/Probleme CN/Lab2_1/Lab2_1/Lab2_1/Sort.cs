using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SortareApplication
{
    class Sort
    {

        public delegate bool FunCmp(int a, int b);
        public void buble(FunCmp f,int nr, int[] v)
        {
            Boolean flag;				 // sortarea secventei
            int i, temp, poz, pozInter;
            poz = nr - 2;
            pozInter = 0;
            do
            {
                flag = true;
                for (i = 0; i <= poz; i++)
                    if ( f(v[i], v[i+1]))
                    {
                        temp = v[i];
                        v[i] = v[i + 1];
                        v[i + 1] = temp;
                        pozInter = i;
                        flag = false;
                    }
                poz = pozInter;
            }
            while (!flag);
            
        }

       
  public void numarare(FunCmp f,int nc, int[] K)
{ int i,j,aux;
      int[] NR =new int[30];
      for (i = 0; i < nc; i++)
          NR[i] = 1;
      for (i=0; i<nc-1; i++)
          for (j=i+1; j<nc; j++)
              if (f(K[i], K[j]))	
                  NR[j]++;
              else			
                  NR[i]++;
      for (i=0; i<nc; i++)
          if (NR[i]!=i)
		{ j=i;
		  while (NR[j] !=i) 
              j=NR[j];
		  
         aux=K[i];
		  K[i]=K[j];
		  K[j]=aux;
		  NR[j]=NR[i];
		  NR[i]=i;
		}
}
  

  public int  lungimeS, dimHeap;

  public bool min(int a, int b)
  { return a < b; }

  public bool max(int a, int b)
  { return a > b; }

  void reMakeHeap(int i, FunCmp f,int n,int[] S)
  {
      int l, r, maxim, aux;
      l = i << 1;
      r = l + 1;
      if ((l <= dimHeap) && f(S[l], S[i])) maxim = l;
      else maxim = i;
      if ((r <= dimHeap) && f(S[r], S[maxim])) maxim = r;
      if (maxim != i)
      {
          aux = S[i];
          S[i] = S[maxim];
          S[maxim] = aux;
          reMakeHeap(maxim, f,n,S);
      }
  }

  void builtHeap(FunCmp f,int n, int[] v)
  {
      int i;
      dimHeap = lungimeS;
      for (i = lungimeS / 2; i >= 1; i--) reMakeHeap(i, f, n, v);
  }

  public void SortHeap(FunCmp f,int n, int[] S)
  {
      int i, aux;
      builtHeap(f,n,S);
      for (i = lungimeS; i >= 2; i--)
      {
          aux = S[i];
          S[i] = S[1];
          S[1] = aux;
          dimHeap = dimHeap - 1;
          reMakeHeap(1, f,n,S);
      }
  }

        public void insertSort(FunCmp f, int n, int[] T)		// functia care implementeaza
        {int i,j,temp;				// algoritmul
            for (j=1; j<n; j++)			// ciclul dupa variabila j=2..n
            {temp=T[j]; 			// se salveaza T[j] in temp
                i=j-1;				// se intializeaza i cu j-1 pentru
                while (i >= 0 && f(T[i], temp))		// a parcurege subsecventa spre stanga
                { T[i+1]=T[i];			// cat timp temp<T[i]
                    i--;
                }
                T[i+1]=temp;			// cand temp>T[i] sau i=0 atunci se pune
            }					// pe pozitia i+1 valoarea lui temp
        }	
        


        public void mathSort(FunCmp f, int nc, int[] T)
        {
            int i, j, temp;				
            for (j = 1; j < nc; j++)			
            {
                temp = T[j]; 			
                i = j - 1;				
                while (i >= 0 && f(T[i], temp))		
                {
                    T[i + 1] = T[i];			
                    i--;
                }
                T[i + 1] = temp;			
            }					
        }	

       


       //merge sort

        public void comb(FunCmp f, int inf, int mijloc, int sup, int[] x)
          {int i,j,k,l;
            int[] y=new int[50];
            i=k=inf;
            j=mijloc+1;
            while ( i<=mijloc && j<=sup)
                if (f(x[i],x[j])) 
                    y[k++]=x[i++];
                else	 
                    y[k++]=x[j++];
            for(l=i;   l<=mijloc; y[k++]=x[l++]);
            for(l=j;   l<=sup;    y[k++]=x[l++]);
            for(k=inf; k<=sup;    x[k++]=y[k]);
        }

      public  void di(FunCmp f, int p, int q, int[] x)
        {
            int m;
            if (p < q)
            {
                m = (p + q) / 2;
                di(f,p, m,x);
                di(f, m + 1, q,x);
                comb(f,p, m, q, x);
            }
        }
      
      

      public void inter(FunCmp f, int n, int[] x)
      {
          di(f,0, n-1, x);
      }
      

      public void quik(FunCmp f, int st, int dr, int[] x)
      {
          int i, j, y;
          i = st; j = dr; y = x[i];
          do
          {
              while ((f(x[j],y)) && (i < j)) j--;
              x[i] = x[j];
              while ((f(y,x[i])) && (i < j)) i++;
              x[j] = x[i];
          }
          while (i != j);
          x[i] = y;
          if (st < i - 1) quik(f,st, i - 1,x);
          if (i + 1 < dr) quik(f,i + 1, dr,x);
          x[j] = x[i];
      }
      
      public void sort_qk(FunCmp f, int n, int[] v)
      {
          quik(f,0, n-1, v);
      }
       

   public void SelectieC (FunCmp f, int n, int[] T)
{ int i,j,aux;
  for (i=0; i<n-1; i++)
      for (j=i+1; j<n; j++)
	if (f(T[i],T[j]))
    {
        aux=T[j];
	    T[j]=T[i];
		T[i]=aux;
	}
}
   
   


               
        
    }
}

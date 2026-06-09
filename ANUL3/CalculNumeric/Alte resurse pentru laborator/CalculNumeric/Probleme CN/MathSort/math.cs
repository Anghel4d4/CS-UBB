using System;
using System.IO;

public class MINMAX
 {  public int[] K  = new int[101];
    public int[] VK = new int[101];
    public int[] NR = new int[101];

    public int n;
    public int u=1;
    public int v=100
    
    public void mathSort(int nc, int K[])
     { int i,j;
       for (i=1; i<=100; i++)   NR[i]=0;
       for (j=1; j<=n;  j++)  NR[K[j]]=NR[K[j]]+1;
       for (i=2; i<=v; i++)   NR[i]=NR[i]+NR[i-1];

       for (j=n; j>=1; j--)
    		{       i=NR[K[j]];
                    VK[i]=K[j];
                 NR[K[j]]=i-1;
                }
       for (i=1; i<=nc; i++) K[i]=VK[i];
      }
    public void tipar()
    {
        int i;
        for (i = 1; i <= n; i++)
        {
            Console.Write(K[i] + " ");
            if ((i % 10) == 0) Console.WriteLine();
        }
    }


}



public class TestD
 { 
  public static void Main()
   { 
     MINMAX MM=new MINMAX();

     Console.Write("MA, dati cate:");
     MM.n=Int32.Parse(Console.ReadLine());
     for (int i = 1; i <= MM.n; i++)
     { Console.Write("x[" + i + "]="); 
       MM.x[i] = Int32.Parse(Console.ReadLine());
     }
     MM.mathSort();
     MM.tipar();    
    Console.ReadLine();
   }
}



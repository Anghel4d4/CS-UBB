using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SortareApplication;

namespace WindowsFormsApplication1
{
    public partial class SortariWin : Form
    {
        
        private int[] vect = new int[50];
        private int n;

        public void initializare()
        {
            n = 0;
            vect[0] = 0;
         
        }

        public SortariWin()
        {
            InitializeComponent();
        }

        private void input_buton_Click(object sender, EventArgs e)
        {
            String s;

            input_list.Items.Add(vect_text.Text);
            s = vect_text.Text;
            vect[n] = int.Parse(s);
            n++;
            vect_text.Clear();

        }

        private void sort_buton_Click(object sender, EventArgs e)
        {
            String s;
            sorteaza();
            rez_text.Clear();

            for (int i = 0; i < n; i++)
            {
                s = vect[i].ToString();
                rez_text.AppendText(" " + s);
            }

               
            
        }
      

        public void sorteaza()
        {
                        
            Sort ob=new Sort();
            switch(tip_combo.SelectedItem.ToString()){

                case "Buble Sort":
            
                
                if (mod_combo.SelectedItem.Equals("Crescator"))
                                  
                        ob.buble(ob.max,n,vect);
                
                else                      
                       ob.buble(ob.min,n,vect);
                 break;  
                  
            
                case "Count sort":
            
             if (mod_combo.SelectedItem.Equals("Crescator"))
                                  
                 ob.numarare(ob.max,n,vect);       
                 
                
                else                      
                       ob.numarare(ob.min,n,vect);  
             break;      
            
                case "Heap Sort":
            
                if (mod_combo.SelectedItem.Equals("Crescator"))
                {ob.dimHeap=n;
                    ob.lungimeS=n;
                   
                    ob.SortHeap(ob.max,n,vect);
                }
                else
                    {ob.dimHeap=n;
                    ob.lungimeS=n;
                   
                    ob.SortHeap(ob.min,n,vect);
                     }
                    
                break;
                case "Insert Sort":

                if (mod_combo.SelectedItem.Equals("Crescator"))

                    ob.insertSort(ob.max,n,vect);
                    

                else
                   ob.insertSort(ob.min,n,vect);
                break;
                case "Math Sort":

                if (mod_combo.SelectedItem.Equals("Crescator"))

                    ob.mathSort(ob.max,n,vect);

                else
                   ob.mathSort(ob.min,n,vect);
                break;
                case "Merge Sort":

                if (mod_combo.SelectedItem.Equals("Crescator"))

                    ob.inter(ob.max,n,vect);
                    

                else
                   ob.inter(ob.min,n,vect);
                break;
                case "Quiq Sort":

                if (mod_combo.SelectedItem.Equals("Crescator"))
                    ob.sort_qk(ob.max,n,vect);
                    //determine(ob.sort_qk_cres);

                else
                   // determine(ob.sort_qk_des);
                    ob.sort_qk(ob.min,n,vect);
                break;
                case "Select Sort":

                if (mod_combo.SelectedItem.Equals("Crescator"))
                    ob.SelectieC(ob.max, n, vect);
                //determine(ob.SelectieC);

                else
                    ob.SelectieC(ob.min, n, vect);
                    // determine(ob.SelectieD);
                    break;
  
            
        }
        }


        
    }
}

namespace WindowsFormsApplication1
{
    partial class SortariWin
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.sort_buton = new System.Windows.Forms.Button();
            this.tip_combo = new System.Windows.Forms.ComboBox();
            this.tip_label = new System.Windows.Forms.Label();
            this.mod_label = new System.Windows.Forms.Label();
            this.mod_combo = new System.Windows.Forms.ComboBox();
            this.input_label = new System.Windows.Forms.Label();
            this.rez_text = new System.Windows.Forms.TextBox();
            this.rez_label = new System.Windows.Forms.Label();
            this.input_list = new System.Windows.Forms.ListBox();
            this.input_buton = new System.Windows.Forms.Button();
            this.vect_text = new System.Windows.Forms.TextBox();
            this.vect_label = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // sort_buton
            // 
            this.sort_buton.Location = new System.Drawing.Point(27, 178);
            this.sort_buton.Name = "sort_buton";
            this.sort_buton.Size = new System.Drawing.Size(104, 29);
            this.sort_buton.TabIndex = 0;
            this.sort_buton.Text = "Sorteaza";
            this.sort_buton.UseVisualStyleBackColor = true;
            this.sort_buton.Click += new System.EventHandler(this.sort_buton_Click);
            // 
            // tip_combo
            // 
            this.tip_combo.FormattingEnabled = true;
            this.tip_combo.Items.AddRange(new object[] {
            "Buble Sort",
            "Count sort",
            "Heap Sort",
            "Insert Sort",
            "Math Sort",
            "Quiq Sort",
            "Merge Sort",
            "Select Sort"});
            this.tip_combo.Location = new System.Drawing.Point(27, 42);
            this.tip_combo.Name = "tip_combo";
            this.tip_combo.Size = new System.Drawing.Size(105, 21);
            this.tip_combo.TabIndex = 1;
            // 
            // tip_label
            // 
            this.tip_label.AutoSize = true;
            this.tip_label.Location = new System.Drawing.Point(24, 14);
            this.tip_label.Name = "tip_label";
            this.tip_label.Size = new System.Drawing.Size(80, 13);
            this.tip_label.TabIndex = 2;
            this.tip_label.Text = "Tipul de sortare";
            // 
            // mod_label
            // 
            this.mod_label.AutoSize = true;
            this.mod_label.Location = new System.Drawing.Point(188, 14);
            this.mod_label.Name = "mod_label";
            this.mod_label.Size = new System.Drawing.Size(78, 13);
            this.mod_label.TabIndex = 3;
            this.mod_label.Text = "Mod de sortare";
            // 
            // mod_combo
            // 
            this.mod_combo.FormattingEnabled = true;
            this.mod_combo.Items.AddRange(new object[] {
            "Crescator",
            "Descrescator"});
            this.mod_combo.Location = new System.Drawing.Point(191, 42);
            this.mod_combo.Name = "mod_combo";
            this.mod_combo.Size = new System.Drawing.Size(104, 21);
            this.mod_combo.TabIndex = 4;
            // 
            // input_label
            // 
            this.input_label.AutoSize = true;
            this.input_label.Location = new System.Drawing.Point(24, 91);
            this.input_label.Name = "input_label";
            this.input_label.Size = new System.Drawing.Size(189, 13);
            this.input_label.TabIndex = 6;
            this.input_label.Text = "Introdu sirul (cate un nr pe fiecare linie)";
            // 
            // rez_text
            // 
            this.rez_text.Location = new System.Drawing.Point(27, 265);
            this.rez_text.Name = "rez_text";
            this.rez_text.Size = new System.Drawing.Size(264, 20);
            this.rez_text.TabIndex = 7;
            // 
            // rez_label
            // 
            this.rez_label.AutoSize = true;
            this.rez_label.Location = new System.Drawing.Point(24, 238);
            this.rez_label.Name = "rez_label";
            this.rez_label.Size = new System.Drawing.Size(46, 13);
            this.rez_label.TabIndex = 8;
            this.rez_label.Text = "Rezultat";
            // 
            // input_list
            // 
            this.input_list.FormattingEnabled = true;
            this.input_list.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.input_list.Location = new System.Drawing.Point(25, 116);
            this.input_list.Name = "input_list";
            this.input_list.Size = new System.Drawing.Size(200, 43);
            this.input_list.TabIndex = 9;
            // 
            // input_buton
            // 
            this.input_buton.Location = new System.Drawing.Point(261, 130);
            this.input_buton.Name = "input_buton";
            this.input_buton.Size = new System.Drawing.Size(99, 29);
            this.input_buton.TabIndex = 10;
            this.input_buton.Text = "Stocare";
            this.input_buton.UseVisualStyleBackColor = true;
            this.input_buton.Click += new System.EventHandler(this.input_buton_Click);
            // 
            // vect_text
            // 
            this.vect_text.Location = new System.Drawing.Point(328, 178);
            this.vect_text.Name = "vect_text";
            this.vect_text.Size = new System.Drawing.Size(32, 20);
            this.vect_text.TabIndex = 11;
            // 
            // vect_label
            // 
            this.vect_label.AutoSize = true;
            this.vect_label.Location = new System.Drawing.Point(214, 181);
            this.vect_label.Name = "vect_label";
            this.vect_label.Size = new System.Drawing.Size(108, 13);
            this.vect_label.TabIndex = 12;
            this.vect_label.Text = "Elementele vectorului";
            // 
            // SortariWin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(375, 352);
            this.Controls.Add(this.vect_label);
            this.Controls.Add(this.vect_text);
            this.Controls.Add(this.input_buton);
            this.Controls.Add(this.input_list);
            this.Controls.Add(this.rez_label);
            this.Controls.Add(this.rez_text);
            this.Controls.Add(this.input_label);
            this.Controls.Add(this.mod_combo);
            this.Controls.Add(this.mod_label);
            this.Controls.Add(this.tip_label);
            this.Controls.Add(this.tip_combo);
            this.Controls.Add(this.sort_buton);
            this.Name = "SortariWin";
            this.Text = "SortariWin";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button sort_buton;
        private System.Windows.Forms.ComboBox tip_combo;
        private System.Windows.Forms.Label tip_label;
        private System.Windows.Forms.Label mod_label;
        private System.Windows.Forms.ComboBox mod_combo;
        private System.Windows.Forms.Label input_label;
        private System.Windows.Forms.TextBox rez_text;
        private System.Windows.Forms.Label rez_label;
        private System.Windows.Forms.Button input_buton;
        private System.Windows.Forms.ListBox input_list;
        private System.Windows.Forms.TextBox vect_text;
        private System.Windows.Forms.Label vect_label;
    }
}


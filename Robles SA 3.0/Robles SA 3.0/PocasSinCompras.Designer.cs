
namespace Robles_SA_3._0
{
    partial class PocasSinCompras
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
            this.label1 = new System.Windows.Forms.Label();
            this.grdPocasSinCompras = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.grdPocasSinCompras)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(25, 88);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(1013, 50);
            this.label1.TabIndex = 9;
            this.label1.Text = "Consulta que entrega los contactos de los clientes que hace más de 1 año que no c" +
    "ompran productos o \r\naquellos que nunca realizaron una compra.";
            // 
            // grdPocasSinCompras
            // 
            this.grdPocasSinCompras.AllowUserToAddRows = false;
            this.grdPocasSinCompras.AllowUserToDeleteRows = false;
            this.grdPocasSinCompras.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(49)))), ((int)(((byte)(66)))), ((int)(((byte)(82)))));
            this.grdPocasSinCompras.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.grdPocasSinCompras.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdPocasSinCompras.Location = new System.Drawing.Point(161, 205);
            this.grdPocasSinCompras.Name = "grdPocasSinCompras";
            this.grdPocasSinCompras.Size = new System.Drawing.Size(743, 319);
            this.grdPocasSinCompras.TabIndex = 8;
            // 
            // PocasSinCompras
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(49)))), ((int)(((byte)(66)))), ((int)(((byte)(82)))));
            this.ClientSize = new System.Drawing.Size(1064, 647);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.grdPocasSinCompras);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "PocasSinCompras";
            this.Text = "PocasSinCompras";
            this.Load += new System.EventHandler(this.PocasSinCompras_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grdPocasSinCompras)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView grdPocasSinCompras;
    }
}
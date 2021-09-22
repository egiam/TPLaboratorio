
namespace Robles_SA_3._0
{
    partial class TopVendedores
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
            this.grdTopVendedores = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.grdTopVendedores)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(256, 116);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(567, 25);
            this.label1.TabIndex = 13;
            this.label1.Text = "Consulta que entrega los vendedores que vendieron más.";
            // 
            // grdTopVendedores
            // 
            this.grdTopVendedores.AllowUserToAddRows = false;
            this.grdTopVendedores.AllowUserToDeleteRows = false;
            this.grdTopVendedores.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(49)))), ((int)(((byte)(66)))), ((int)(((byte)(82)))));
            this.grdTopVendedores.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.grdTopVendedores.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdTopVendedores.Location = new System.Drawing.Point(163, 219);
            this.grdTopVendedores.Name = "grdTopVendedores";
            this.grdTopVendedores.Size = new System.Drawing.Size(743, 319);
            this.grdTopVendedores.TabIndex = 12;
            // 
            // TopVendedores
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(49)))), ((int)(((byte)(66)))), ((int)(((byte)(82)))));
            this.ClientSize = new System.Drawing.Size(1064, 647);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.grdTopVendedores);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "TopVendedores";
            this.Text = "TopVendedores";
            this.Load += new System.EventHandler(this.TopVendedores_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grdTopVendedores)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView grdTopVendedores;
    }
}
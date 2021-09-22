
namespace Robles_SA_3._0
{
    partial class Clientes2020
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
            this.grdClientes2020 = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.grdClientes2020)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(50, 103);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(972, 50);
            this.label1.TabIndex = 13;
            this.label1.Text = "Consulta que entrega nombre y apellido que compraron en el año 2020, ordenados al" +
    "fabéticamente \r\n(en forma descendente) por apellido.";
            // 
            // grdClientes2020
            // 
            this.grdClientes2020.AllowUserToAddRows = false;
            this.grdClientes2020.AllowUserToDeleteRows = false;
            this.grdClientes2020.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(49)))), ((int)(((byte)(66)))), ((int)(((byte)(82)))));
            this.grdClientes2020.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.grdClientes2020.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdClientes2020.Location = new System.Drawing.Point(163, 219);
            this.grdClientes2020.Name = "grdClientes2020";
            this.grdClientes2020.Size = new System.Drawing.Size(743, 319);
            this.grdClientes2020.TabIndex = 12;
            // 
            // Clientes2020
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(49)))), ((int)(((byte)(66)))), ((int)(((byte)(82)))));
            this.ClientSize = new System.Drawing.Size(1064, 647);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.grdClientes2020);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "Clientes2020";
            this.Text = "Clientes2020";
            this.Load += new System.EventHandler(this.Clientes2020_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grdClientes2020)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView grdClientes2020;
    }
}
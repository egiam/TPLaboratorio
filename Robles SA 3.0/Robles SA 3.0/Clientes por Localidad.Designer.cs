
namespace Robles_SA_3._0
{
    partial class Clientes_por_Localidad
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
            this.grdClientesLocalidad = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.grdClientesLocalidad)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(86, 127);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(908, 25);
            this.label1.TabIndex = 13;
            this.label1.Text = "Consulta que entrega las localidades en sus respectivas provincias y su cantidad " +
    "de clientes.";
            // 
            // grdClientesLocalidad
            // 
            this.grdClientesLocalidad.AllowUserToAddRows = false;
            this.grdClientesLocalidad.AllowUserToDeleteRows = false;
            this.grdClientesLocalidad.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(49)))), ((int)(((byte)(66)))), ((int)(((byte)(82)))));
            this.grdClientesLocalidad.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.grdClientesLocalidad.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdClientesLocalidad.Location = new System.Drawing.Point(171, 239);
            this.grdClientesLocalidad.Name = "grdClientesLocalidad";
            this.grdClientesLocalidad.Size = new System.Drawing.Size(743, 319);
            this.grdClientesLocalidad.TabIndex = 12;
            // 
            // Clientes_por_Localidad
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(49)))), ((int)(((byte)(66)))), ((int)(((byte)(82)))));
            this.ClientSize = new System.Drawing.Size(1080, 686);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.grdClientesLocalidad);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "Clientes_por_Localidad";
            this.Text = "Clientes_por_Localidad";
            this.Load += new System.EventHandler(this.Clientes_por_Localidad_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grdClientesLocalidad)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView grdClientesLocalidad;
    }
}
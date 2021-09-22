
namespace Robles_SA_3._0
{
    partial class VentasMayoristas
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
            this.grdVentasMay = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.grdVentasMay)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(59, 89);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(952, 50);
            this.label1.TabIndex = 11;
            this.label1.Text = "Consulta que entrega un reporte con los datos de la facturación, incluido el nomb" +
    "re del vendedor, \r\nsólo de las ventas mayoristas.";
            // 
            // grdVentasMay
            // 
            this.grdVentasMay.AllowUserToAddRows = false;
            this.grdVentasMay.AllowUserToDeleteRows = false;
            this.grdVentasMay.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(49)))), ((int)(((byte)(66)))), ((int)(((byte)(82)))));
            this.grdVentasMay.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.grdVentasMay.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdVentasMay.Location = new System.Drawing.Point(166, 200);
            this.grdVentasMay.Name = "grdVentasMay";
            this.grdVentasMay.Size = new System.Drawing.Size(743, 319);
            this.grdVentasMay.TabIndex = 10;
            // 
            // VentasMayoristas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(49)))), ((int)(((byte)(66)))), ((int)(((byte)(82)))));
            this.ClientSize = new System.Drawing.Size(1064, 647);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.grdVentasMay);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "VentasMayoristas";
            this.Text = "VentasMayoristas";
            this.Load += new System.EventHandler(this.VentasMayoristas_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grdVentasMay)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView grdVentasMay;
    }
}
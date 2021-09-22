using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.Data.SqlClient;

namespace Robles_SA_3._0
{
    public partial class frmRoblesSA : Form
    {
        SqlConnection conexion = new SqlConnection(@"Data Source=IDEAPAD-L340\SQLEXPRESS;Initial Catalog='ROBLES S.A 2.0';Integrated Security=True");
        SqlCommand comando = new SqlCommand();
        DataTable tabla = new DataTable();

        public frmRoblesSA()
        {
            InitializeComponent();
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnMaximizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Maximized;
            btnMaximizar.Visible = false;
            btnRestaurar.Visible = true;
        }

        private void btnRestaurar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Normal;
            btnRestaurar.Visible = false;
            btnMaximizar.Visible = true;
        }

        private void btnMinimizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;

        }

        private void PanelContenedor_Paint(object sender, PaintEventArgs e)
        {
            //AbrirFormEnPanel(new Inicio());
        }
        
        private void frmRoblesSA_Load(object sender, EventArgs e)
        {
            btnIcono_Click(null, e);
        }
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);

        private void BarraTitulo_Movimiento(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void SubmenuSQL_Paint(object sender, PaintEventArgs e)
        {
            //SubmenuSQL.Visible = true;
        }

        private void btnClientes_Click(object sender, EventArgs e)
        {
            SubmenuSQL.Visible = false;
            AbrirFormEnPanel(new Clientes());
        }

        private void btnProductos_Click(object sender, EventArgs e)
        {
            SubmenuSQL.Visible = false;
            AbrirFormEnPanel(new Productos());
        }

        private void btnVendedores_Click(object sender, EventArgs e)
        {
            SubmenuSQL.Visible = false;
            AbrirFormEnPanel(new Vendedores());
        }

        private void btnFacturas_Click(object sender, EventArgs e)
        {
            SubmenuSQL.Visible = false;
            AbrirFormEnPanel(new frmFacturas());
        }

        private void btnSQL_Click(object sender, EventArgs e)
        {
            SubmenuSQL.Visible = true;
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void AbrirFormEnPanel(object formhija)
        {
            if (this.PanelContenedor.Controls.Count > 0) //Verificar si existe algun control
                this.PanelContenedor.Controls.RemoveAt(0); //Eliminar el control existente
            Form fh = formhija as Form; //Crear formulario
            fh.TopLevel = false; //Para decir q es un formulario secundario
            fh.Dock = DockStyle.Fill;
            this.PanelContenedor.Controls.Add(fh);
            this.PanelContenedor.Tag = fh;
            fh.Show();

        }

        private void btnClientesLocalidad_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new Clientes_por_Localidad());
        }

        private void btnIcono_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new Inicio());
        }

        private void btnHome_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new Inicio());
        }

        private void btnTopVen_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new TopVendedores());
        }

        private void btnClientes2020_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new Clientes2020());
        }

        private void btnContactosUsados_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new ContactosUtilizados());
        }

        private void btnProductosComprados_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new ProductosComprados());
        }

        private void btnVentasMay_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new VentasMayoristas());
        }

        private void btnSinCompras_Click(object sender, EventArgs e)
        {
            AbrirFormEnPanel(new PocasSinCompras());
        }

    }
}

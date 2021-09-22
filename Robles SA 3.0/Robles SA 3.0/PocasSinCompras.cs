using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Robles_SA_3._0
{
    public partial class PocasSinCompras : Form
    {
        public PocasSinCompras()
        {
            InitializeComponent();
        }

        private void PocasSinCompras_Load(object sender, EventArgs e)
        {
            string select = "select c.apellido Clientes, f.fecha 'Fecha de última compra', co.contacto " +
                "from clientes c join contactos co on c.id_cliente = co.id_cliente left " +
                "join facturas f on f.id_cliente = c.id_cliente " +
                "where datediff(year, f.fecha, getdate()) > 1 or f.nro_factura is null " +
                "order by   f.fecha desc";
            consultar(select);
        }

        SqlConnection conexion = new SqlConnection(@"Data Source=IDEAPAD-L340\SQLEXPRESS;Initial Catalog='ROBLES S.A 2.0';Integrated Security=True");
        SqlCommand comando = new SqlCommand();
        DataTable tabla = new DataTable();

        private void consultar(string select)
        {
            grdPocasSinCompras.DataSource = consultarTabla(select);
        }

        private DataTable consultarTabla(string select)
        {
            conexion.Open();

            comando.Connection = conexion;
            comando.CommandType = CommandType.Text;
            comando.CommandText = select;
            DataTable tabla = new DataTable();
            tabla.Load(comando.ExecuteReader());

            conexion.Close();

            return tabla;
        }
    }
}

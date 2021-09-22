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
    public partial class Clientes2020 : Form
    {
        public Clientes2020()
        {
            InitializeComponent();
        }

        private void Clientes2020_Load(object sender, EventArgs e)
        {
            select = "select c.nombre+', '+c.apellido as 'Clientes 2020',f.fecha Fecha " +
                "from facturas f, clientes c " +
                "where c.id_cliente = f.id_cliente and year(f.fecha) = 2020 " +
                "order by apellido asc, nombre";
            consultar(select);
        }

        SqlConnection conexion = new SqlConnection(@"Data Source=IDEAPAD-L340\SQLEXPRESS;Initial Catalog='ROBLES S.A 2.0';Integrated Security=True");
        SqlCommand comando = new SqlCommand();
        DataTable tabla = new DataTable();
        string select;

        private void consultar(string select)
        {
            grdClientes2020.DataSource = consultarTabla(select);
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

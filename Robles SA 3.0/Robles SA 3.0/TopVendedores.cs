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
    public partial class TopVendedores : Form
    {
        public TopVendedores()
        {
            InitializeComponent();
        }

        private void TopVendedores_Load(object sender, EventArgs e)
        {
            select = "select top 5 v.apellido+', '+v.nombre Vendedor, count(f.legajo_vendedor) as 'Cantidad de Ventas', sum(d.precio*cantidad) as 'Dinero Recaudado'" +
                "from vendedores v " +
                "inner join facturas f on v.legajo_vendedor = f.legajo_vendedor " +
                "inner join detalles d on f.nro_factura = d.nro_factura " +
                "inner join productos p on d.cod_producto = p.cod_producto " +
                "group by v.apellido, v.nombre " +
                "order by[Dinero Recaudado] desc";
            consultar(select);
        }

        SqlConnection conexion = new SqlConnection(@"Data Source=IDEAPAD-L340\SQLEXPRESS;Initial Catalog='ROBLES S.A 2.0';Integrated Security=True");
        SqlCommand comando = new SqlCommand();
        DataTable tabla = new DataTable();
        string select;

        private void consultar(string select)
        {
            grdTopVendedores.DataSource = consultarTabla(select);
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

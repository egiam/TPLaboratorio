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
    public partial class ProductosComprados : Form
    {
        public ProductosComprados()
        {
            InitializeComponent();
        }

        private void ProductosComprados_Load(object sender, EventArgs e)
        {
            select = "select c.nombre+', '+c.apellido 'Nombre Cliente', f.nro_factura, p.descripcion, p.precio 'Precio > 6000'" +
                "from clientes c " +
                "join facturas f on c.id_cliente = f.id_cliente " +
                "join detalles d on f.nro_factura = d.nro_factura " +
                "join productos p on d.cod_producto = p.cod_producto " +
                "where p.precio > 6000" +
                "order by [Nombre Cliente], f.nro_factura";
            consultar(select);
        }

        SqlConnection conexion = new SqlConnection(@"Data Source=IDEAPAD-L340\SQLEXPRESS;Initial Catalog='ROBLES S.A 2.0';Integrated Security=True");
        SqlCommand comando = new SqlCommand();
        DataTable tabla = new DataTable();
        string select;

        private void consultar(string select)
        {
            grdProductosComp.DataSource = consultarTabla(select);
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

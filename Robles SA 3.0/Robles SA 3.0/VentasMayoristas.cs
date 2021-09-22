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
    public partial class VentasMayoristas : Form
    {
        public VentasMayoristas()
        {
            InitializeComponent();
        }

        private void VentasMayoristas_Load(object sender, EventArgs e)
        {
            select = "select    f.nro_factura, f.fecha, v.nombre+', '+v.apellido Vendedor, df.precio, df.cantidad, p.descripcion,df.cantidad * df.precio Subtotal,(df.cantidad * df.precio)*0.2 Descuento,(df.cantidad * df.precio)*0.8 Total, tv.tipo_venta " +
                "from facturas f join vendedores v on f.legajo_vendedor = v.legajo_vendedor " +
                "join detalles df on df.nro_factura = f.nro_factura " +
                "join productos p on df.cod_producto = p.cod_producto " +
                "join tipos_venta tv on tv.id_tipo_venta = f.id_tipo_venta " +
                "where tv.tipo_venta = 'Mayorista'";// and year(f.fecha) > 2010";
            consultar(select);
        }

        SqlConnection conexion = new SqlConnection(@"Data Source=IDEAPAD-L340\SQLEXPRESS;Initial Catalog='ROBLES S.A 2.0';Integrated Security=True");
        SqlCommand comando = new SqlCommand();
        DataTable tabla = new DataTable();
        string select;

        private void consultar(string select)
        {
            grdVentasMay.DataSource = consultarTabla(select);
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

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
    public partial class ContactosUtilizados : Form
    {
        public ContactosUtilizados()
        {
            InitializeComponent();
        }

        private void ContactosUtilizados_Load(object sender, EventArgs e)
        {
            select = "select top 5 count(tc.id_tipo_contacto) as 'Cantidad de clientes', tc.tipo_contacto 'Tipo de Contacto' " +
                "from tipos_contactos tc " +
                "inner join contactos c on tc.id_tipo_contacto = c.id_tipo_contacto " +
                "group by tc.tipo_contacto " +
                "order by [Cantidad de clientes] desc";
            consultar(select);
        }

        SqlConnection conexion = new SqlConnection(@"Data Source=IDEAPAD-L340\SQLEXPRESS;Initial Catalog='ROBLES S.A 2.0';Integrated Security=True");
        SqlCommand comando = new SqlCommand();
        DataTable tabla = new DataTable();
        string select;

        private void consultar(string select)
        {
            grdContactosUtilizados.DataSource = consultarTabla(select);
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

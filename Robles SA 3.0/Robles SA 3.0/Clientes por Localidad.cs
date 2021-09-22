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
    public partial class Clientes_por_Localidad : Form
    {
        public Clientes_por_Localidad()
        {
            InitializeComponent();
        }

        private void Clientes_por_Localidad_Load(object sender, EventArgs e)
        {
            select = "select p.provincia+', '+l.localidad 'Provincia, Localidad', COUNT(c.id_barrio) as 'Cantidad de clientes en esta localidad' " +
                "from provincias p " +
                "inner join localidades l on p.id_provincia = l.id_provincia " +
                "inner join barrios b on l.id_localidad = b.id_localidad " +
                "inner join clientes c on b.id_barrio = c.id_barrio " +
                "group by provincia, localidad " +
                "order by Localidad desc";
            consultar(select);
        }

        SqlConnection conexion = new SqlConnection(@"Data Source=IDEAPAD-L340\SQLEXPRESS;Initial Catalog='ROBLES S.A 2.0';Integrated Security=True");
        SqlCommand comando = new SqlCommand();
        DataTable tabla = new DataTable();
        string select;

        private void consultar(string select)
        {
            grdClientesLocalidad.DataSource = consultarTabla(select);
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
namespace Capa_Datos
{
   public class CLConexion
    {
        public SqlConnection connection = new SqlConnection("Data Source=DESKTOP-GF7M3J1\\SQLEXPRESS;Initial Catalog=DB; Integrated Security=True");
        //String de conexión (aca cada uno debe configurar el nombre del serviodr de su motor de base de datos y el tipo de seguridad que tiene antes de ejecutar el proyecto 
        // String de sergio Data Source=DESKTOP-GF7M3J1\\SQLEXPRESS;Initial Catalog=DB; Integrated Security=True
        //String de jean carlos
        // String de federico 
    }
}

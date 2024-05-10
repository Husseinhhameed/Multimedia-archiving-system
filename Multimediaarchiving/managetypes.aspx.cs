using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Multimediaarchiving
{
    public partial class managetypes : System.Web.UI.Page
    {
        //readonly string conn = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        //SqlConnection cone;
        //SqlCommand cmde;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["URSNME"]))
            {

                Response.Redirect("~/Login.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //if (TXname.Text == "")
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "random text", "alertme1()", true);

            //}
            //else
            //{
            //    using (cone = new SqlConnection(conn))
            //    {

            //        cmde = new SqlCommand("Insert Into typ (typo) Values(@typo)", cone);
            //        cmde.Parameters.Add("@typo", SqlDbType.NVarChar).Value = TXname.Text;


            //        cone.Open();
            //        cmde.ExecuteNonQuery();
            //        cone.Close();
            //        ClientScript.RegisterStartupScript(this.GetType(), "random text", "alertme()", true);


            //    }
            //}
        }
    }
}
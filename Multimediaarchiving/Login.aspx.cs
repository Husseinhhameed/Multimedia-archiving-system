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
    public partial class Login : System.Web.UI.Page
    {
        string conc = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        SqlDataAdapter sqlda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Txuser.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "random text", "alertme1()", true);

            }
            else if (Txpass.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "random text", "alertme2()", true);

            }
            else
            {

                sqlda = new SqlDataAdapter("Select * from usrnms where usrnm='" + Txuser.Text + "' and pass='" + Txpass.Text + "'", conc);
                dt = new DataTable();
                sqlda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Session.Clear();

                    Session["URSNME"] = dt.Rows[0]["usrnm"].ToString().Trim();
                    Session["TYPE"] = dt.Rows[0]["type"].ToString().Trim();
                    if (Session["TYPE"].ToString()== "مدير")
                    {
                      Response.Redirect("~/Mainpage.aspx");

                    }
                    else if (Session["TYPE"].ToString() == "مدخل")
                    {
                        Response.Redirect("~/Mainpageentry.aspx");

                    }



                }
                if (dt.Rows.Count == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "random text", "alertme()", true);
                    Txuser.Text = "";
                    Txpass.Text = "";
                }
            }
        }
    }
}
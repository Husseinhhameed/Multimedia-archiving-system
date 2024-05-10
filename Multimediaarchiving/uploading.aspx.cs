using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Multimediaarchiving
{
    public partial class uploading : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        SqlConnection cone;
        SqlCommand cmde;
        protected void Page_Load(object sender, EventArgs e)
        {
            Ldate.Text = DateTime.Now.ToString();
            Luser.Text = Session["URSNME"].ToString();
            if (string.IsNullOrEmpty((string)Session["URSNME"]))
            {

                Response.Redirect("~/Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (drtype.Text == "اختر نوع الوثيقة" || Txdescp.Text=="" || txkwords.Text=="" )
                
            {
             ClientScript.RegisterStartupScript(this.GetType(), "random text", "alertme1()", true);

            }
            if (!Filebrows.HasFile){
                ClientScript.RegisterStartupScript(this.GetType(), "random text", "alertme2()", true);

            }
            else if (Filebrows.HasFile)
            {
                string fileextension = System.IO.Path.GetExtension(Filebrows.FileName);
                if (fileextension.ToLower() != ".pdf" && fileextension.ToLower() != ".jpg" && fileextension.ToLower() != ".jpeg")
                {
                    string script = "alert(\"صيغة الملف غير مدعومة\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                }
                else
                {

                    string folderpath = Server.MapPath("~/PDFs/");
                    if (!Directory.Exists(folderpath))
                    {
                        Directory.CreateDirectory(folderpath);
                    }
                    Filebrows.SaveAs(folderpath + Path.GetFileName(Filebrows.FileName));
                    string d = folderpath + Path.GetFileName(Filebrows.FileName);
                    Lsent.Text = d;
                }
              
                using (cone = new SqlConnection(conn))
                {
                   
                        cmde = new SqlCommand("Insert Into uploaded (dtype, dpath, docdescrp, dockeword, entryname, entrydate) Values( @dtype,@dpath ,@docdescrp, @dockeword, @entryname, @entrydate)", cone);
                        cmde.Parameters.Add("@dtype", SqlDbType.NVarChar).Value = drtype.SelectedItem.Text;
                        cmde.Parameters.Add("@dpath", SqlDbType.NVarChar).Value = Lsent.Text;
                        cmde.Parameters.Add("@docdescrp", SqlDbType.NVarChar).Value = Txdescp.Text;
                        cmde.Parameters.Add("@dockeword", SqlDbType.NVarChar).Value = txkwords.Text;
                        cmde.Parameters.Add("@entryname", SqlDbType.NVarChar).Value = Luser.Text;
                        cmde.Parameters.Add("@entrydate", SqlDbType.DateTime).Value = Ldate.Text;

                        cone.Open();
                        cmde.ExecuteNonQuery();
                        cone.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "random text", "alertme()", true);


                }
            }
            }
    }
}
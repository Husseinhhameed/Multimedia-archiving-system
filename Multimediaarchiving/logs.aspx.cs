using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Multimediaarchiving
{
    public partial class logs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["URSNME"]))
            {

                Response.Redirect("~/Login.aspx");
            }
            ASPxGridView1.Columns["Id"].Caption = "التسلسل";
            ASPxGridView1.Columns["dtype"].Caption = "الصنف";
            ASPxGridView1.Columns["docdescrp"].Caption = "التفاصيل";
            ASPxGridView1.Columns["dockeword"].Caption = "الكلمات المفتاحية";
            ASPxGridView1.Columns["entryname"].Caption = " الموظف";
            ASPxGridView1.Columns["entrydate"].Caption = " تاريخ الارشفة";

        }
    }
}
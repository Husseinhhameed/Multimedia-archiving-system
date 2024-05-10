using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Multimediaarchiving
{
    public partial class Mainpageentry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty((string)Session["URSNME"]))
            {

                Response.Redirect("~/Login.aspx");
            }
        }
    }
}
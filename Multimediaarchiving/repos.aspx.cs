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
    public partial class repos : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["URSNME"]))
            {

                Response.Redirect("~/Login.aspx");
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" || TextBox2.Text == "")

            {
                ClientScript.RegisterStartupScript(this.GetType(), "random text", "alertme()", true);

            }
            else
            {

                if (DropDownList1.SelectedIndex == 0 && DropDownList2.SelectedIndex == 0)
                {
                    SqlConnection sqlcon1 = new SqlConnection(conn);
                    string sqlquery1 = "select dtype,docdescrp,entryname,entrydate from uploaded where ('" + TextBox2.Text + "' >= entrydate) and ('" + TextBox1.Text + "' <= entrydate)";

                    sqlcon1.Open();
                    SqlCommand sqlcom1 = new SqlCommand(sqlquery1, sqlcon1);
                    SqlDataAdapter sda1 = new SqlDataAdapter(sqlcom1);
                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);
                
                        if (dt1.Rows.Count != 0)
                        {
                            GridView1.DataSource = dt1;
                            GridView1.DataBind();
                            sqlcon1.Close();

                            GridView1.HeaderRow.Cells[0].Text = "الصنف";
                            GridView1.HeaderRow.Cells[1].Text = "ملاحظات";
                            GridView1.HeaderRow.Cells[2].Text = "المدخل";
                            GridView1.HeaderRow.Cells[3].Text = "تاريخ الادخال";

                    }




                }
                if (DropDownList1.SelectedIndex == 0)
                {
                    SqlConnection sqlcon1 = new SqlConnection(conn);
                    string sqlquery1 = "select dtype,docdescrp,entryname,entrydate from uploaded where ('" + TextBox2.Text + "' >= entrydate) and ('" + TextBox1.Text + "' <= entrydate) and entryname=N'" + DropDownList2.SelectedItem.Text + "'";

                    sqlcon1.Open();
                    SqlCommand sqlcom1 = new SqlCommand(sqlquery1, sqlcon1);
                    SqlDataAdapter sda1 = new SqlDataAdapter(sqlcom1);
                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);
                    GridView1.HeaderRow.Cells[0].Text = "الصنف";
                    GridView1.HeaderRow.Cells[1].Text = "ملاحظات";
                    GridView1.HeaderRow.Cells[2].Text = "المدخل";
                    GridView1.HeaderRow.Cells[3].Text = "تاريخ الادخال";

                    if (dt1.Rows.Count != 0)
                        {
                            GridView1.DataSource = dt1;
                            GridView1.DataBind();
                            sqlcon1.Close();

                        GridView1.HeaderRow.Cells[0].Text = "الصنف";
                        GridView1.HeaderRow.Cells[1].Text = "ملاحظات";
                        GridView1.HeaderRow.Cells[2].Text = "المدخل";
                        GridView1.HeaderRow.Cells[3].Text = "تاريخ الادخال";

                    }

                    
                }

                if (DropDownList2.SelectedIndex == 0)
                {
                    SqlConnection sqlcon1 = new SqlConnection(conn);
                    string sqlquery1 = "select dtype,docdescrp,entryname,entrydate from uploaded where ('" + TextBox2.Text + "' >= entrydate) and ('" + TextBox1.Text + "' <= entrydate) and dtype=N'" + DropDownList1.SelectedItem.Text + "'";

                    sqlcon1.Open();
                    SqlCommand sqlcom1 = new SqlCommand(sqlquery1, sqlcon1);
                    SqlDataAdapter sda1 = new SqlDataAdapter(sqlcom1);
                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);
                    GridView1.HeaderRow.Cells[0].Text = "الصنف";
                    GridView1.HeaderRow.Cells[1].Text = "ملاحظات";
                    GridView1.HeaderRow.Cells[2].Text = "المدخل";
                    GridView1.HeaderRow.Cells[3].Text = "تاريخ الادخال";
                    Label1.Text = dt1.Rows.Count.ToString() + "العدد الكلي للبيانات المدخلة";

                    if (dt1.Rows.Count != 0)
                        {
                            GridView1.DataSource = dt1;
                            GridView1.DataBind();
                            sqlcon1.Close();

                            GridView1.HeaderRow.Cells[0].Text = "الصنف";
                            GridView1.HeaderRow.Cells[1].Text = "ملاحظات";
                            GridView1.HeaderRow.Cells[2].Text = "المدخل";
                            GridView1.HeaderRow.Cells[3].Text = "تاريخ الادخال";
                            Label1.Text = dt1.Rows.Count.ToString() + "العدد الكلي للبيانات المدخلة";

                    }


                }

             
            }
           

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell myCell in e.Row.Cells)
            {
                myCell.Style.Add("word-break", "break-all");
                myCell.Width = 40;
            }
         
        }
    }
}
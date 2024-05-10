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
    public partial class searchbox : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            if (string.IsNullOrEmpty((string)Session["URSNME"]))
            {

                Response.Redirect("~/Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" )

            {
                ClientScript.RegisterStartupScript(this.GetType(), "random text", "alertme()", true);

            }
            else
            if (DropDownList1.SelectedIndex == 0)
            {
                SqlConnection sqlcon1 = new SqlConnection(conn);
                string sqlquery1 = "select Id,dtype,docdescrp,dockeword,entryname,entrydate from uploaded where dockeword like N'%" + TextBox1.Text + "%'";
                sqlcon1.Open();
                SqlCommand sqlcom1 = new SqlCommand(sqlquery1, sqlcon1);
                SqlDataAdapter sda1 = new SqlDataAdapter(sqlcom1);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                if (dt1.Rows.Count == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "random text", "alertme1()", true);
                }

                if (dt1.Rows.Count != 0)
                {
                    GridView1.DataSource = dt1;
                    GridView1.DataBind();
                    sqlcon1.Close();

                    GridView1.Visible = true;
                    GridView1.HeaderRow.Cells[1].Text = "التسلسل";
                    GridView1.HeaderRow.Cells[2].Text = "التصنيف";
                    GridView1.HeaderRow.Cells[3].Text = "الوصف";
                    GridView1.HeaderRow.Cells[4].Text = "الكلمات المفتاحية";
                    GridView1.HeaderRow.Cells[5].Text = "المدخل";
                    GridView1.HeaderRow.Cells[6].Text = "تاريخ الادخال";
                }
            }
            else
            {
                SqlConnection sqlcon = new SqlConnection(conn);
                string sqlquery = "select Id,dtype,docdescrp,dockeword,entryname,entrydate from uploaded where dtype=N'" + DropDownList1.SelectedItem.Text + "'and dockeword like N'%" + TextBox1.Text + "%'";
                sqlcon.Open();
                SqlCommand sqlcom = new SqlCommand(sqlquery, sqlcon);
                SqlDataAdapter sda = new SqlDataAdapter(sqlcom);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                if (dt.Rows.Count == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "random text", "alertme1()", true);
                    

                }

                if (dt.Rows.Count != 0)
                {
                    GridView1.DataBind();
                    sqlcon.Close();
                    GridView1.Visible = true;
                    GridView1.HeaderRow.Cells[1].Text = "التسلسل";
                    GridView1.HeaderRow.Cells[2].Text = "التصنيف";
                    GridView1.HeaderRow.Cells[3].Text = "الوصف";
                    GridView1.HeaderRow.Cells[4].Text = "الكلمات المفتاحية";
                    GridView1.HeaderRow.Cells[5].Text = "المدخل";
                    GridView1.HeaderRow.Cells[6].Text = "تاريخ الادخال";
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string s = GridView1.SelectedRow.Cells[1].Text;
            Label1.Text = s;
            SqlConnection sqlcon1 = new SqlConnection(conn);
            string sqlquery1 = "select dpath from uploaded where id='" +Label1.Text +"'";
            sqlcon1.Open();
            SqlCommand sqlcom1 = new SqlCommand(sqlquery1, sqlcon1);
            SqlDataAdapter sda1 = new SqlDataAdapter(sqlcom1);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
            string ex = dt1.Rows[0]["dpath"].ToString();
            string fileName;
            string ext = Path.GetExtension(ex);
            if (ext == ".pdf")
            {

                fileName = "download.pdf";

                System.Net.WebClient webClient = new System.Net.WebClient();
                string url = ex;
                byte[] bytes = webClient.DownloadData(url);
                //fileName = (url.Split('/')[url.Split('/').Length - 1]).Split('.')[0];
                //Response.ContentType = "image/png";
                Response.ContentType = "application/pdf";
                //Response.ContentType = "image/jpeg";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.BinaryWrite(bytes);

                Response.End();


            }

            if (ext == ".jpg")
            {
                fileName = "download.jpg";

                System.Net.WebClient webClient = new System.Net.WebClient();
                string url = ex;
                byte[] bytes = webClient.DownloadData(url);
                //fileName = (url.Split('/')[url.Split('/').Length - 1]).Split('.')[0];
                //Response.ContentType = "image/png";
                Response.ContentType = "image/jpeg";
                //Response.ContentType = "image/jpeg";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.BinaryWrite(bytes);
                Response.End();

            }

            if (ext == ".jpeg")
            {
                fileName = "download.jpeg";
                System.Net.WebClient webClient = new System.Net.WebClient();
                string url = ex;
                byte[] bytes = webClient.DownloadData(url);
                //fileName = (url.Split('/')[url.Split('/').Length - 1]).Split('.')[0];
                //Response.ContentType = "image/png";
                Response.ContentType = "image/jpeg";
                //Response.ContentType = "image/jpeg";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.BinaryWrite(bytes);
                Response.End();

            }

        }
    }
}
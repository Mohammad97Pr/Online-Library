using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Books : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fill();
        }
    }
    public void fill()
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select * from Books ";
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_Books.DataSource = dt;
        grid_Books.DataBind();
    }


    protected void grid_Books_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "down")
        {

            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_Books.Rows[j];

            SqlConnection con = new SqlConnection(cs);
            Label file = (Label)row.FindControl("lbl_path1");
            Label file1 = (Label)row.FindControl("lbl01");
            string sql = "";
            sql = "update books set downloads=downloads+1 where book_id='" + file1.Text.Trim() + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            //cmd.Parameters.AddWithValue("@file", row.Cells[0].Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();



           

            if (file.Text != string.Empty)
            {
                if (file.Text.EndsWith(".txt"))
                {
                    Response.ContentType = "application/txt";
                }
                else if (file.Text.EndsWith(".pdf"))
                {
                    Response.ContentType = "application/pdf";
                }
                else if (file.Text.EndsWith(".docx"))
                {
                    Response.ContentType = "application/docx";
                }
                else if (file.Text.EndsWith(".pptx"))
                {
                    Response.ContentType = "application/pptx";
                }

                else
                {
                    Response.ContentType = "image/jpg";
                }

                string filePath = file.Text;

                Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filePath + "\"");

                
                Response.TransmitFile(Server.MapPath(filePath));

                Response.End();

            }




        }
        if (e.CommandName == "view")

        {
            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_Books.Rows[j];
            Label file = (Label)row.FindControl("lbl_path1");

            string filePath = Server.MapPath(file.Text);
            WebClient user = new WebClient();
            Byte[] FileBuffer = user.DownloadData(filePath);
            if (FileBuffer != null)
            {
                if (file.Text.EndsWith(".pdf"))
                {
                    Response.ContentType = "application/pdf";
                }
                else 

                {

                    Response.Write("<script>alert('" + "only pdf" + "');</script>");
                    return;

                }
                Response.AddHeader("content-length", FileBuffer.Length.ToString());
                Response.BinaryWrite(FileBuffer);
            }

        }

    }
}
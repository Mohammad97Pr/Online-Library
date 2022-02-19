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

public partial class user_profile : System.Web.UI.Page
{

    public void fill()
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select *,(select course_name from courses where course_id=files.course_id) as course_name from files where prof_id='" + lbl1.Text + "'order by upload_date desc ";
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_files.DataSource = dt;
        grid_files.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["name"] == null)
        {
            Response.Redirect("prof_login2.aspx");
        }
        if (!IsPostBack)
        {
            string ss = Session["name"].ToString();

            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);


            string str = "select *,(select col_name from collage where col_id=users.col_id) as col_name  from users where prof_username='" + ss + "' ";
            SqlCommand com = new SqlCommand(str, con);
            con.Open();

            SqlDataReader reader = com.ExecuteReader();

            reader.Read();
            txt_fname.Text = reader["prof_fname"].ToString();
            txt_lname.Text = reader["prof_lname"].ToString();
            txt_collage.Text = reader["col_name"].ToString();
            txt_type.Text = reader["prof_type"].ToString();
            txt_username.Text = reader["prof_username"].ToString();
            txt_pass.Text = reader["prof_password"].ToString();
            lbl1.Text = reader["prof_id"].ToString();
            reader.Close();
            con.Close();
            fill();
        }
    }

    protected void grid_files_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "down")
        {


            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_files.Rows[j];
            Label file = (Label)row.FindControl("lbl_path");
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
                //string sql = "";
                //sql = "update files set downloads=downloads+1 where file_id=@file";
                //SqlCommand cmd = new SqlCommand(sql, con);
                //cmd.Parameters.AddWithValue("@file", row.Cells[0].Text);
                //con.Open();
                //cmd.ExecuteNonQuery();
                //con.Close();


            }




        }

        if (e.CommandName == "del")
        {


            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_files.Rows[j];
            SqlConnection con = new SqlConnection(cs);
            Label file1 = (Label)row.FindControl("lbl1");
            var c = Convert.ToInt32(BoundField.ThisExpression.Equals("f"));
            SqlCommand cmd = new SqlCommand("delete from files where file_id='" + file1.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            fill();
        }
        if (e.CommandName == "view")

        {
            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_files.Rows[j];
            Label file = (Label)row.FindControl("lbl_path");

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

    protected void btn_update_Click(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);

        string sql;
        sql = "update users set prof_password=@newpass where prof_id='"+lbl1.Text+"'";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@newpass",txt_npass.Text);
        if (txt_npass.Text.Length > 5)
        {


            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("user_profile.aspx");
        }
        else
           
    Response.Write("<script>alert('" + "password must be more than 5 characters" + "');</script>");
    }
}
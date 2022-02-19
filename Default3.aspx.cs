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

public partial class Default3 : System.Web.UI.Page
{

    public void fill()
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select * from files where course_id='" + ddlcourse1.SelectedValue + "'order by upload_date desc ";
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_files.DataSource = dt;
        grid_files.DataBind();
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            
            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlParameter sp = new SqlParameter("@col_id", Session["key"]);
            ddlyear1.DataSource = GetData("sqlyearbycollage", sp);
            ddlyear1.DataBind();

            ddlsem1.Enabled = true;
            SqlParameter sp1 = new SqlParameter("@year_id", Session["key1"]);
            ddlsem1.DataSource = GetData("sqlsemsterbyyear", sp1);
            ddlsem1.DataBind();


            ListItem l2 = new ListItem("اختر السنة الدراسية", "-1");
            ddlyear1.Items.Insert(0, l2);

            ListItem l3 = new ListItem("اختر الفصل الدراسي", "-1");
            ddlsem1.Items.Insert(0, l3);


            ListItem l4 = new ListItem("اختر المادة", "-1");
            ddlcourse1.Items.Insert(0, l4);



        }
    }
    private DataSet GetData(string getname, SqlParameter para)
    {//هنا قمنا بعغمل بعض العلاقات و التوابع ىمن أجل استدعاء او عمل اتصال بين البرانامج(دروب ليست) ......
        //الخ

        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        SqlDataAdapter da = new SqlDataAdapter(getname, con);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        if (para != null)
        {
            da.SelectCommand.Parameters.Add(para);
        }
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;


    }


    protected void ddlyear1_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddlyear1.SelectedIndex == -1)
        {
            ddlsem1.Enabled = false;
            ddlcourse1.Enabled = false;
            ddlsem1.SelectedIndex = -1;
            ddlcourse1.SelectedIndex = -1;

        }
        else
        {


            ListItem l3 = new ListItem("اختر الفصل الدراسي", "-1");
            ddlsem1.Items.Insert(0, l3);

            ListItem l4 = new ListItem("اختر المادة", "-1");
            ddlcourse1.Items.Insert(0, l4);

            ddlcourse1.Enabled = false;

        }


    }



    protected void ddlcourse1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlcourse1.SelectedIndex == -1)
        {
        }
        else
        {
            fill();
            
        }

    }

    protected void ddlsem1_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddlsem1.SelectedIndex == -1)
        {
            ddlcourse1.Enabled = false;

            ddlcourse1.SelectedIndex = -1;
        }
        else
        {
            ddlcourse1.Enabled = true;
            SqlParameter sp = new SqlParameter("@sem_id", ddlsem1.SelectedValue);
            ddlcourse1.DataSource = GetData("sqlcoursebysem", sp);
            ddlcourse1.DataBind();


            ListItem l4 = new ListItem("اختر المادة", "-1");
            ddlcourse1.Items.Insert(0, l4);
            
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

            Label file1 = (Label)row.FindControl("fileid1");
            string filePath = file.Text;
            //int a = Convert.ToInt32(ax.Text);
            string sql = "";
            sql = "UPDATE files set downloads =downloads+1 where file_id='" + file1.Text + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            //cmd.Parameters.AddWithValue("@file", row.Cells[4].Text);
            con.Open();
            cmd.ExecuteNonQuery();

            con.Close();
            Response.Clear();
            Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filePath + "\"");
            Response.TransmitFile(Server.MapPath(filePath));
            Response.Clear();

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




            }
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
                    Response.Write("<script>alert('"+"only pdf"+"');</script>");
                    return;

                }
                Response.AddHeader("content-length", FileBuffer.Length.ToString());
                Response.BinaryWrite(FileBuffer);
            }

        }

    }

    protected void grid_files_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_files.PageIndex = e.NewPageIndex;
        fill();
    }
}
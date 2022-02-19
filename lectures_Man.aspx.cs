using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class lectures_Man : System.Web.UI.Page
{
    public void fill()
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select * from files where course_id='" + ddlcourse.SelectedValue + "'order by upload_date desc ";
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_files.DataSource = dt;
        grid_files.DataBind();
    }
    public void num()
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select count(*)from  files ";
        SqlCommand com = new SqlCommand(sql, con);



        con.Open();
        Int32 count = (Int32)com.ExecuteScalar();

        SqlDataReader reader = com.ExecuteReader();

        reader.Read();
        Label2.Text = count.ToString();
        reader.Close();
        con.Close();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            num();


            ddlcollage.DataSource = GetData("sqlcollage", null);
            ddlcollage.DataBind();

            ListItem l1 = new ListItem("Choose Collage", "-1");
            ddlcollage.Items.Insert(0, l1);

            ListItem l2 = new ListItem("اختر السنة الدراسية", "-1");
            ddlyear.Items.Insert(0, l2);

            ListItem l3 = new ListItem("اختر الفصل الدراسي", "-1");
            ddlsemester.Items.Insert(0, l3);

            ListItem l4 = new ListItem("اختر المادة", "-1");
            ddlcourse.Items.Insert(0, l4);



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
                string sql = "";
                sql = "update files set downloads=downloads+1 where file_id=@file";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@file", row.Cells[0].Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();


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

    protected void ddlcollage_SelectedIndexChanged(object sender, EventArgs e)
    {

        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select count(*)from  files where col_id='" + ddlcollage.SelectedValue + "' ";
        SqlCommand com = new SqlCommand(sql, con);

       

        con.Open();
        Int32 count = (Int32)com.ExecuteScalar();

        SqlDataReader reader = com.ExecuteReader();
       
        reader.Read();
        Num_files1.Text = count.ToString();
        reader.Close();
        con.Close();
        p1.Visible = false;
        //foreach (var id in "file_id")
        //{
        //    var item = GetItemByQuery("SELECT * FROM TABLE WHERE ID = " + id);
        //    myObjectList.Add(item);
        //}

        if (ddlcollage.SelectedIndex == -1)
        {
            ddlyear.Enabled = false;

            ddlsemester.SelectedIndex = 0;
            ddlcourse.SelectedIndex = 0;
            p1.Visible = false;

        }
        else
        {
            ddlyear.Enabled = true;
            SqlParameter sp = new SqlParameter("@col_id", ddlcollage.SelectedValue);
            ddlyear.DataSource = GetData("sqlyearbycollage", sp);
            ddlyear.DataBind();


            ListItem l2 = new ListItem("اختر السنة الدراسية", "-1");
            ddlyear.Items.Insert(0, l2);


            ddlsemester.Enabled = false;

            ddlsemester.SelectedIndex = 0;

            ddlcourse.SelectedIndex = 0;
            ddlcourse.Enabled = false;



        }
    }

    public void ddlyear_SelectedIndexChanged(object sender, EventArgs e)
    {
        p1.Visible = false;

        if (ddlyear.SelectedIndex == -1)
        {
            ddlsemester.Enabled = false;

            ddlsemester.SelectedIndex = 0;

        }
        else
        {
            ddlsemester.Enabled = true;
            SqlParameter sp = new SqlParameter("@year_id", ddlyear.SelectedValue);
            ddlsemester.DataSource = GetData("sqlsemsterbyyear", sp);
            ddlsemester.DataBind();


            ListItem l3 = new ListItem("اختر الفصل الدراسي", "-1");
            ddlsemester.Items.Insert(0, l3);


        }
    }

    protected void ddlsemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        p1.Visible = false;
        if (ddlsemester.SelectedIndex == -1)
        {
            ddlcourse.Enabled = false;

            ddlcourse.SelectedIndex = 0;

        }
        else
        {
            ddlcourse.Enabled = true;
            SqlParameter sp = new SqlParameter("@sem_id", ddlsemester.SelectedValue);
            ddlcourse.DataSource = GetData("sqlcoursebysem", sp);
            ddlcourse.DataBind();


            ListItem l4 = new ListItem("اختر المادة", "-1");
            ddlcourse.Items.Insert(0, l4);


        }
    }


    protected void ddlcourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        fill();
        p1.Visible = true;
    }

    protected void grid_files_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        

    }

    protected void lb1_Click(object sender, EventArgs e)
    {

    }


    //protected void grid_files_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    grid_files.PageIndex = e.NewPageIndex;
    //    fill();
    //}
}

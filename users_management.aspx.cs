using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class users_management : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlusers.SelectedValue = Session["key"].ToString();
            if (Session["key"].ToString() == "1")
            {
                st_s1.Visible = false;
                st_s2.Visible = false;
                num();
            }
            else
            {
                pr_p1.Visible = false;
                pr_p2.Visible = false;
                num_S();
            }

            if (ddlusers.SelectedIndex == -1)
            {
                ddlcollage.Enabled = false;
            }
            else
            {
                ddlcollage.Enabled = true;
                ddlcollage.DataSource = GetData("sqlcollage",null);
                ddlcollage.DataBind();

                ListItem l1 = new ListItem("choose collage", "0");
                ddlcollage.Items.Insert(0, l1);

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
    public void fill_professor()
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select * from users where col_id='" + ddlcollage.SelectedValue + "'order by prof_id desc ";
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_files.DataSource = dt;
        grid_files.DataBind();
    }
    public void fill_Student()
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select * from susers where col_id='" + ddlcollage.SelectedValue + "'order by stu_id desc ";
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_files2.DataSource = dt;
        grid_files2.DataBind();
    }

    protected void ddlcollage_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlusers.SelectedValue == "1")
        {
            p1.Visible = true;
            p2.Visible = false;
            fill_professor();
            num2();

        }
        if (ddlusers.SelectedValue == "2")
        {
            p1.Visible = false;
            p2.Visible = true;
            fill_Student();
            num_s2();
        }
        if (ddlusers.SelectedValue == "-1")
        {

            p1.Visible = false;
            p2.Visible = false;
        }
    }
    public void num()
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select count(*)from  users ";
        SqlCommand com = new SqlCommand(sql, con);



        con.Open();
        Int32 count = (Int32)com.ExecuteScalar();

        SqlDataReader reader = com.ExecuteReader();

        reader.Read();
        lbl_pr.Text = count.ToString();
        reader.Close();
        con.Close();

    }
    public void num2()
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select count(*)from  users where col_id='" + ddlcollage.SelectedValue + "' ";
        SqlCommand com = new SqlCommand(sql, con);



        con.Open();
        Int32 count = (Int32)com.ExecuteScalar();

        SqlDataReader reader = com.ExecuteReader();

        reader.Read();
        lbl_pr2.Text = count.ToString();
        reader.Close();
        con.Close();

    }
    public void num_s2()
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select count(*)from  susers where col_id='" + ddlcollage.SelectedValue + "' ";
        SqlCommand com = new SqlCommand(sql, con);



        con.Open();
        Int32 count = (Int32)com.ExecuteScalar();

        SqlDataReader reader = com.ExecuteReader();

        reader.Read();
        lbl_st2.Text = count.ToString();
        reader.Close();
        con.Close();

    }
    public void num_S()
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select count(*)from  susers ";
        SqlCommand com = new SqlCommand(sql, con);



        con.Open();
        Int32 count = (Int32)com.ExecuteScalar();

        SqlDataReader reader = com.ExecuteReader();

        reader.Read();
        lbl_st1.Text = count.ToString();
        reader.Close();
        con.Close();

    }

    protected void ddlusers_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }

    protected void grid_files_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {


            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_files.Rows[j];
            SqlConnection con = new SqlConnection(cs);
            Label file1 = (Label)row.FindControl("lbl1");
            var c = Convert.ToInt32(BoundField.ThisExpression.Equals("f"));
            SqlCommand cmd = new SqlCommand("delete from users where prof_id='" + file1.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            p1.Visible = true;
            p2.Visible = false;
            fill_professor();

        }
    }

    protected void grid_files2_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "del1")
        {
            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            int i = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_files2.Rows[i];
            SqlConnection con = new SqlConnection(cs);
            Label file1 = (Label)row.FindControl("lbl2");
            //var c = Convert.ToInt32(BoundField.ThisExpression.Equals("f"));
            SqlCommand cmd = new SqlCommand("delete from susers where stu_id='" + file1.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            p1.Visible =false;
            p2.Visible = true;
            fill_Student();
        }
    }

    protected void grid_files_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_files.PageIndex = e.NewPageIndex;
        fill_professor();
    }

    protected void grid_files2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_files2.PageIndex = e.NewPageIndex;
        fill_Student();
    }
}
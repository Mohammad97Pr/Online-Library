using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sign_up : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddl_collage.DataSource = GetData("sqlcollage", null);
            ddl_collage.DataBind();

            ListItem l1 = new ListItem("اختر الكلية", "-1");
            ddl_collage.Items.Insert(0, l1);

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


    protected void upload_Click(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "insert into users(prof_fname,prof_lname,prof_funame,prof_type,col_id,prof_username,prof_password) values(@fname,@lname,@full,@type,@collage,@username,@password)";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@fname", txt_fname.Text);
        cmd.Parameters.AddWithValue("@lname", txt_lname.Text);
        cmd.Parameters.AddWithValue("@full", txt_fname.Text+" "+txt_lname.Text);

        cmd.Parameters.AddWithValue("@type", DropDownList1.SelectedItem.ToString());
        cmd.Parameters.AddWithValue("@collage", ddl_collage.SelectedValue);
        cmd.Parameters.AddWithValue("@username", txt_username.Text);
        cmd.Parameters.AddWithValue("@password", txt_password.Text);
        if (txt_chpassword.Text == txt_password.Text && txt_password.Text.Length>5)
        {


            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('professor added successfully.');</script>");
        }
        else
        {
            lbl1.Text = "please check your password";
            return;
        }

        //lbl_me.Text = "معلم مشي الحال....كل يوم تعال";
   
   
    }
    
}
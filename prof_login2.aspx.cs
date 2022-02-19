using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class prof_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

      
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select * from users where prof_username=@username and prof_password=@password";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@username", txt_username.Text);
        cmd.Parameters.AddWithValue("@password", txt_pass.Text);
        SqlDataReader r;
        con.Open();
        r = cmd.ExecuteReader();
        if (r.HasRows) {
            //string sql1 = "select prof_id,prof_fname,prof_lname from users where prof_username=@username and prof_password=@password";
            //SqlCommand cmd1 = new SqlCommand(sql1, con);
            
            Session["name"] = txt_username.Text;
           


          Server.Transfer("~/user_profile.aspx");

        }
        else
        {
            information.Text = "sorry, pleaseCheck your information or if you don`t have an account 'sign up' ";
        }
        con.Close();
    }
}
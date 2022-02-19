using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
public partial class uploadexample : System.Web.UI.Page
{
   
    public void Page_Load(object sender, EventArgs e)
    {//هون قمنا باستدعاء التوابع التي أنشأناها في اسكي يو ال سيرفر

        if (!IsPostBack)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("prof_login.aspx");
            }
            else {

                string ss = Session["name"].ToString();

                String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);


                string str = "select prof_fname,prof_lname from users where prof_username='" + ss + "' ";
                SqlCommand com = new SqlCommand(str, con);
                con.Open();

                SqlDataReader reader = com.ExecuteReader();

                reader.Read();
                fullname.Text = reader["prof_fname"].ToString() + " " + reader["prof_lname"].ToString();
                reader.Close();
                con.Close();



                ddlcollage.DataSource = GetData("sqlcollage",null);
                ddlcollage.DataBind();

                ListItem l1 = new ListItem("اختر الكلية", "-1");
                ddlcollage.Items.Insert(0, l1);

                ListItem l2 = new ListItem("اختر السنة الدراسية", "-1");
                ddlyear.Items.Insert(0, l2);

                ListItem l3 = new ListItem("اختر الفصل الدراسي", "-1");
                ddlsemester.Items.Insert(0, l3);

                ListItem l4 = new ListItem("اختر المادة", "-1");
                ddlcourse.Items.Insert(0, l4);
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
    protected void ddlcollage_SelectedIndexChanged1(object sender, EventArgs e)
    {

        if (ddlcollage.SelectedIndex == -1)
        {
            ddlyear.Enabled = false;

            ddlsemester.SelectedIndex = 0;
            ddlcourse.SelectedIndex = 0;

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


        if (ddlyear.SelectedIndex==-1)
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


    public void upload_Click1(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string ext = System.IO.Path.GetExtension(FileUpload1.FileName);
            if (ext != ".pdf" && ext != ".jpg" && ext != ".docx" && ext != ".pptx" && ext != ".mp4")
            {
                lbl1.Text = "not support thiw file";
                return;
            }
            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            string str = "select prof_id,prof_fname,prof_lname,prof_type from users where prof_username='" + Session["name"] + "'";
            SqlCommand com = new SqlCommand(str, con);
            con.Open();

            SqlDataReader reader = com.ExecuteReader();

            reader.Read();
            string prof_id = reader["prof_id"].ToString();
            string prof_fname = reader["prof_fname"].ToString();
            string prof_lname = reader["prof_lname"].ToString();
            string prof_type = reader["prof_type"].ToString();
            reader.Close(); 
            con.Close();

            string file_name = "";
            file_name = file_name + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString();
            file_name = file_name + DateTime.Now.Day.ToString();
            file_name = file_name + DateTime.Now.Hour.ToString();
            file_name = file_name + DateTime.Now.Minute.ToString();
            file_name = file_name + DateTime.Now.Second.ToString();
            FileUpload1.SaveAs(Server.MapPath("files") + "\\" + file_name + ext);
            string path = "~\\Files\\" + file_name + ext;
            string sql = "insert into files(leccture_id,file_title,upload_date,path,course_id,downloads,prof_id,prof_funame,col_id,prof_type) values(@lec_id,@title,@update,@path,@courses,@down,@prof_id,@prof_funame,@col_id,@prof_type)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@lec_id", txt_lectureid.Text);
            cmd.Parameters.AddWithValue("@title", txt_title.Text);
            cmd.Parameters.AddWithValue("@update", DateTime.Now);
            cmd.Parameters.AddWithValue("@courses", ddlcourse.SelectedValue);
            //cmd.Parameters.AddWithValue("@user", Session["user"].ToString());
            cmd.Parameters.AddWithValue("@path", path);
            cmd.Parameters.AddWithValue("@down", 0);
            cmd.Parameters.AddWithValue("@prof_id", prof_id);
            cmd.Parameters.AddWithValue("@prof_funame", prof_fname+" " + prof_lname);
            cmd.Parameters.AddWithValue("@col_id", ddlcollage.SelectedIndex);
            cmd.Parameters.AddWithValue("@prof_type", prof_type);




            con.Open();
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('lecture added successfully.');</script>");
            con.Close();

        }
        else
        {
            lbl1.Text = "error؟؟";
        }

    }



   
}

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class choose_collage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["Sname"] == null)
            {
                Response.Redirect("stu_login.aspx");
            }
            else {

                string ss = Session["Sname"].ToString();

                String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);


                string str = "select col_id,sfname,slname from susers where susername='" + ss + "' ";
                SqlCommand com = new SqlCommand(str, con);
                con.Open();

                SqlDataReader reader = com.ExecuteReader();

                reader.Read();
                full_name.Text = reader["sfname"].ToString() + " " + reader["slname"].ToString();

                switch (reader["col_id"].ToString())
                {
                    case "1":
                        p1.Visible = true;
                        break;


                    case "2":
                        p2.Visible = true;
                        break;


                    case "3":
                        p3.Visible = true;
                        break;


                    case "4":
                        p4.Visible = true;
                        break;


                    case "5":
                        p5.Visible = true;
                        break;


                    case "6":
                        p6.Visible = true;
                        break;


                    case "7":
                        p7.Visible = true;
                        break;


                    case "8":
                        p8.Visible = true;
                        break;


                    case "9":
                        p9.Visible = true;
                        break;

                }
                reader.Close();
                con.Close();


            }
        }
    }



    protected void btncol11_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol11.AccessKey;
        Session["key1"] = btncol11.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");
    }

  


    protected void btncol12_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol12.AccessKey;
        Session["key1"] = btncol12.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol13_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol13.AccessKey;
        Session["key1"] = btncol13.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol14_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol14.AccessKey;
        Session["key1"] = btncol14.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol15_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol15.AccessKey;
        Session["key1"] = btncol15.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");
    }
    protected void btncol21_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol21.AccessKey.ToString();
        Session["key1"] = btncol21.SkinID.ToString();
        Server.Transfer("~/Default3.aspx");
    }


    protected void btncol22_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol22.AccessKey;
        Session["key1"] = btncol22.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol23_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol23.AccessKey;
        Session["key1"] = btncol23.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol24_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol24.AccessKey;
        Session["key1"] = btncol24.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol25_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol25.AccessKey;
        Session["key1"] = btncol25.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol31_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol31.AccessKey;
        Session["key1"] = btncol31.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol32_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol32.AccessKey;
        Session["key1"] = btncol32.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol33_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol33.AccessKey;
        Session["key1"] = btncol33.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol34_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol34.AccessKey;
        Session["key1"] = btncol34.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol35_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol35.AccessKey;
        Session["key1"] = btncol35.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol41_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol41.AccessKey;
        Session["key1"] = btncol41.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");


    }

    protected void btncol42_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol42.AccessKey;
        Session["key1"] = btncol42.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol43_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol43.AccessKey;
        Session["key1"] = btncol43.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol44_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol44.AccessKey;
        Session["key1"] = btncol44.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol45_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol45.AccessKey;
        Session["key1"] = btncol45.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol51_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol51.AccessKey;
        Session["key1"] = btncol51.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol52_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol52.AccessKey;
        Session["key1"] = btncol52.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol53_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol53.AccessKey;
        Session["key1"] = btncol53.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol54_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol54.AccessKey;
        Session["key1"] = btncol54.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");

    }

    protected void btncol55_Click(object sender, EventArgs e)
    {
        Session["key"] = btncol55.AccessKey;
        Session["key1"] = btncol55.SkinID.ToString();

        Server.Transfer("~/Default3.aspx");


    }
}
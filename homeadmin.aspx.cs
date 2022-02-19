using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class homeadmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_profadd_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/add_professors.aspx");
    }

    protected void btn_stuadd_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/add_stu.aspx");

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["key"] = Button1.AccessKey;
        Server.Transfer("~/users_management.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        Session["key"] = Button2.AccessKey;
        Server.Transfer("~/users_management.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/lectures_Man.aspx");

    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Books_.aspx");

    }
}
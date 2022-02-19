<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

        protected void Button1_Click(object sender, EventArgs e)
        {
            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            string sql = "select * from admin_login where admin_username=@username and admin_password=@password";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@username", TextBox1.Text);
            cmd.Parameters.AddWithValue("@password", TextBox2.Text);
            SqlDataReader r;
            con.Open();
            r = cmd.ExecuteReader();
            if (r.HasRows)

            {
                Response.Redirect("~/homeadmin.aspx");
            }
            else
            {
                lbl1.Text = "sorry, pleaseCheck your information or if you don`t have an account 'sign up' ";
            }
            con.Close();
        }
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="row">
            <div class=" col-md-6 mx-auto">
                <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                       <img width="150px" src="imgs/adminuser.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                       <h3>Admin Login</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Admin Name</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox1"
                                        runat="server" placeholder="user name">

                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox2"
                                        runat="server" placeholder="password" TextMode="Password">

                                    </asp:TextBox>
                                </div>
                                <div class="form-group">
             <asp:Label runat="server" Text="" ID="lbl1"></asp:Label>                      
                                    <asp:Button class=" btn-info btn-block btn-lg" ID="Button1" runat="server" Text="login" OnClick="Button1_Click" />
                                </div>
                               </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"> << back to home  </a><br /><br />
            </div>
        </div>
    </div>

</asp:Content>


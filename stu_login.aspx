<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="stu_login.aspx.cs" Inherits="stu_login" %>

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
                                       <img width="150px" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                                             
                                  <center>
                                       <h3>Student Login</h3>
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
                                    <label>User Name</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_username"
                                        runat="server" placeholder="user name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_pass"
                                        runat="server" placeholder="password" TextMode="Password"></asp:TextBox>
                                </div>
                              
                                <div>
                                    <asp:Label runat="server" ID="information" Text=""></asp:Label>
                                </div>
                                  <div class="form-group">
                                   
                                    <asp:Button class="btn btn-dark btn-block btn-lg" ID="btn_slogin" runat="server" Text="login" OnClick="btn_slogin_Click"  />
                                </div>
                                  <%--<div class="form-group">
                                   <a href="sign_up.aspx">
                                      <input id="Button2"    class=" btn-info btn-block btn-lg" type="button" value="sing-up"  /></a>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <a href="homepage.aspx"> << back to home  </a><br /><br />
            </div>
        </div>
    </div>
</asp:Content>
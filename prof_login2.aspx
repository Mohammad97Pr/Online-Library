<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="prof_login2.aspx.cs" Inherits="prof_login" %>

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
                                       <h3>Professor Login</h3>
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
                                   
                                    <asp:Button class="btn btn-dark btn-block btn-lg" ID="Button1" runat="server" Text="login" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


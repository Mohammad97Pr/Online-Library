<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="Sign_up.aspx.cs" Inherits="Sign_up" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        
<div class="row">
    <div class="col-md-5 mx-auto">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-12">
                        <center>
                        <img src="imgs/send.png" width="200px" height="200px" />
                    </center>
                            </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <center>
                            <h1>Contact Us to Sign up</h1>
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                             <div class="form-group">
                                <label>Your First Name</label>
                                <asp:TextBox runat="server" ID="txt_fn" CssClass="form-control"></asp:TextBox>
                            </div>
                      
                    </div>
                    <div class="col-6">
                             <div class="form-group">
                                <label>Your Last Name</label>
                                <asp:TextBox runat="server" ID="txt_ln" CssClass="form-control"></asp:TextBox>
                            </div>
                      
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label>Your Email</label>
                        <asp:TextBox runat="server" ID="txt_mail" CssClass="form-control" TextMode="Email" />
                   </div> </div>
                </div>
                 <div class="row">
                    <div class="col-12">
                             <div class="form-group">
                                <label>Select Your College</label>
                                <asp:DropDownList runat="server" ID="ddlcollage" CssClass="form-control">
                                    <asp:ListItem Text="select" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="Faculty of Dentistry" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Faculty of Pharmacy" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Informatics Engineering" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="College of Architecture" Value="4"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                      
                    </div>
                    </div>
                <div class="row">
                    <div class="col-12">
                             <div class="form-group">
                                <label >Professor Or  Student</label>
                                <asp:DropDownList runat="server" ID="ddlprs" CssClass="form-control">
                                                                        <asp:ListItem Text="select" Value="-1"></asp:ListItem>

                                                                        <asp:ListItem Text="Professor" Value="1"></asp:ListItem>

                                                                        <asp:ListItem Text="Student" Value="2"></asp:ListItem>

                                                                      

                                </asp:DropDownList>
                            </div>
                      
                    </div>
                </div>
               
                <div class="row">
                    <div class="col-12">
                        <asp:Button runat="server" ID="btn00" Text="Submit Request" CssClass="btn btn-block btn-success" OnClick="btn00_Click" />
                    </div>
                </div>
                                        <asp:Label runat="server" ID="label1"  Font-Size="X-Large" Text=""></asp:Label>

            </div>
            </div>
        
        </div>
    </div>
</div>
</asp:Content>


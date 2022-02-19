<%@ Page Title="" Language="C#" MasterPageFile="~/admin_master.master" AutoEventWireup="true" CodeFile="add_stu.aspx.cs" Inherits="add_stu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class=" container ">
       
        <div class="row">
                 <div class=" col-md-7 mx-auto">
 
        
                               <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                       <img width="120px" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" col">
                                <center>
                                       <h3>Add Student</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>First Name</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_fname"
                                        runat="server" placeholder="first name">




                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_lname"
                                        runat="server" placeholder="last name">

                                    </asp:TextBox>
                                </div>
                            </div>
                      
                                <div class="col-md-4">
                                <div class="form-group">
                                    <label>collage</label>
                                    <asp:DropDownList ID="ddl_collage" runat="server" CssClass="form-control" DataTextField="col_name" DataValueField="col_id">
                                    </asp:DropDownList>
                                </div>
                            </div>
                 
                        </div>    
                        <div class="row">

                            <div class="col">
                                <center> 

      <span class ="badge badge-pill badge-primary">Login Information</span>
                                              </center>
                            </div>



                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>User Name</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_username"
                                        runat="server" placeholder="User Name">

                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_password"
                                        runat="server" placeholder="Password" TextMode="Password">

                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Check Password</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_chpassword"
                                        runat="server" placeholder="ReWritePassword" TextMode="Password">

                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />
                        <hr />
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <asp:Label ID="lbl1" Text="" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
 <asp:Button runat="server" ID="btn_addstu" Text="Add Student" CssClass="btn btn-success badge-pill btn-block" OnClick="btn_addstu_Click" />
                        </div>


                    </div>

                </div>
                <br />
                            </div>
     
                </div>
 
        </div>
</asp:Content>


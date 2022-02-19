<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="user_profile.aspx.cs" Inherits="user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class=" col-md-5">
                <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <asp:Label runat="server" ID="lbl1" Text="" Visible="false"></asp:Label>
                                       <img width="120px" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" col">
                                <center>
                                       <h3>Your Profile</h3>
                                    <span class="badge badge-pill badge-light">Account Stute :</span>
                                    <asp:Label class="badge badge-pill badge-success"
                                         ID="Label1" runat="server" Text="Active"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>First Name</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_fname" ReadOnly="true"
                                        runat="server" placeholder="first name">

                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_lname" ReadOnly="true"
                                        runat="server" placeholder="last name">

                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Type</label>
                                    <asp:TextBox runat="server"  CssClass="form-control" ID="txt_type" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>collage</label>
                                  <asp:TextBox runat="server" CssClass="form-control"
                                       ID="txt_collage" ReadOnly="true"></asp:TextBox>
                                        
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class=" col">
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
                                        runat="server" placeholder="User Name" ReadOnly="true">

                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_pass"
                                        runat="server" placeholder="Password"  ReadOnly="true">

                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>New password</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_npass"
                                        runat="server" placeholder="NewPassword" TextMode="Password">

                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />
                        <hr />
                        <br />
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <div class="form-group">
                                    <center>
                            
<asp:Button runat="server" ID="btn_update" class=" btn-primary btn-block  btn-lg" OnClick="btn_update_Click" Text="Update" />                        </center>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <a href="homepage.aspx"><< back to home  </a>
                <br />
                <br />
            </div>
            <div class="col-md-7 mx-auto">
                <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                       <img width="130px" src="imgs/books.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" col">
                                <center>
                                       <h3>Your Lectures</h3>
                                    <asp:Label class="badge badge-pill badge-primary"
                                         ID="Label2" runat="server" Text="the Lectures you have uploaded"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col mx-auto">
                               <asp:GridView ID="grid_files" runat="server" AutoGenerateColumns="False" CssClass="table table-striped  table-bordered table-primary mx-auto"
                                    OnRowCommand="grid_files_RowCommand">

                                    <Columns>
                                                       <asp:BoundField DataField="leccture_id" HeaderText="ID" SortExpression="f" />
                                        <asp:BoundField DataField="file_title" HeaderText="Title" />
                                        <asp:BoundField DataField="course_name" HeaderText="Course" />

                                        <asp:BoundField DataField="upload_date" HeaderText="Date" />
                                        <asp:TemplateField HeaderText="path" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_path" runat="server" Text='<%# Bind("path") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
   
                                        <asp:TemplateField HeaderText="fileid" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="fileid1" runat="server" Text='<%# Bind("file_id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="downloads" HeaderText="Downloads" />


                                        <asp:ButtonField ButtonType="Button" CommandName="down" ControlStyle-CssClass="badge-success badge-pill" Text="Download">

                                            <ControlStyle CssClass="btn btn-success badge-pill"></ControlStyle>
                                        </asp:ButtonField>

                                        <asp:ButtonField ButtonType="Button" CommandName="del" Text="Delete" ControlStyle-CssClass="badge-danger badge-pill">

                                            <ControlStyle CssClass=" btn btn-danger badge-pill" />
                                        </asp:ButtonField>

                                        <asp:TemplateField HeaderText="lbl1" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl1" runat="server" Text='<%# Bind("file_id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="badge-info badge-pill" CommandName="view" Text="View" >
                                                                             <ControlStyle CssClass=" btn btn-info badge-pill" />
           
                                           </asp:ButtonField>

                                    </Columns>
                                </asp:GridView>
                            


                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

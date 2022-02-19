<%@ Page Title="" Language="C#" MasterPageFile="~/admin_master.master" AutoEventWireup="true" CodeFile="users_management.aspx.cs" Inherits="users_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
         <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                            <asp:DropDownList ID="ddlusers" runat="server"
                                Visible="false" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlusers_SelectedIndexChanged">
                                <asp:ListItem Text="choose type" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="Professors" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Students" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                    
                </div>
            </div>
        <div class="row">
            <div class="col-4 mx-auto">
   <div class="form-group">
                             <center>
                    <br />
                            <asp:DropDownList ID="ddlcollage" runat="server" DataTextField="col_name"
                                DataValueField="col_id" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlcollage_SelectedIndexChanged">
                            </asp:DropDownList>
                    </center>
                    </div></div>
                        </div>
        <div class="row" style="font-size:large;"> 
            <br />
          
                <div class="col-md-6 mx-auto">
                    <asp:Panel ID="pr_p1" runat="server">
                        <hr />
                  <asp:Label runat="server" ID="Label1" Text="The Number Of Professors In All Colleges :"></asp:Label>
                            <asp:Label runat="server" ID="lbl_pr" Text=""></asp:Label>
                    <hr />      
                    </asp:Panel>
            </div>
            <div class="col-md-6 mx-auto">
                                    <asp:Panel ID="pr_p2" runat="server">
                                        <hr />
              <asp:Label runat="server" ID="Label2" Text="The Number Of Professors In this Colleges :"></asp:Label>
                            <asp:Label runat="server" ID="lbl_pr2" Text=""></asp:Label>
                      <hr />
                                            </asp:Panel>

        </div>  </div>
        <div class="row" style="font-size:large;">
                   <div class="col-md-6 mx-auto">
                    <asp:Panel ID="st_s1" runat="server">
                        <hr />
                  <asp:Label runat="server" ID="Label3" Text="The Number Of Students In All Colleges :"></asp:Label>
                            <asp:Label runat="server" ID="lbl_st1" Text=""></asp:Label>
                        
                        <hr />  </asp:Panel>
            </div>
            <div class="col-md-6 mx-auto">
                                    <asp:Panel ID="st_s2" runat="server">
                                        <hr />
              <asp:Label runat="server" ID="Label5" Text="The Number Of Students In this Colleges :"></asp:Label>
                            <asp:Label runat="server" ID="lbl_st2" Text=""></asp:Label>
                         
                                        <hr /> </asp:Panel>

        </div>  

            <hr />

        </div> 
        
                <div class="row" style="font-size:medium;">
                    <div class="col-12 mx-auto">
                        <div class="form-group">
                            <asp:Panel runat="server" ID="p1">
                                <asp:GridView ID="grid_files"
                                    runat="server" AutoGenerateColumns="False" CssClass="table table-striped  table-bordered table-primary mx-auto" OnRowCommand="grid_files_RowCommand">

                                    <Columns>

                                        <asp:BoundField DataField="prof_id" HeaderText="ID" />
                                        <asp:BoundField DataField="prof_fname" HeaderText="First Name" />
                                        <asp:BoundField DataField="prof_lname" HeaderText="Last Name" />
                                        <asp:BoundField DataField="prof_type" HeaderText="Type" />
                                        <asp:BoundField DataField="prof_username" HeaderText="User Name" />
                                        <asp:BoundField DataField="prof_password" HeaderText="Password" />

                                        <asp:ButtonField ButtonType="Button" CommandName="del" Text="Delete" ControlStyle-CssClass=" btn btn-danger badge-pill">

                                            <ControlStyle CssClass=" btn btn-danger badge-pill" />
                                        </asp:ButtonField>

                                        <asp:TemplateField HeaderText="lbl1" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl1" runat="server" Text='<%# Bind("prof_id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                    </div>

                </div>

        <div class="row" style="font-size:medium;">
                <div class="col-12 mx-auto">
                    <div class="form-group">
                        <asp:Panel ID="p2" runat="server">
                            <asp:GridView ID="grid_files2" runat="server"
                 
                                AutoGenerateColumns="False" CssClass="table table-striped  table-bordered table-primary mx-auto" OnRowCommand="grid_files2_RowCommand">

                                <Columns>

                                    <asp:BoundField DataField="stu_id" HeaderText="ID" />
                                    <asp:BoundField DataField="sfname" HeaderText="First Name" />
                                    <asp:BoundField DataField="slname" HeaderText="Last Name" />
                                    <asp:BoundField DataField="susername" HeaderText="User Name" />
                                    <asp:BoundField DataField="spassword" HeaderText="Password" />


                                    <asp:ButtonField ButtonType="Button" CommandName="del1" Text="Delete" ControlStyle-CssClass=" btn btn-danger badge-pill">

                                        <ControlStyle CssClass=" btn btn-danger badge-pill" />
                                    </asp:ButtonField>

                                    <asp:TemplateField HeaderText="lbl2" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl2" runat="server" Text='<%# Bind("stu_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                </div>

            </div>
        
        </div>
    
</asp:Content>


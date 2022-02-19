<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

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
            <div class="col-12"><center>
                <br />
                <p class="badge badge-info" style="font-size:x-large; "> Lectures page  </p></center>
            </div>
        </div>
        <div class="row">
       
        <div class="col-md-4 mx-auto">                                    
                            <asp:DropDownList ID="ddlsem1" runat="server" DataTextField="sem_name"
                                DataValueField="sem_id" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlsem1_SelectedIndexChanged">
                            </asp:DropDownList>
            </div>
            
        
             <div class="col-md-4 mx-auto">      
                      <asp:DropDownList ID="ddlcourse1" runat="server" CssClass="form-control"
                                DataTextField="course_name" DataValueField="course_id" OnSelectedIndexChanged="ddlcourse1_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>

            </div>            </div>
        <div class="row">
                 <div class="col-md-6">
                      <asp:DropDownList ID="ddlyear1" runat="server" DataTextField="year_name"
                                CssClass="form-control" Visible="false" DataValueField="year_id" AutoPostBack="True" OnSelectedIndexChanged="ddlyear1_SelectedIndexChanged">
                            </asp:DropDownList>
 </div>
             </div>
        <br />
        <hr />
        <br />
            <div class="row">
            <div class="col-12 mx-auto ">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                                <asp:GridView ID="grid_files" runat="server" AutoGenerateColumns="False" 
                                                         

                                   CssClass="table table-striped table-primary  table-bordered" OnRowCommand="grid_files_RowCommand" Font-Size="Large">

                                    <Columns>

                                        <asp:BoundField DataField="leccture_id" HeaderText="ID" />
                                        <asp:BoundField DataField="file_title" HeaderText="File Title" />
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

                                        <asp:BoundField DataField="prof_funame" HeaderText="Professor" />
                                        <asp:BoundField DataField="prof_type" HeaderText="Type" />
                                        <asp:BoundField DataField="downloads" HeaderText="Downloads" />


                                        <asp:ButtonField ButtonType="Button" CommandName="down" ControlStyle-CssClass="badge-success badge-pill" Text="download">

                                            <ControlStyle CssClass="btn btn-success badge-pill"></ControlStyle>
                                        </asp:ButtonField>
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
   
</asp:Content>


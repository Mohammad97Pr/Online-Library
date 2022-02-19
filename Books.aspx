<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="Books.aspx.cs" Inherits="Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="row">
                    <div class="col-12 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h4>Book Inventory List</h4>
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
                           <center>
                                     <asp:GridView ID="grid_Books" runat="server" OnRowCommand="grid_Books_RowCommand"
                                     AutoGenerateColumns="False" CssClass="table table-striped table-primary  table-bordered ">
                                    <Columns>
                                                                            <asp:TemplateField HeaderText="lbl01" Visible="False">

                                            <ItemTemplate>
                                                <asp:Label ID="lbl01" runat="server" Text='<%# Bind("Book_id") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="path" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_path1" runat="server" Text='<%# Bind("book_path") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>

                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">

                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <asp:Label runat="server" ID="Label1" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" Text='<%# Eval("book_name") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Auther:
                                                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("auther_name") %>'></asp:Label>
                                                                    &nbsp;|&nbsp; Language:
                                                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("b_lan") %>'></asp:Label>
                                                                    &nbsp;| Genre:
                                                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Publisher:
                                                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("pub_name") %>'></asp:Label>
                                                                    &nbsp;| Publish Date:
                                                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("pub_date") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    pages:
                                                                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("page") %>'></asp:Label>
                                                                    &nbsp;| Edition:
                                                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("edition_") %>'></asp:Label>
                                                                    &nbsp;| Downloads:
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("downloads") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Description:
                                                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("description_book") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-2">
                                                            <asp:Image ID="Image1" Height="150px"  class="img-fluid" runat="server" ImageUrl='<%# Eval("img_link") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>


                                        </asp:TemplateField>
                                         
                                        <asp:ButtonField ButtonType="Button" CommandName="down" ControlStyle-CssClass="badge-success badge-pill"  Text="Download">

                                            <ControlStyle CssClass="btn btn-success badge-pill"></ControlStyle>
                                        </asp:ButtonField>

                                        <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="badge-info badge-pill" CommandName="view" Text="View">
                                            <ControlStyle CssClass=" btn btn-info badge-pill" />

                                        </asp:ButtonField>
</Columns>
                                </asp:GridView>
                              </center>  </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
    </div>
</asp:Content>


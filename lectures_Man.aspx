<%@ Page Title="" Language="C#" MasterPageFile="~/admin_master.master" AutoEventWireup="true" CodeFile="lectures_Man.aspx.cs" Inherits="lectures_Man" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <br />
        <div class="row" style="font-size: large;">
            <div class="col-md-3">
                <div class="form-group">
                    <label>Choose Your Collage</label>
                    <asp:DropDownList ID="ddlcollage" runat="server" DataTextField="col_name"
                        DataValueField="col_id" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlcollage_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Choose collage year </label>

                    <asp:DropDownList ID="ddlyear" runat="server" CssClass="form-control" DataTextField="year_name" DataValueField="year_id" AutoPostBack="True" OnSelectedIndexChanged="ddlyear_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Choose the Semester </label>

                    <asp:DropDownList ID="ddlsemester" DataTextField="sem_name" DataValueField="sem_id" runat="server" CssClass="form-control" AutoPostBack="True"
                        OnSelectedIndexChanged="ddlsemester_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label>Choose course </label>

                    <asp:DropDownList ID="ddlcourse" runat="server" CssClass="form-control" DataTextField="course_name" DataValueField="course_id" AutoPostBack="True" OnSelectedIndexChanged="ddlcourse_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <hr />
        <div class="row" style="font-size: large;">

            <div class="col-6 mx-auto">
                <center>
                            <asp:Label runat="server" ID="Label1" Text="The Number Of Files In All Colleges :"></asp:Label>
                            <asp:Label runat="server" ID="Label2" Text=""></asp:Label>
                            <div class="hr-line-dashed"></div>
                            <hr />
             </center>
            </div>

            <div class="col-6 mx-auto">
                <center>
                            <asp:Label runat="server" ID="Num_files" Text="The Number Of Files In This College :"></asp:Label>
                            <asp:Label runat="server" ID="Num_files1" Text=""></asp:Label>
                            <div class="hr-line-dashed"></div>
                            <hr />
             </center>
            </div>


        </div>
        <div class="row">
            <div class="col-12 mx-auto ">
                <div class="row" style="font-size: medium;">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <asp:Panel ID="p1" runat="server">
                                <asp:GridView ID="grid_files" runat="server"
                                    AutoGenerateColumns="False" CssClass="table table-striped  table-bordered table-primary mx-auto"
                                    OnRowCommand="grid_files_RowCommand" PageSize="8">

                                    <Columns>
                                        <asp:BoundField DataField="file_id" HeaderText="Id" SortExpression="f" />
                                        <asp:BoundField DataField="file_title" HeaderText="Title" />
                                        <asp:BoundField DataField="upload_date" HeaderText="Date" />
                                        <asp:TemplateField HeaderText="path" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_path" runat="server" Text='<%# Bind("path") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="prof_funame" HeaderText="Professor" />
                                        <asp:BoundField DataField="prof_type" HeaderText="Type" />
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

                                        <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="badge-info badge-pill" CommandName="view" Text="View">
                                            <ControlStyle CssClass=" btn btn-info badge-pill" />

                                        </asp:ButtonField>

                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                    </div>

                </div>
            </div>

        </div>

    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/admin_master.master" AutoEventWireup="true" CodeFile="homeadmin.aspx.cs" Inherits="homeadmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-lg">
        <div class="row">
            <div class="col mx-auto">
                <br />
                <center>
                <span class="badge badge-warning badge-pill" style="font-size:xx-large;">Welcome Admin</span>
             <br />  <br /> <span class="badge badge-warning badge-pill" style="font-size:x-large;">This is what you can do</span>
           </center> </div>
        </div><hr />
        <div class="row">

            <div class="col-md-6">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/download.png"  height="225px"/>
                        </center>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btn_profadd" Text="Add New Professor" OnClick="btn_profadd_Click" />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="col-md-6">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                             <img src="imgs/download%20(1).png" />
                        </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">

                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btn_stuadd" Text="Add New Student" OnClick="btn_stuadd_Click" />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
                <br />

            </div>
        </div>
        <div class="row">

            <div class="col-md-6">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                            <img src="imgs/stude.png" height="225px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="Button1" Text="Management Professors" AccessKey="1" OnClick="Button1_Click" />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="col-md-6">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <img src="imgs/students-icon.png" height="225px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">

                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="Button2" Text="Management Students" AccessKey="2" OnClick="Button2_Click" />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
                <br />

            </div>
            <div class="col-md-6">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                        <img src="imgs/icon-lectures-and-discussions.png" />
                        </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">

                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="Button3" Text="Management Lectures" OnClick="Button3_Click" />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
                <br />

            </div>
            <div class="col-md-6">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                        <img src="imgs/study.png" height="200px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">

                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="Button4" Text="Add Books" OnClick="Button4_Click" />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
                <br />

            </div>
        </div>
        </div>
</asp:Content>

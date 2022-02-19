<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="professoruploadfiles.aspx.cs" Inherits="uploadexample" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div class="container">
        <div class="row">
            <div class=" col-md-10 mx-auto">
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
                                       <h3>upload lectures</h3>
                                  <h4><span class="badge badge-pill badge-light" >Hello professor</span></h4>
                                    <asp:Label class="badge badge-pill badge-success"
                                         ID="fullname" runat="server" Font-Size="Large"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:label id="lbl_username" runat="server" text=""></asp:label>
                                <hr />
                            </div>
                        </div>
                                        <div class="row">       
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Lecture Id</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_lectureid"
                                        runat="server" placeholder="lecture id , only number" TextMode="Number">

                                    </asp:TextBox>
                                </div>
                            </div>
                        
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Lecture Title</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_title"
                                        runat="server" placeholder="lecture title"></asp:TextBox>
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Choose college</label>

                                    <asp:DropDownList ID="ddlcollage" runat="server" CssClass="form-control " DataTextField="col_name" DataValueField="col_id" AutoPostBack="true" OnSelectedIndexChanged="ddlcollage_SelectedIndexChanged1">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Choose college yeare </label>

                                    <asp:DropDownList ID="ddlyear" runat="server" CssClass="form-control" DataTextField="year_name" DataValueField="year_id" AutoPostBack="True" OnSelectedIndexChanged="ddlyear_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Choose the Semester </label>

                                    <asp:DropDownList ID="ddlsemester" DataTextField="sem_name" DataValueField="sem_id" runat="server" CssClass="form-control" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlsemester_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Choose course </label>

                                    <asp:DropDownList ID="ddlcourse" runat="server" CssClass="form-control" DataTextField="course_name" DataValueField="course_id">
                                        </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>choose your lecture </label>
                                <div class="custom-file">
                                <div class="form-group">
                                <div class="input-group mb-3">
                             <asp:FileUpload ID="FileUpload1" runat="server" CssClass="custom-file-input"  Width="100%"/>
                                   <label class="custom-file-label" for="FileUpload1" ></label>
                                            </div>      
                            </div>

                            </div></div>
                        </div>
                        <asp:Label ID="lbl1" runat="server" Text=""></asp:Label>                    </div>
    
                                    <br />
                    <hr />

                    <div class="form-group">

                        <asp:Button class="btn btn-outline-success btn-block btn-lg"
                             ID="upload" runat="server" Text="Upload The File" OnClick="upload_Click1" />
                    </div>



                </div>
            </div>
            <a href="homepage.aspx"><< back to home  </a>
            <br />
            <br />
        </div>
    </div>
    
</asp:Content>


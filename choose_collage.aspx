<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="choose_collage.aspx.cs" Inherits="choose_collage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>

        <h1>
            <center>
                <h1>Welcome <asp:Label runat="server" ID="full_name" Text="" ForeColor="Blue"></asp:Label> To U-Library</h1>
               <h2><span class="badge badge-pill badge-secondary"> Select your year from your collage </span>
                   <asp:Label runat="server" ID="lbl0"
                        Text="" Visible="false"></asp:Label>
        </h2>
       </center>
            <hr />
    </section>
    <section>
        <asp:Panel ID="p1" runat="server" AccessKey="1" Visible="false">
            <div class="container" id="div1">

                <img src="imgs/onecol.jpg" style="width: 100%; height: 400px;" />
                <div class="content1">
                    <h1><span class=" d-print-block align-content-center">Faculty of Dentistry </span></h1>
                    <br />
                    <p><span class=" d-lg-block ">duration of study in this college is five years </span></p>
                    <hr />
                    <div class="form-group">
                        <asp:Button runat="server" class="btn  btn-primary  " ID="btncol11" AccessKey="1" Text="First year" OnClick="btncol11_Click" SkinID="1"></asp:Button>
                        <asp:Button runat="server" class="btn btn-primary " ID="btncol12" AccessKey="1" Text="Second year" OnClick="btncol12_Click" SkinID="2"></asp:Button>
                        <asp:Button runat="server" class="btn btn-primary " ID="btncol13" AccessKey="1" Text="third year" OnClick="btncol13_Click" SkinID="3"></asp:Button>
                        <asp:Button runat="server" class="btn btn-primary " ID="btncol14" AccessKey="1" Text="fourth year" OnClick="btncol14_Click" SkinID="4"></asp:Button>

                        <hr />
                        <asp:Button runat="server" class="btn btn-primary btn-block" ID="btncol15" AccessKey="1" Text="five year" OnClick="btncol15_Click" SkinID="5"></asp:Button>
                    </div>

                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="p2" runat="server" Visible="false">

            <div class="container" id="div2">
                <img width="100%" height="400px" src="imgs/ph2.jpg" />

                <div class="content">
                    <h1>Faculty of Pharmacy</h1>
                    <br />
                    <p>The duration of study in this college is five years</p>
                    <hr />
                    <div class="form-group">
                        <center>
                    <asp:Button runat="server" class="btn btn-success " ID="btncol21" AccessKey="2" SkinID="6" Text="First year" OnClick="btncol21_Click"></asp:Button>
                    <asp:Button runat="server" class="btn btn-success " ID="btncol22" AccessKey="2" Text="Second year" OnClick="btncol22_Click" SkinID="7"></asp:Button>
                    <asp:Button runat="server" class="btn btn-success " ID="btncol23" AccessKey="2" Text="third year" OnClick="btncol23_Click" SkinID="8"></asp:Button>
                    <asp:Button runat="server" class="btn btn-success " ID="btncol24" AccessKey="2" Text="fourth year" OnClick="btncol24_Click" SkinID="9"></asp:Button>
                   </center>
                        <hr />
                        <asp:Button runat="server" class="btn btn-success btn-block " ID="btncol25" AccessKey="2" Text="five year" OnClick="btncol25_Click" SkinID="10"></asp:Button>

                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="p3" runat="server" Visible="false">
            <div class="container">
                <img width="100%" height="400px" src="imgs/48.jpg" />
                <div class="content1">
                    <h1>Informatics Engineering 
                    </h1>

                    <br />
                    <p>The duration of study in this college is five years</p>
                    <hr />
                    <asp:Button runat="server" class="btn btn-warning " ID="btncol31" AccessKey="3" SkinID="11" Text="First year" OnClick="btncol31_Click"></asp:Button>
                    <asp:Button runat="server" class="btn btn-warning " ID="btncol32" AccessKey="3" Text="Second year" OnClick="btncol32_Click" SkinID="12"></asp:Button>
                    <asp:Button runat="server" class="btn btn-warning " ID="btncol33" AccessKey="3" Text="third year" OnClick="btncol33_Click" SkinID="13"></asp:Button>
                    <asp:Button runat="server" class="btn btn-warning " ID="btncol34" AccessKey="3" Text="fourth year" OnClick="btncol34_Click" SkinID="14"></asp:Button>
                    <hr />
                    <asp:Button runat="server" class="btn btn-warning btn-block " ID="btncol35" AccessKey="3" Text="five year" OnClick="btncol35_Click" SkinID="15"></asp:Button>
                </div>

            </div>
        </asp:Panel>
        <asp:Panel ID="p4" runat="server" Visible="false">
            <div class="container">
                <img width="100%" height="400px" src="imgs/4col.jpg" />
                <div class="content">
                    <h1>College of Architecture</h1>
                    <br />
                    <p>The duration of study in this college is five years</p>
                    <hr />
                    <asp:Button runat="server" class="btn btn-info " ID="btncol41" AccessKey="4" SkinID="16" Text="First year" OnClick="btncol41_Click"></asp:Button>
                    <asp:Button runat="server" class="btn btn-info " ID="btncol42" AccessKey="4" Text="Second year" OnClick="btncol42_Click" SkinID="17"></asp:Button>
                    <asp:Button runat="server" class="btn btn-info " ID="btncol43" AccessKey="4" Text="third year" OnClick="btncol43_Click" SkinID="18"></asp:Button>
                    <asp:Button runat="server" class="btn btn-info " ID="btncol44" AccessKey="4" Text="fourth year" OnClick="btncol44_Click" SkinID="19"></asp:Button>
                    <hr />
                    <asp:Button runat="server" class="btn btn-info btn-block " ID="btncol45" AccessKey="4" Text="five year" OnClick="btncol45_Click" SkinID="20"></asp:Button>
                </div>

            </div>
        </asp:Panel>
        <asp:Panel ID="p5" runat="server" Visible="false">
            <div class="container">
                <img width="100%" height="400px" src="imgs/5col.jpg" />
                <div class="content1">
                    <h2>Communications Engineering</h2>
                    <br />
                    <p>The duration of study in this college is five years</p>
                    <hr />
                    <asp:Button runat="server" class="btn btn-secondary " ID="btncol51" AccessKey="5" SkinID="21" Text="First year" OnClick="btncol51_Click"></asp:Button>
                    <asp:Button runat="server" class="btn btn-secondary " ID="btncol52" AccessKey="5" Text="Second year" OnClick="btncol52_Click" SkinID="22"></asp:Button>
                    <asp:Button runat="server" class="btn btn-secondary" ID="btncol53" AccessKey="5" Text="third year" OnClick="btncol53_Click" SkinID="23"></asp:Button>
                    <asp:Button runat="server" class="btn btn-secondary" ID="btncol54" AccessKey="5" Text="fourth year" OnClick="btncol54_Click" SkinID="24"></asp:Button>
                    <hr />
                    <asp:Button runat="server" class="btn btn-secondary btn-block " ID="btncol55" AccessKey="5" Text="five year" OnClick="btncol55_Click" SkinID="25"></asp:Button>
                </div>

            </div>
        </asp:Panel>
        <asp:Panel ID="p6" runat="server" Visible="false">
            <div class="container">

                <img width="100%" height="400px" src="imgs/6cols.jpg" />
                <div class="content">
                    <h1>Mechatronics Engineering College</h1>
                    <br />
                    <p>The duration of study in this college is five years</p>
                    <hr />
                    <button type="button" class="btn btn-light" id="btncol61">First Year</button>
                    <button type="button" class="btn btn-light" id="btncol62">Second Year</button>
                    <button type="button" class="btn btn-light" id="btncol63">Third Year</button>
                    <button type="button" class="btn btn-light" id="btncol64">Fourth Year</button>
                    <button type="button" class="btn btn-light" id="btncol65">Five Year</button>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="p7" runat="server" Visible="false">
            <div class="container">
                <img width="100%" height="400px" src="imgs/7col.jpg" />
                <div class="content1">
                    <h1>Faculty of Physical Therapy</h1>
                    <br />
                    <p>The duration of study in this college is fourth years</p>
                    <hr />
                    <button type="button" class="btn btn-outline-primary" id="btncol71">First Year</button>
                    <button type="button" class="btn btn-outline-primary" id="btncol72">Second Year</button>
                    <button type="button" class="btn btn-outline-primary" id="btncol73">Third Year</button>
                    <button type="button" class="btn btn-outline-primary" id="btncol74">Fourth Year</button>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="p8" runat="server" Visible="false">
            <div class="container">
                <img width="100%" height="400px" src="imgs/busnis.jpg" />
                <div class="content">

                    <h1>College of Business Administration</h1>
                    <br />
                    <p>The duration of study in this college is four years</p>
                    <hr />
                    <button type="button" class="btn btn-dark" id="btncol81">First Year</button>
                    <button type="button" class="btn btn-dark" id="btncol82">Second Year</button>

                    <button type="button" class="btn btn-dark" id="btncol83">Third Year</button>
                    <button type="button" class="btn btn-dark " id="btncol84">Fourth Year</button>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="p9" runat="server" Visible="false">
            <div class="container">
                <img width="100%" height="400px" src="imgs/law.jpg" />
                <div class="content1">
                    <h1>college of Law</h1>
                    <br />
                    <p>The duration of study in this college is four years</p>
                    <hr />
                    <button type="button" class="btn btn-danger" id="btncol91">First Year</button>
                    <button type="button" class="btn btn-danger" id="btncol92">Second Year</button>
                    <button type="button" class="btn btn-danger" id="btncol93">Third Year</button>
                    <button type="button" class="btn btn-danger" id="btncol94">Fourth Year</button>
                </div>
            </div>

        </asp:Panel>
    </section>

</asp:Content>


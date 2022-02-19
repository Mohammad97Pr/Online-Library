<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("prof_login.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("stu_login.aspx");

    }

    protected void btn00_Click(object sender, EventArgs e)
    {
                Response.Redirect("Sign_up.aspx");

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="container1">
            <img src="imgs/lol1.jpg" width="100%" height="690px" />
            <div class="content2">
                <h1><span class=" d-print-block align-content-center">Welcome to the U-Library
                </span></h1>
                <hr style="color: greenyellow;" />
                <p style="font-size: x-large;">
                    This is an electronic university library<br />
                    that brings together professors and
                </p>
                <p style="font-size: x-large;">
                    students to improve teaching methods 
                                           <br />
                    save time and money
                </p>
                <br />
            </div>
        </div>
    </section>
<section>
         <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                   <br />
                   <br />
                  <span class="badge badge-warning badge-pill" style="font-size:xx-large;">Our Colleges</span>
               </center>
            </div>
         </div>
             
             <br />
             <hr />
         <div class="row">
            <div class="col-md-6">
               <center>
                  <img width="150px" src="imgs/100.png"/>
                  <h4>Faculty of Dentistry</h4>
               </center>
            </div>
            <div class="col-md-6">
               <center>
                  <img width="150px" src="imgs/200.png"/>
                  <h4>Faculty of Pharmacy</h4>
               </center>
            </div>
            </div>
             <div class="row">
       
                      <div class="col-md-6">
               <center>
                  <img width="150px" src="imgs/300.png"/>
                  <h4>Informatics Engineering</h4>
               </center>
            </div>
       
                      <div class="col-md-6">
               <center>
                  <img width="150px" src="imgs/400.png"/>
                  <h4>College of Architecture</h4>
               </center>
            </div>
         </div>
      </div>
   </section>

    <section>

        <div class="container">
            <div class="row">

                <div class="col-md-6">
                    <img src="imgs/88.jpg" width="110%" height="100%"/>
                </div>
                <div class="col-md-6 mx-lg-auto">
                    <div class="card" style="width: 100%; height: 100%; background-image: linear-gradient(to right top, #533e90, #50429b, #4b45a6, #434ab1, #374ebd, #2c61ce, #1d73df, #0085ee, #00a7fe, #00c6ff, #00e2fa, #5ffbf1);">
                        <div class="card-body">
                            <center>
                                <div class="row">
                            <div class="col">
                                   <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                  
       <h1 class="card-title" style=" color:yellow; font-weight:900; font-family:'Cambria, Cochin, Georgia, Times, Times New Roman, serif';">Hello Professor</h1>
             </div></div>
                        <div class="row"> <div class="col">
                  
                             <p class="card-text"><span style="width:100%;color:white; font-size:x-large;" > This is what we offer for you
You will have a special account provided by the university
You can log in to your account and upload your own lectures
You can also manage your profile
                   </span></p></div></div>
              <br />
                        </div>
                        <br />
                        <br />
                    <br />
                        <br />
                    <br />
                        <br />
                 
                                   <div class="row card-footer mx-auto" >
                                <div class="col">
                                    <center>
                              <asp:Button ID="Button1" runat="server" CssClass="btn btn-success btn-lg" Text="Log In" OnClick="Button1_Click"></asp:Button>
        </center>
                                </div>
                            </div>
                        </div>



                    
  </div>
                </div></div>
                      </section>
    <section>
         <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                   <br />
                   <br />
                  <span class="badge badge-primary badge-pill" style="font-size:xx-large;">Our services</span>
               </center>
            </div>
         </div>
             
             <br />
             <hr />
         <div class="row">
            <div class="col-md-6">
               <center>
                  <img width="150px" src="imgs/700.png"/>
                  <h4>Upload and Download Lectures</h4>
               </center>
            </div>
            <div class="col-md-6">
               <center>
                  <img width="150px" src="imgs/600.png"/>
                  <h4>View Lectures</h4>
               </center>
            </div>
            </div>
             <div class="row">
       
                      <div class="col-md-6">
               <center>
                  <img width="150px" src="imgs/800.png" height="150px"/>
                  <h4>Calculate GPA</h4>
               </center>
            </div>
       
                      <div class="col-md-6">
               <center>
                  <img width="150px" src="imgs/500.png"/>
                  <h4>Books And References</h4>
               </center>
            </div>
         </div>
      </div>
   </section>
    
   <section>

        <div class="container">
            <div class="row">


                <div class="col-md-6">

                    <img src="imgs/99.jpg" width="120%" height="100%" />
                </div>
                <div class="col-md-6">
                    <div class="card" style="width: 100%; height: 100%; background-image: linear-gradient(to left top, #533e90, #50429b, #4b45a6, #434ab1, #374ebd, #2c61ce, #1d73df, #0085ee, #00a7fe, #00c6ff, #00e2fa, #5ffbf1);">
                        <div class="card-body">
                            <center>
                                <div class="row">
                            <div class="col">
                                   <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                  
       <h1 class="card-title" style=" color:yellow; font-weight:900; font-family:'Cambria, Cochin, Georgia, Times, Times New Roman, serif';">Hello Student</h1>
             </div></div>
                        <div class="row"> <div class="col">
                  
                             <p class="card-text"><span style="width:100%;color:white; font-size:x-large;">
        This is what we can do for you<br />
You can log in with your account provided by the university
<br />Once logged in, you will be taken to your college page
<br />You can download the lectures
<br />You can also preview the lecture if you do not want to download it
<br />You can calculate the GPA
<br />There are also books and references in our library for you           </span></div></div>
              <br />
                        </div>
                        <br />
                        <br />
                    <br />
                        <br />
                    <br />
                        <br />
                 
                                   <div class="row card-footer mx-auto">
                                <div class="col">
                                    <center>
                              <asp:Button ID="Button2" runat="server" CssClass="btn btn-success btn-lg" Text="Log In" OnClick="Button2_Click"></asp:Button>
        </center>
                                </div>
                            </div>
                        </div>



                    
  </div>
                </div></div>
                      </section>
    <section>
         <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                   <br />
                   <br />
                  <span class="badge badge-info badge-pill" style="font-size:xx-large;">Support</span>
               </center>
            </div>
         </div>
             <br />
             <hr />
         <div class="row">
            <div class="col-12">
               <center>
              <p style="font-size:x-large;">Professor or Student<br /> 
                  If You Don`t have an account 
                  Don`t woory about that....<br />
                  you can send us your details  for check your status in university and create a new account for you 
              </p>
                    </center>
            </div>
            
            </div>
             <div class="row">
                 <div class="col-3 mx-auto">
                     <center>
<img src="imgs/sssss.png" width="150px" height="150px" />
                     </center>
                 </div>
             </div>
    <br />
                      <div class="row">
            <div class="col-3 mx-auto"><center>
       <asp:Button runat="server" ID="btn00" Text="Sign Up" CssClass="btn btn-lg btn-block btn-success" OnClick="btn00_Click" />
    </center>
                 </div> 
                 </div>
      </div>
   </section>
    <br />
    <br />
    </span>
</asp:Content>


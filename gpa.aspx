<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gpa.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>

    <!--// botstrap css-->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!--<%--custom css--%>-->
    <link href="css/customy.css" rel="stylesheet" />
    <!--<%--datatables css--%>-->
    <link href="datatables/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="upload.css" rel="stylesheet" />
    <link href="css/images.css" rel="stylesheet" />
    <!--<%--fonts--%>-->
    <link href="fontperson/css/all.css" rel="stylesheet" />
    <!--<%--jequery--%>-->
    <script src="bootstrap/js/jquery-3.5.1.slim.min.js"></script>
    <script src="gpajava.js"></script>
    <!--<%--popper js--%>-->
    <script src="bootstrap/js/popper.min.js"></script>
    <!--<%-- gpa --%>-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://cdn.firebase.com/js/client/2.1.1/firebase.js"></script>

    <script src="bootstrap/js/gpa0.js"></script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!--<%--botstrap js--%>-->
    <script src="bootstrap/js/bootstrap.min.js"></script>
   
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #7f53ac; background-image: linear-gradient(315deg, #7f53ac 0%, #647dee 74%); font-family: 'Lucida Fax'; font-size: large;">
            <a class="navbar-brand" href="#">
                <img src="imgs/ebook (1).png" width="70" height="40" />
                <span style="color: white; font-family: 'Lucida Calligraphy Italic';">U-Library</span>           </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="homepage.aspx"><span style="color: white;">Home </span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="professoruploadfiles.aspx"><span style="color: white;">Upload lectures</span> </a>
                    </li>
                                  <li class="nav-item active">
                        <a class="nav-link" href="choose_collage.aspx"><span style="color: white;">Download Lectures </span></a>
                    </li>


                </ul>

                <ul class="navbar-nav">
      
                    <li class="nav-item active">
                        <a class="nav-link" href="user_profile.aspx"><span style="color: white;">Update Profile </span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Books.aspx"><span style="color: white;">Books </span></a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="gpa.aspx"><span style="color: white;">GPA </span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Sign_up.aspx"><span style="color: white;">Sign Up </span></a>
                    </li>

                </ul>
            </div>




        </nav>    <hr />
    <div class="container">
        <div class="row">
            <h2 style="margin-left:30px; color:darkblue; font-weight:bold; font-family:Andalus;">Calculate the GPA</h2>
        </div>
        <div class="row">
         <p style="margin-left:30px;color:black;font-family:'Berlin Sans FB';font-size:large;">
               Want to calculate your college course grades?<br />
                 Our easy to use GPA calculator will help you calculate your GPA
               
                and stay on top of your study grades in just minutes! 
                </p>
        </div>

    </div>
    <hr />
    <div class=" container-fluid">

        <div class="row">
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
  <h2>  <span class="badge badge-info badge-pill"> GPA CALCULATING</span></h2>
        </center>
                            </div>

                        </div>
                        <hr />

                        <table class="table table-striped table-primary table-bordered" id="tableid">
                            <center>
                                                  <tr id="headtable">
                                <td id="class">
                                    <center>
                                    <p>Class </p>
                                
                                        <input maxlength="10" id="inp" type="text" name="Class">
                                </center>
                                </td>
                                <td id="credits">
                                    <center>
                                    <p>Credits </p>
                                    <select id="creds">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                     
                                                       </select>
                                </center>
                                </td>
                                <td id="grade" >
                         <center>
                                               <p>Grade </p>
                                    <select id="gradein">
                                        <option value="A+">A+ </option>
                                        <option value="A ">A  </option>
                                        <option value="A-">A- </option>
                                        <option value="B+">B+ </option>
                                        <option value="B ">B  </option>
                                        <option value="B-">B- </option>
                                        <option value="C+">C+ </option>
                                        <option value="C ">C  </option>
                                        <option value="C-">C- </option>
                                        <option value="D+">D+ </option>
                                        <option value="D ">D  </option>
                                        <option value="D-">D- </option>
                                        <option value="F ">F  </option>
                                    </select>
                               </center>
                                     </td>
                                <td class="button_cell" id="addcell">
                                    <center>
                                    <p id="addcell_text">Add/Remove </p>
                                    
                                    <button class="badge badge-success badge-pill" id="add" onclick=" addrow()" style="font-size:large;">+</button>
                                </center>
                                        </td>
                            </tr>

                            <tr id="entry" class="inputclass" style="display: none;">

                                <td class="class22">
                                                                    <center>
                    <output class="class"/>
                                                                           </center>
                                </td>
                                <td >  <center><output class="credits"></output></center></td>
                                <td > <center> <output class="grade"></output></center></td>
                                
                                <td class="button_cell" >
                        <button class="badge badge-danger badge-pill" 
                                               style="width:100%; font-size:large;" 
                                      onclick="removerow(this.parentNode.parentNode.id)" 
                                         id="sub">Remove</button>

                                    
                                         </td>
                             
                            </tr>
                            </center>
                        </table>
                    </div>

                </div>

            </div>
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <%-- class="inp_predict" type="text" --%>
                            <h3><span class="badge badge-success">Current Cumulative GPA : </span></h3>
                            &nbsp;
                              <output style="font-size: x-large; color: #4e0bcb;" id="cc_gpa" />
                        </div>
                        <br />

                        <div class="row">
                            <h3><span class="badge badge-success">Total Credit Hours :</span> </h3>
                            &nbsp;
                            <output style="font-size: x-large; color: #4e0bcb;" id="tot_hours" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <hr />
    <br />
    <div class="container">
        <div class="row">
            <h2 style="margin-left:30px; color:darkblue; font-weight:bold; font-family:Andalus;">How to Calculate your GPA </h2>
        </div>
        <div class="row">
            <p style="margin-left:30px;color:black;font-family:'Berlin Sans FB';font-size:large;">
                1- add your class name into box of class<br />
                2- choose the credits and grade of your class <br />
                3- click on + button to show your gpa
            </p>
        </div>
        <br />
        <div class="row">
            <h3 style="margin-left:30px; color:darkblue; font-weight:bold; font-family:Andalus;">
                <span class="badge badge-secondary"> Look to an image to help you</span> </h3><br />
           

        </div>
      </div>
          <section>   
                <img src="imgs/gpa.png" width="900px" />
          </section> 
          
    <footer class="page-footer font-small mdb-color lighten-3 pt-4" style="background-color: #2a2a72; background-image: linear-gradient(315deg, #2a2a72 0%, #009ffd 74%);">
        <form runat="server" id="f1">
            <!-- Footer Links -->
            <div class="container text-center text-md-left">

                <!-- Grid row -->
                <div class="row">

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 mr-auto my-md-4 my-0 mt-4 mb-1">

                        <!-- Content -->
            
                        <h4 class="font-weight-bold text-uppercase mb-4" style="color: yellow;">About Us</h4>
                        <p style="color: white; font-size: x-large;">U-Library</p>
                                     <p style="color: white; font-size: large;">
This is a university dynamic website library website
We are characterized by speed, high performance and reliability</p>
                                   <p style="color: white; font-size: large;">
               © U-Library, 2021
                        </p>

                    </div>
                    <!-- Grid column -->


                    <hr class="clearfix w-100 d-md-none" />

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 mx-auto my-md-4 my-0 mt-4 mb-1">

                        <!-- Contact details -->
                        <h4 class="font-weight-bold text-uppercase mb-4" style="color: yellow;">Address</h4>

                        <ul class="list-unstyled " style="font-size: large; color: white;">
                            <li>
                                <p>
                                    <i class="fas fa-home mr-3"></i>Damascus, Syria
                                </p>
                            </li>
                            <li>
                                <p>
                                    <i class="fas fa-envelope mr-3"></i>u.library@gmail.com
                                </p>
                            </li>
                            <li>
                                <p>
                                    <i class="fas fa-phone mr-3"></i>+963945216672
                                </p>
                            </li>
                          
                        </ul>

                    </div>
                    <!-- Grid column -->
                    <div class="col-md-4  mx-auto my-md-4 my-0 mt-4 mb-1">
                            <h3 style="color: yellow;">Contact Us</h3>
                            <div class="form-group">
                                <label style="font-size: larger; color: white;">Your Name</label>
                                <asp:TextBox runat="server" ID="txt_fname" CssClass="form-control"></asp:TextBox>
                            </div>
                            
                                <div class="form-group">
                                    <label style="font-size: larger; color: white;">Your Email</label>
                                    <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control"></asp:TextBox>
                                </div>
                 
                            <div class="form-group">
                                <label style="font-size: larger; color: white;">Your Message</label>

                                <asp:TextBox runat="server" ID="TextBox3" CssClass="form-control" TextMode="MultiLine" Rows="2">

                                </asp:TextBox>
                            </div>

                                        
                            <br />
                            <asp:Button runat="server" Text="Submit" ID="btn_sub" class="btn btn-warning btn-lg" OnClick="btn_sub_Click">
                                 
                            </asp:Button>
                        <asp:Label runat="server" ID="label1" ForeColor="White" Font-Size="X-Large" Text=""></asp:Label>
              </div>
                    </div>
                <hr style="font-size:x-large;" />
                <div class="row">
                    <div class="col-12 mx-auto">
                        <center>
               <h4 class="font-weight-bold text-uppercase mb-4" style="color: yellow;">For Admin you can log in from Here </h4>
                             </center>
                            </div>
                </div>
                <div class="row">
                    <div class="col-12 mx-auto">
                        <center>
                        <asp:LinkButton runat="server" ID="ll" Font-Size="X-Large" ForeColor="Wheat" Text="Admin login" OnClick="ll_Click" ></asp:LinkButton>
                    </center>
                            </div>
                </div>

                </div>
               
            </form>
        </footer>

             <script>
        //IDEAS:
        //Todo: add login and maybe facebook login, then store user tables

        //Todo: grade planner to predict grade in a class

        //TODO: put javascript in js folder, import at top of this file.

        //Todo: might move the prediction section down to another page, then center the table


        var webtable = new Firebase('https://gpa-calc.firebaseio.com');
        var myapp = { count: 1 };




        function addrow() {
            myapp.count++;
            var newid = document.getElementById("tableid").rows.length - 1;

            var className = document.getElementById("inp").value;

            if (className == null || classValidate(className) == false) {
                return;
            }

            if (newid < 40) {
                var newrow = $("#entry").clone().hide().attr('id', 'entry' + myapp.count).appendTo("#tableid").fadeIn('fast');

                document.getElementById("entry" + myapp.count).querySelector('.class').value = document.getElementById('inp').value;
                document.getElementById("entry" + myapp.count).querySelector('.credits').innerHTML = document.getElementById('creds').value;
                document.getElementById("entry" + myapp.count).querySelector('.grade').innerHTML = document.getElementById('gradein').value;
            }
            document.getElementById("inp").value = "";
            gpa_calc();
        };

        function removerow(row) {
            if (row != "entry") {
                var row1 = document.getElementById(row);
                $(row1).fadeOut('fast', function () {
                    $(row1).empty();
                    gpa_calc();

                });

            }

        };
        function gpa_calc() {
            /*
            For each course, multiply the grade points defined for the grade (A=4, etc.) by the credit hours of the course
            Add all of the Quality Points
            Add all of the GPA Hours
            Divide the sum of the Quality Points by the GPA Hours
            */
            var all_credits = document.getElementsByClassName('credits');
            var all_grades = document.getElementsByClassName('grade');
            var total_creds = 0;
            var qpts = 0;
            var gpa = 0;
            for (var i = 1; i < all_credits.length; i++) {
                qpts += 1 * ((all_credits[i].innerHTML) * letterConvert(all_grades[i].innerHTML));

                total_creds += 1 * (all_credits[i].innerHTML); //1* to prevent concatenation

                console.log(qpts);
            }
            gpa = (qpts / total_creds).toFixed(2);
            console.log(gpa);
            if (all_credits.length > 1) {
                document.getElementById("cc_gpa").value = gpa;
                document.getElementById("tot_hours").value = total_creds;

            }
            else {
                document.getElementById("cc_gpa").value = "0.00";
                document.getElementById("tot_hours").value = "0";
            }

        };

        function letterConvert(letter) {
            switch (letter) {
                case "A+":
                    return 4.00;

                case "A ":
                    return 4.00;

                case "A-":
                    return 3.67;

                case "B+":
                    return 3.33;

                case "B ":
                    return 3.00;

                case "B-":
                    return 2.67;

                case "C+":
                    return 2.33;

                case "C ":
                    return 2.00;

                case "C-":
                    return 1.67;

                case "D+":
                    return 1.33;

                case "D ":
                    return 1.00;

                case "D-":
                    return 0.67;

                case "F ":
                    return 0.00;
            }
        };





        function classValidate(txt) {
            // Function to check for letters and numbers and spaces only    
            var letterNumber = /^[0-9a-zA-Z\s]+[0-9a-zA-Z\s]*$/;
            if (txt.match(letterNumber)) {
                return true;
            }
            else {
                alert("Oops...", "Please only enter alpha-numeric characters and/or spaces for class names!", "error");
                return false;
            }
        };




    </script>


</body>
</html>

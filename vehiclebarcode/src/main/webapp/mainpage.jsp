<%@page import="com.itextpdf.text.List"%>
<%@page import="com.muthagroup.connection.ConnectionModel"%>
<%@page import="com.muthagroup.vo.MuthaGroupVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Mutha Group of Engineering Satara</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap-datepicker3.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" >
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
<script>
function myNewFunction(sel)
{
    document.getElementById('pname').value=sel.options[sel.selectedIndex].text;
}
</script>
<script>
	$(document).ready(function(){
		var date_input=$('input[name="date"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			format: 'M yyyy',
			startView: "months", 
          minViewMode: "months",
			container: container,
			todayHighlight: true,
			autoclose: true,
			orientation: 'top right',
		})
	})
</script>
<style>
  .modal-dialog {
  width: 90%;
}
.table-condensed{
  font-size: 10px;
  white-space: nowrap;
  width: 100%;
}

    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      text-align: center;
      
    }
   
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {datepicker.css
      background-color: #555;
      color: white;
      padding: 1px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    @import url(http://fonts.googleapis.com/css?family=Roboto);

/****** LOGIN MODAL ******/
.loginmodal-container {
  padding: 30px;
  max-width: 450px;
  width: 100%;
  background-color: #F7F7F7;
  margin: 0 auto;
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  font-family: roboto;
}

.loginmodal-container h1 {
  text-align: center;
  font-size: 1.8em;
  font-family: roboto;
}

.loginmodal-container input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.loginmodal-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover {
  height: 30px;
  font-size: 16px;
  width: type="text/javascript"100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.loginmodal {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}

.loginmodal-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #4d90fe;
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.loginmodal-container a {
  text-decoration: none;
  color: #666;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
} 
.barcodemodal-container {
   position: absolute;
   
  vertical-align: middle;
  text-align: center;
  height: 300px;
  font-size: 16px;
  width: 90%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}
.ERPmodal-container {
  text-align: center;
  max-height: 100%;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.login-help{
  font-size: 12px;
}
  </style>
 
</head>

<body >
<%
if ((session.getAttribute("user")!=null)) 
{ 
	String username=(String)session.getAttribute("user"); 
%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand"><font size="2">Vehicle Bar code</font><img src="images/mutha.jpg" class="img-circle" alt="Mutha logo" width=50 height=30></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#barcodeModal" >Bar-code Generation Form</button>
      <ul class="nav navbar-nav navbar-right">
        <li><a  data-toggle="modal" href="#loginModal"><span class="glyphicon glyphicon-log-out"></span><b> <%=username%></b> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="modal fade active" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	 <div class="modal-dialog">
			<div class="loginmodal-container">
				<h1>Are you want to Logout</h1><br>
				  <form action="Logout" method="post">
				  <input type="hidden" name="type" value="logout"/>
					<input type="submit" name="logout" class="login loginmodal-submit" value="Logout">
				  </form>
			</div>
		</div>
</div>
<div class="modal fade active" id="barcodeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	 <div class="modal-dialog">
<div class="barcodemodal-container">
<b>
<label>Delivery Vehicle Bar code Generation Form</label>
</b>
<!-- <Form action="BarcodeExcel?list" method=post target="_blank" onsubmit="setTimeout(function () { window.location.reload(); }, 10)" enctype="multipart/form-data">
<table align="center"><tr><td><input type="file" name=excelsheet required></td><td><input type="submit" value="Upload Excel Sheet"></td></tr></table>
</Form>  -->
<Form action="BarcodeExcel?form" method=post target="_blank" onsubmit="setTimeout(function () { window.location.reload(); }, 10)" >


<table class="tftable" id="myForm" align="center" >
<tr><td align="left" style="width:200px;" ><b>Driver First Name</b></td>
<td >
<input name =first_name placeholder="First Name" type="text"  id="ex" name="degn"  style="font-style: italic;" onchange="updateDept_Data(this.value)" required > 
</td>
<td align="left" style="width:200px;" ><b>Driver Last Name</b></td>
<td >
<input name =last_name placeholder="Last Name" type="text"  id="ex" name="degn"  style="font-style: italic;" onchange="updateDept_Data(this.value)" required > 
</td>
</tr>
<tr>
<td align="left" style="width:200px;" ><b>Mobile No</b></td><td >
<input name =moblie_no value="Mobile No" type="text" pattern="[0-9]{10}" id="ex" name="degn"  style="font-style: italic;" onchange="updateDept_Data(this.value)" required > 
</td><td align="left" style="width:200px;" ><b>Adhar or PAN Card No</b></td><td >
<input name =adhar_pan_card_no placeholder="Adhar or PAN Card No" type="text"  id="ex" name="degn"  style="font-style: italic;" onchange="updateDept_Data(this.value)" required > 
</td>
</tr>
<tr>
<td align="left" style="width:200px;" ><b>Driving licence No</b></td><td >
<input name =driving_lic_no placeholder="Driving licence No" type="text"  id="ex" name="degn"  style="font-style: italic;" onchange="updateDept_Data(this.value)" required > 
</td><td align="left" style="width:200px;" ><b>Vehicle No</b></td><td >
<input name =vehicle_no placeholder="Vehicle No" type="text"  id="ex" name="degn"  style="font-style: italic;" onchange="updateDept_Data(this.value)" required > 
</td>
</tr>
<tr>
<td align="left" style="width:200px;" ><b>Chassis No</b></td><td>
<input name =chassis_no placeholder="Chassis No" type="text"  id="ex" name="degn"  style="font-style: italic;" onchange="updateDept_Data(this.value)" required > 
</td><td align="left" style="width:200px;" ></td><td>
</td>
</tr>
<tr>
<td align="left" style="width:200px;" ><b>Fitness Certificate No</b></td><td >
<input name =fit_cer_no placeholder="Fitness Certificate No" type="text"  id="ex" name="degn"  style="font-style: italic;" onchange="updateDept_Data(this.value)" required > 
</td><td align="left" style="width:200px;" ><b>Fitness Certificate Expire Date</b></td><td >
<input name =fit_cer_exp_date placeholder="Fitness Certificate Expire Date" type="date"  id="ex" name="degn"  style="font-style: italic;" onchange="updateDept_Data(this.value)" required > 
</td>
</tr>
<tr>
<td align="left" style="width:200px;" ><b>Insurance No</b></td><td >
<input name =insur_no placeholder="Insurance No" type="text"  id="ex" name="degn"  style="font-style: italic;" onchange="updateDept_Data(this.value)" required > 
</td><td align="left" style="width:200px;" ><b>Insurance No Expire Date</b></td><td >
<input name =insur_no_exp_date placeholder="Insurance No Expire Date" type="date"  id="ex" name="degn"  style="font-style: italic;" onchange="updateDept_Data(this.value)" required > 
</td>
</tr>
<tr>
<td colspan=4 align="center">
<input type="submit" value="Submit" >
<input type="reset" value="Reset">
</td>
</tr>
</table>
</Form>
<!-- <table border="1">
<tr>
<td colspan="7"><b>Excel Table Format</b></td>
</tr>
<tr>
<th></th><th>ASSET CODE</th><th>SUPPLIER NAME</th><th>BILL NO</th><th>BILL DATE</th><th>MACHINE NAME</th><th>MACHINE CODE</th>
<th>	DRIVER NAME	</th>
<th>	MOBILE NO	</th>
<th>	ADHAR CARD NO/ PAN CARD NO	</th>
<th>	DRIVING LICENCE NO	</th>
<th>	VEHICLE NO	</th>
<th>	CHASSIS NO	</th>
<th>	FITNESS CERTIFICATE NO	</th>
<th>	 EXPIRE DATE	</th>
<th>	INSURANCE NO	</th>
<th>	 EXPIRE DATE	</th>
</tr>
</table> -->
</div>
</div>
</div>
<div class="modal fade active" id="ERPModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
			<div class="ERPmodal-container">
			ERP Upload Records
			</div>
	</div>
</div>

<%
}
else
{
response.sendRedirect("index.jsp"); 
} 
%>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Microscope Validate</title>

<style>
#rcorners2 {
    border-radius: 25px;
    border: 2px solid #73AD21;
    padding: 20px; 
    width: 400px;
    height: 40px;
}
</style>

<script type="text/javascript"> 
 function validate()
 {
     if(document.getElementById("mid").value == "A123")
     {
         return true;
     }
     else
     {
         alert("validation failed");
         return false;
     }
 }
</script>

</head>
<body>
	<center><h2>Microscope Authentication</h2></center>
	<br>
	<br>
	<center><img src="img/microscopy-products.png" ></center>
	<br>
	<br>
	<center><div id="rcorners2">
	<form onsubmit="return validate()" action="upload.jsp">
		<table align="center">
			<tr>
				<td>Microscope ID</td>
				<td><input type="text" name="microscopeID" id="mid" required/></td>
			</tr>
			<tr>
				<td><input type="submit" value="Authenticate Microscope"></td>
				<td><input type="reset" value="Reset"></td>
			</tr>
		</table>
	</form>
	</div></center>
</body>
</html>
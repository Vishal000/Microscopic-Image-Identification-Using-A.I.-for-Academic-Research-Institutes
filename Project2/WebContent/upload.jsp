<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Analyze AI</title>

<style>
#rcorners2 {
    border-radius: 25px;
    border: 2px solid #73AD21;
    padding: 20px; 
    width: 400px;
    height: 40px;
}
</style>

</head>
<body>
	<center><h2>Image Upload</h2></center>
	<center><div id="rcorners2">
	<form action="Result.jsp" method = "post" enctype = "multipart/form-data">
		<table align="center">
			<tr>
				<td align="center">
					<input type="file" name="uploadfile" accept="image/x-png,image/gif,image/jpeg" required/>
					<input type="submit" value="Upload & Analyze">
					<input type="reset" value="Reset">
				</td>
			</tr>
		</table>
	</form>
	</div></center>
</body>
</html>
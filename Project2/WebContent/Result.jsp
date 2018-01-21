<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.* " %>
<%@ page import="org.apache.commons.fileupload.disk.* " %>
<%@ page import="org.apache.commons.fileupload.servlet.* " %>
<%@ page import="org.apache.commons.io.output.* " %>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="java.io.ByteArrayOutputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="javax.xml.bind.DatatypeConverter"%>
<%@ page import="org.python.util.PythonInterpreter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Image Result</title>
</head>
<body>
	<%
   		File file ;
   		int maxFileSize = 8000 * 1024;
   		int maxMemSize = 8000 * 1024;
   		String filePath = "D:\\Zeiss HAckathon\\flower-recognition-master\\dataset\\test\\";
   		   		
   		String contentType = request.getContentType();
   		if((contentType.indexOf("multipart/form-data") >= 0)) 
   		{
		    DiskFileItemFactory factory = new DiskFileItemFactory();
      		factory.setSizeThreshold(maxMemSize);
      		//factory.setRepository(new File("c:\\temp"));
      		factory.setRepository(new File("D:\\Zeiss HAckathon\\flower-recognition-master\\dataset\\test\\"));
      		ServletFileUpload upload = new ServletFileUpload(factory);
      		upload.setSizeMax( maxFileSize );
      		try
      		{ 
         		List fileItems = upload.parseRequest(request);
         		Iterator i = fileItems.iterator();
         		while(i.hasNext ()) 
         		{
            		FileItem fi = (FileItem)i.next();
            		if(!fi.isFormField())
            		{
                		String fieldName = fi.getFieldName();
                		String fileName = fi.getName();
                		boolean isInMemory = fi.isInMemory();
                		long sizeInBytes = fi.getSize();
                		file = new File(filePath + "test.jpeg") ;
                		System.out.println(file.getAbsolutePath());
                		fi.write(file);
                		%>
                			<center><h3>Uploaded Filename: <%= fileName %></h3></center>
                		<%
                		
                		BufferedImage bImage = ImageIO.read(file);
				    	ByteArrayOutputStream baos = new ByteArrayOutputStream();
				    	ImageIO.write(bImage, "jpeg", baos);
				    	baos.flush();
				    	byte[] imageInByteArray = baos.toByteArray();
				    	baos.close();                                   
				    	String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
                		
				    	%>
				    		<img style="display: block; margin: 0 auto; width: 500px; height: 500px;" align="middle" id="responsive-image" src="data:image/jpg;base64, <%=b64%>"/>
				    		<hr>
				    		<center><h3>Result:</h3></center>
				    		
				    	<%
				    	
				    	//run python script
				    	Process p = null;
						try
						{	
							//p = Runtime.getRuntime().exec("python test.py"+" "+file.getAbsolutePath());
							String testCode = "D:\\Zeiss\" \"HAckathon\\flower-recognition-master\\test.py";
							//System.out.println("py -3 "+testCode);
							p = Runtime.getRuntime().exec("py -3 "+testCode);
							p.waitFor();
							
							BufferedReader stdInput = new BufferedReader(new java.io.InputStreamReader(p.getInputStream()));
					    	BufferedReader stdError = new BufferedReader(new java.io.InputStreamReader(p.getErrorStream()));
							
							String s = null;
							
							//System.out.println("Here is the standard output of the command:\n");
					    	while((s = stdInput.readLine()) != null)
					    	{
					    		//out.println(s);
					    	}
					    	
					    	//System.out.println("Here is the standard error of the command (if any):\n");
					    	while((s = stdError.readLine()) != null) 
					    	{
					    		//out.println(s);
					    	}
						}
						catch(Exception e)
						{
							e.printStackTrace();
						}
				    	
						//fetch the results from the python output file
						FileReader fr = new FileReader("D:\\Zeiss HAckathon\\flower-recognition-master\\data.txt");
						BufferedReader br = new BufferedReader(fr);
						
						String currLine;
						
						int len = 1;
						while((currLine = br.readLine()) != null)
						{
							if(len == 1)
							{
								out.println("Prediction: This is a "+currLine);
								%>
									<br>
								<%
								len++;
							}
							else if(len == 2)
							{
								//out.println("Total Model Precision: "+Float.parseFloat(currLine)*100+"%");
							}
						}
						
						br.close();
						fr.close();
            		}
         		}
      		}
      		catch(Exception ex) 
      		{
         		System.out.println(ex);
      		}
   		}
   		else
   		{
      		out.println("No file uploaded."); 
   		}
	%>	
	
	<br />
	<br />
	<center><button type="button" name="back" onclick="history.back()">Back</button></center>
	
</body>
</html>


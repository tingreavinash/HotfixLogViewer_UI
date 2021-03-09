<%@page import="java.util.Date"%>
<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Projects - Avinash Tingre</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/projects_repo.css">

<link rel="stylesheet" href="fontawesome-free-5.13.0-web/css/all.css">

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif:wght@700&display=swap"
	rel="stylesheet">
<link rel="icon" href="../image/favicon2.jpg" type="image/gif"
	sizes="64x64">

<style>
html, body {
	height: 100%;
}
</style>


</head>
<body style="margin: 0;">

<%
InetAddress ip = InetAddress.getByName(request.getRemoteAddr());

request.setAttribute("HostAddress", ip.getHostAddress());
request.setAttribute("RemoteHost", ip.getHostName());

System.out.println("\nProject Repository");
System.out.println("Time:\t" + new Date());
System.out.println("IP:\t"+ip.getHostAddress().toString());
System.out.println("Host:\t"+ip.getHostName().toString());

%>
	<div class="container-fluid h-100" id="container-fluid" >
	
	<div class="row justify-content-center" id="header">
		<h1 style="font-family: 'Noto Serif', serif;"	
						align="center">PROJECTS REPOSITORY</h1>
	</div>
	

	
	
		<div class="row align-items-center justify-content-center" style="margin-top:20px" >
		
		<div class="col-sm-4 ">
    <div class="card text-center custom-card">
    <div class="card-header"><span style="color:#7952b3"><i class="fas fa-search"></i></span> Hotfix Log Viewer</div>
      <div class="card-body ">
        <p class="card-text">Application for searching the hotfix details.</p>

		<a href="/HotfixLogUI" target="_blank" class="btn btn-outline-white-custom btn-sm card-btn-custom">Visit Application<i class="fas fa-external-link-square-alt ml-2"></i></a>        
      </div>

      
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card  text-center custom-card">
    <div class="card-header"><span class="text-primary"><i class="fas fa-file-code"></i></span> Hotfix Log Viewer - Swagger UI</div>
      <div class="card-body ">
        <p class="card-text">OpenAPI documentation for Hotfix Log Viewer application.</p>
		<a href="http://avinasht01:4569/swagger-ui.html" target="_blank" class="btn btn-outline-white-custom btn-sm card-btn-custom">Visit Application<i class="fas fa-external-link-square-alt ml-2"></i></a>        
      </div>

    </div>
  </div>
		
		</div>
		
		<div class="row align-items-center justify-content-center" style="margin-top: 20px;">
		
		<div class="col-sm-4 ">
    <div class="card text-center custom-card">
    <div class="card-header"><span class="text-success"><i class="fas fa-cloud-download-alt"></i></span> Hotfix Download Utility</div>
      <div class="card-body  ">
        <p class="card-text">Application for downloading hotfixes.</p>
      	<a href="http://avinasht01:4568/HFDownload/" target="_blank" class="btn btn-outline-white-custom btn-sm card-btn-custom">Visit Application<i class="fas fa-external-link-square-alt ml-2"></i></a>        
      </div>
      
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card  text-center custom-card">
    <div class="card-header"><span class="text-danger"><i class="fas fa-mug-hot"></i></span> Leave Management System</div>
      <div class="card-body ">
        <p class="card-text">Leave management application for ARM L2.</p>
      	<a href="http://avinasht01:4568/LMS/" target="_blank" class="btn btn-outline-white-custom btn-sm card-btn-custom">Visit Application<i class="fas fa-external-link-square-alt ml-2"></i></a>
        
      </div>
    </div>
  </div>
		
		</div>

		<div class="row align-items-center justify-content-center" style="margin-top: 20px;">		
		<h6 class="text-light small font-weight-bold "><i class="fas fa-code"></i> with <i class="fas fa-heart" ></i> by 
		<a href="sip:avinash.tingre@xyz.com" class="name-anchor" >Avinash Tingre</a></h6>
		</div>
		


	</div>
	
	
	<div style="position: fixed; bottom: 20px; right: 20px; z-index: 6;">
					<h5 style="margin:0px;"><span class="profile-btn " data-toggle="modal" data-target="#info_modal">
					<i class="fas fa-paper-plane"></i></span></h5>
				
					
					
									<div class="row">
					<div id="browserWarningWrapper" aria-live="polite" aria-atomic="true"
					style="position: relative; z-index: 9" class="d-flex justify-content-center align-items-center">
					<div id="browserWarning" class="toast" data-autohide="false"
						style="min-width: 300px; position: fixed;top: 50px; left:50%; margin-left:-150px;"
						role="alert" aria-live="assertive"
						aria-atomic="true">
						<div class="toast-header">
							<strong class="mr-auto text-danger">Warning !</strong>
							<!-- <button type="button" class="ml-2 mb-1 close"
								data-dismiss="toast" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button> -->
						</div>
						
						<div id="browserWarningBody" class="toast-body bg-secondary text-white">Currently not supported in <em><b>Internet Explorer.</b></em><br>
						Try with <b>Google Chrome.</b></div>
					</div>
				</div>
				</div>

				</div>
										<!-- Modal -->
				<div class="modal fade text-center" id="info_modal" tabindex="-1"
					role="dialog" aria-labelledby="custom_modal_title"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">

							<div class="modal-body" id="custom_modal_body">
								<div class="circle-image ">
									<img alt="info_image" src="../image/profile.jpg"
										class="profile-pic">
								</div>
								<br>
								<h4 class="modal-title" id="custom_modal_title">
									<b>Avinash Tingre</b>
								</h4>
								Software Support Engineer<br>with 2.5+ years of experience<br>
								
								<div class="row align-items-center justify-content-center" style="margin-top: 20px;">
								
								
								<div class="col col-sm-4">
									<div class="btn-group" role="group" aria-label="Basic example">
  										<button type="button" class="btn btn-outline-success btn-sm" disabled><i class="fas fa-envelope"></i></button>
  										<a href="mailto:avinash.tingre@xyz.com" id="mail_anchor" role="button" class="btn btn-outline-success btn-sm">Drop a Mail</a>
									</div>
								</div>

								<div class="col col-sm-4">
									<div class="btn-group" role="group" aria-label="Basic example">
  										<button type="button" class="btn btn-outline-success btn-sm" disabled><i class="fas fa-comment"></i></button>
  										<a href="sip:avinash.tingre@xyz.com" id="chat_anchor" role="button" class="btn btn-outline-success btn-sm">Say Hello</a>
									</div>
								</div>
								
	
						
								
								</div>		

							</div>
							<div class="modal-footer">
								<button type="button"
									class="btn btn-secondary btn-sm"
									data-dismiss="modal" id="result_close_btn">Close</button>

							</div>
						</div>
					</div>
				</div>
	<script type="text/javascript" src="js/jquery-3.5.1.slim.min.js"></script>
	<script type="text/javascript" src="js/popper.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript">

    (function () {
        var googleChrome = {
          string: navigator.userAgent.match(/Chrome\/(\d+)/)
          
        };
		
        googleChrome.version = googleChrome.string ? parseInt(googleChrome.string[1], 10) : null;

        if (!googleChrome.string) {
          document.getElementById("container-fluid").style.display= "none";
  		  document.getElementById('browserWarningWrapper').style.display="block";
		  $('#browserWarning').toast('show');
		  
        }else{
        	document.getElementById('browserWarning').style.display="none";
        	$('#browserWarning').toast('hide');
        	
        	}
    })();
            
</script>

</body>
</html>
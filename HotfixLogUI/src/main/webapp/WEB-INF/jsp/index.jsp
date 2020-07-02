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
<body class="custom-body" style="margin: 0;">
	<div class="container-fluid h-100" id="container-fluid">
	<div class="row justify-content-center"
					style="background-color: transparent; padding-top:5px;padding-bottom:5px;
					box-shadow: 0 8px 8px rgba(0,0,0,0.15)">
					<h2 style="margin: 5px; font-family: 'Noto Serif', serif;"
						align="center">PROJECTS REPOSITORY</h2>
				</div>
		
		<div class="row align-items-center justify-content-center" style="margin-top: 40px;">
		
		<div class="col-sm-4 ">
    <div class="card  text-center custom-card">
    <div class="card-header"><span style="color:#7952b3"><i class="fas fa-search"></i></span> Hotfix Log Viewer</div>
      <div class="card-body">
        <p class="card-text">Application for searching the hotfix details.</p>
        
      </div>
      <div class="card-footer bg-transparent">
      <a href="http://avinasht01/HotfixLogUI" target="_blank" class="btn btn-warning btn-sm">Visit application</a>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card text-center custom-card">
    <div class="card-header"><span class="text-primary"><i class="fas fa-file-code"></i></span> Hotfix Log Viewer - Swagger UI</div>
      <div class="card-body">
        <p class="card-text">OpenAPI documentation for Hotfix Log Viewer application.</p>
        
      </div>
      <div class="card-footer bg-transparent">
      <a href="http://avinasht01:4569/swagger-ui.html" target="_blank" class="btn btn-warning btn-sm">Visit application</a>
      </div>
    </div>
  </div>
		
		</div>
		
		<div class="row align-items-center justify-content-center" style="margin-top: 20px;">
		
		<div class="col-sm-4 ">
    <div class="card  text-center custom-card">
    <div class="card-header"><span class="text-success"><i class="fas fa-cloud-download-alt"></i></span> Hotfix Download Utility</div>
      <div class="card-body">
        <p class="card-text">Application for downloading hotfixes.</p>
        
      </div>
      <div class="card-footer bg-transparent">
      <a href="http://avinasht01:4568/HFDownload/" target="_blank" class="btn btn-warning btn-sm">Visit application</a>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card  text-center custom-card">
    <div class="card-header"><span class="text-danger"><i class="fas fa-mug-hot"></i></span> Leave Management System</div>
      <div class="card-body">
        <p class="card-text">Leave management application for ARM L2.</p>
        
      </div>
      <div class="card-footer bg-transparent">
      <a href="http://avinasht01:4568/LMS/" target="_blank" class="btn btn-warning btn-sm">Visit application</a>
      </div>
    </div>
  </div>
		
		</div>
		
		

						
				
	</div>
	<div style="position: fixed; bottom: 10px; right: 10px; z-index: 6;">
					<button class="btn btn-dark text-white" type="submit"
						name="profileBtn" value="profileClicked" data-toggle="modal"
						data-target="#info_modal">
						<i class="fas fa-paper-plane"></i>
					</button>
					
					
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
								<em>(OSS RM & Planning)</em><br>
							</div>
							<div class="modal-footer">
								<button type="button"
									class="btn btn-sm btn-custom-bg text-white"
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
<%@page import="com.fasterxml.jackson.databind.type.TypeFactory"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.io.Reader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.net.HttpURLConnection"%>
<%@ page import="java.util.ResourceBundle"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Hotfix Log Viewer</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" href="fontawesome-free-5.13.0-web/css/all.css">

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif:wght@700&display=swap"
	rel="stylesheet">
<link rel="icon" href="../image/favicon3.png" type="image/gif"
	sizes="64x64">

<style>
html, body {
	height: 100%;
}
</style>


</head>
<body class="custom-body" style="margin: 0;">
	<div class="se-pre-con" id="se-pre-con"></div>
	<%
	request.getSession(false);

	InetAddress ip = InetAddress.getByName(request.getRemoteAddr());

	request.setAttribute("HostAddress", ip.getHostAddress());
	request.setAttribute("RemoteHost", ip.getHostName());

	System.out.println("\nHotfix Log Viewer");
	System.out.println("Time:\t" + new Date());
	System.out.println("IP:\t" + ip.getHostAddress().toString());
	System.out.println("Host:\t" + ip.getHostName().toString());

	/*		try{
	 String auth = request.getHeader("Authorization");
	 System.out.println("Auth: "+auth);
	 
	 if (auth == null) {
	response.setStatus(response.SC_UNAUTHORIZED);
	response.setHeader("WWW-Authenticate", "NTLM");
	response.flushBuffer();
	System.out.println("Debug4");
	return;
	  }
	  if (!auth.startsWith("NTLM ")) {
		  System.out.println("Debug5");
		  System.out.println("No NTLM Header");
		  return;
	  }
	  
	  if (auth.startsWith("NTLM ")){
		  System.out.println("Debug6");

	byte[] msg = Base64.getDecoder().decode(auth.substring(5));
	StringBuilder sb_test = new StringBuilder();
	for (int i=0;i<msg.length; i++){
		sb_test.append(i+"="+msg[i]+", ");
	}
	//System.out.println("Test msg: "+sb_test.toString());
	int off = 0, length, offset;
	if (msg[8] == 1) {
	      byte z = 0;
	      byte[] msg1 = { (byte) 'N', (byte) 'T', (byte) 'L',
	                  (byte) 'M', (byte) 'S', (byte) 'S', (byte) 'P', z,
	                  (byte) 2, z, z, z, z, z, z, z, (byte) 40, z, z, z,
	                  (byte) 1, (byte) 130, z, z, z, (byte) 2, (byte) 2,
	                  (byte) 2, z, z, z, z, z, z, z, z, z, z, z, z };
	      response.setHeader("WWW-Authenticate", "NTLM "
	                  + Base64.getEncoder().encodeToString(msg1));
	      response.sendError(response.SC_UNAUTHORIZED);
	      System.out.println("Debug7");
	      return;
	} else if (msg[8] == 3) {
		System.out.println("Debug8");
	      off = 30;

	      length = msg[off + 17] * 256 + msg[off + 16];
	      offset = msg[off + 19] * 256 + msg[off + 18];
	      String remoteHost = new String(msg, offset, length);

	      length = msg[off + 9] * 256 + msg[off + 8];
	      offset = msg[off + 11] * 256 + msg[off + 10];
	      String username = new String(msg, offset, length);
	      
	      
	      StringBuffer sb = new StringBuffer();
	      for (int i = 0; i < username.length(); i += 2) {
	            sb.append(username.charAt(i));
	      }
	      String l_ntuser = new String(sb).toLowerCase();
	      System.out.println("Time:\t" + new Date());
	      System.out.println("User:\t"+l_ntuser);
	      request.setAttribute("NTNET", l_ntuser);
	      sb.delete(0, sb.length());
	      
	      for (int i = 0; i < remoteHost.length(); i += 2) {
	            sb.append(remoteHost.charAt(i));
	      }
	      String remotehost=new String(sb).toLowerCase();
	      
	      request.setAttribute("RemoteHost", remotehost);
	      sb.delete(0, sb.length());
	}else{
		System.out.println("Else condition");
		return;
	}
		 
	  }
			}catch(Exception e){
		e.getMessage();
			}
	*/
	%>

	<div class="container-fluid h-100" id="container-fluid">

		<div class="row h-100">

			<div class="col-md-4 search-panel">
				<div class="row justify-content-center"
					style="background-color: #7952b3">
					<h2 class="text-white"
						style="margin: 5px; font-family: 'Noto Serif', serif;"
						align="center">Hotfix Log Viewer</h2>
				</div>

				<form autocomplete="off" id="searchForm" method="post"
					style="margin-top: 10px;">

					<div class="form-row" style="margin-bottom: 5px; max-height: 300px">
						<div class="col">
							<!-- Card for Selecting Release -->
							<div class="card" style="max-height: 270px;">

								<div class="filter-header bg-transparent">
									<div class="input-group input-group-sm">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"><i
												class="fas fa-filter"></i></span>
										</div>
										<input type="text" class="form-control form-control-sm"
											id="inputVersion" placeholder="Enter version name"
											onkeyup="filterVersions()">
									</div>

									<div class="row justify-content-center"
										style="margin-top: 2px;">
										<span type="button" class="badge badge-secondary badge-sm"
											onclick="sortListDir('versionList')"> Sort <i
											class="fas fa-sort"></i>
										</span>

									</div>

								</div>

								<div class="cust-padding card-body custom-scrollbar-css"
									style="overflow-y: scroll;" id="versionList">

									<%
									ResourceBundle resource = ResourceBundle.getBundle("application");
									String getDistinctCramerVersions = resource.getString("getDistinctCramerVersions");
									String versionsString = "";
									List<String> versions = new ArrayList<>();
									ObjectMapper objectMapper = new ObjectMapper();
									TypeFactory typeFactory = objectMapper.getTypeFactory();
                                    //int a = 2/0;
									try {
										versionsString = fetchURL(getDistinctCramerVersions, null);
										versions = objectMapper.readValue(versionsString, typeFactory.constructCollectionType(List.class, String.class));

									} catch (Exception ex) {
										System.out.println(ex.getMessage());
									}

									for (int index = 0; index < versions.size(); index++) {
									%>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											name="SelectedVersion" value="<%=versions.get(index)%>"
											id="<%=versions.get(index).trim().replace(" ", "_")%>">
										<label class="custom-control-label"
											for="<%=versions.get(index).trim().replace(" ", "_")%>">
											<%=versions.get(index)%>
										</label>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</div>

						<div class="col">
							<!-- Card for Selecting Module  -->
							<div class="card" style="max-height: 270px;">

								<div class="filter-header bg-transparent">
									<div class="input-group input-group-sm">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"><i
												class="fas fa-filter"></i></span>
										</div>
										<input type="text" class="form-control form-control-sm"
											id="inputModule" placeholder="Enter module name"
											onkeyup="filterModules()">
									</div>
									<div class="row justify-content-center"
										style="margin-top: 2px;">
										<span type="button" class="badge badge-secondary badge-sm"
											onclick="sortListDir('moduleList')"> Sort <i
											class="fas fa-sort"></i>
										</span>

									</div>



								</div>



								<div class="cust-padding card-body custom-scrollbar-css"
									style="overflow-y: scroll;" id="moduleList">


									<%
									String getDistinctModulesEndpoint = resource.getString("getDistinctModulesEndpoint");
									String productString = "";
									List<String> products = new ArrayList<>();

									try {
										productString = fetchURL(getDistinctModulesEndpoint, null);
										products = objectMapper.readValue(productString, typeFactory.constructCollectionType(List.class, String.class));
									} catch (Exception ex) {
										System.out.println(ex.getMessage());
									}

									for (int index = 0; index < products.size(); index++) {
									%>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											name="SelectedModule" value="<%=products.get(index)%>"
											id="<%=products.get(index).trim().replace(" ", "_")%>">
										<label class="custom-control-label"
											for="<%=products.get(index).trim().replace(" ", "_")%>">
											<%=products.get(index)%>
										</label>
									</div>
									<%
									}
									%>

								</div>
							</div>
						</div>
					</div>

					<div class="form-row">
						<div class="col">
							<input type="text" class="form-control form-control-sm"
								name="ecpNo" placeholder="Hotfix Number"
								style="margin-bottom: 5px;">
						</div>
						<div class="col">
							<input type="text" class="form-control form-control-sm"
								name="caseOrCrNo" placeholder="Case/CR Number"
								style="margin-bottom: 5px;">

						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<input type="text" class="form-control form-control-sm"
								name="latestHotfix" placeholder="Latest Hotfix Number"
								data-toggle="tooltip" data-placement="bottom"
								title="All the HF's contained by this HF will be displayed."
								style="margin-bottom: 5px;">
						</div>
						<div class="col">
							<input type="text" class="form-control form-control-sm"
								name="specificFunc" placeholder="Specific Function"
								style="margin-bottom: 5px;">
						</div>
					</div>


					<input type="text" placeholder="Description"
						class="form-control form-control-sm" name="description"
						style="margin-bottom: 5px;">

					<div class="form-row">
						<div class="col">
							<input type="text" class="form-control form-control-sm"
								name="requestor" placeholder="Requested By"
								style="margin-bottom: 5px;">
						</div>


						<div class="col">
							<input type="text" class="form-control form-control-sm"
								name="fixedBy" placeholder="Fixed By"
								style="margin-bottom: 5px;">
						</div>
					</div>

					<input type="text" class="form-control form-control-sm"
						name="filesModifiedInPerforce" placeholder="Files Modified"
						style="margin-bottom: 5px;"> <input type="text"
						class="form-control form-control-sm"
						name="filesReleasedToCustomer" placeholder="Files Released"
						style="margin-bottom: 5px;">





					<div class="row justify-content-center">
						<button type="submit" id="searchBtn" name="searchBtn"
							value="searchClicked" class="btn btn-outline-danger">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</form>



			</div>
			<div class="col-md-8 custom-scrollbar-css"
				style="max-height: 100%; padding: 10px; overflow-y: scroll;">





				<div id="copyToastWrapper" aria-live="polite" aria-atomic="true"
					style="position: relative; display: none">
					<div id="copyToast" class="toast"
						style="min-width: 200px; z-index: 9; position: fixed; top: 20px; right: 20px;"
						role="alert" data-delay="10000" aria-live="assertive"
						aria-atomic="true">
						<div class="toast-header">
							<strong class="mr-auto">Copied to clipboard !</strong>
							<button type="button" class="ml-2 mb-1 close"
								data-dismiss="toast" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div id="copyToastBody" class="toast-body">Hotfix Details
							Copied.</div>
					</div>
				</div>
				<!-- 	<img alt="Test image" src="image/search_graphic.png"> -->
				<%
				if (!"searchClicked".equals(request.getParameter("searchBtn"))) {
				%>
				<div class="background-search-img"></div>

				<%
				}
				%>
				<jsp:include page="hotfixResult.jsp"></jsp:include>


				<div
					style="opacity: 0.8; position: fixed; bottom: 10px; right: 60px; z-index: 6;">
					<button class="btn btn-warning text-white " data-toggle="modal"
						data-target="#guideline_modal">
						<i class="fas fa-info-circle"></i>
					</button>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="guideline_modal" tabindex="-1"
					role="dialog" aria-labelledby="custom_modal_title"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered"
						style="max-width: 700px" role="document">
						<div class="modal-content">

							<div class="modal-header">
								<h5 class="modal-title" id="custom_modal_title">Information</h5>
							</div>
							<div class="modal-body">
								<ul>
									<li>Results are order by <code>Released date</code>.
									</li>
									<li>Click on the Hotfix number to <code>copy</code> the
										details to clipboard.
									</li>
									<li>Results are searched by <code>Regular
											Expression</code> according to input.
									</li>
									<li>If the HF is faulty, <span
										class="badge badge-pill badge-danger">FAULTY</span> will be
										displayed.
									</li>
									<li>If the HF is latest, <span
										class="badge badge-pill badge-success">LATEST</span> will be
										displayed.
									</li>
								</ul>
							</div>
							<div class="modal-footer">
								<button type="button"
									class="btn btn-sm btn-custom-bg text-white"
									data-dismiss="modal" id="result_close_btn">Close</button>

							</div>
						</div>
					</div>
				</div>

				<div
					style="opacity: 0.8; position: fixed; bottom: 10px; right: 10px; z-index: 6;">
					<button class="btn btn-warning text-white" type="submit"
						name="profileBtn" value="profileClicked" data-toggle="modal"
						data-target="#info_modal">
						<i class="fas fa-paper-plane"></i>
					</button>
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

								<div class="row align-items-center justify-content-center"
									style="margin-top: 20px;">


									<div class="col col-sm-4">
										<div class="btn-group" role="group" aria-label="Basic example">
											<button type="button" class="btn btn-outline-success btn-sm"
												disabled>
												<i class="fas fa-envelope"></i>
											</button>
											<a href="mailto:avinash.tingre@Amdocs.com" id="mail_anchor"
												role="button" class="btn btn-outline-success btn-sm">Drop
												a Mail</a>
										</div>
									</div>

									<div class="col col-sm-4">
										<div class="btn-group" role="group" aria-label="Basic example">
											<button type="button" class="btn btn-outline-success btn-sm"
												disabled>
												<i class="fas fa-comment"></i>
											</button>
											<a href="sip:avinash.tingre@Amdocs.com" id="chat_anchor"
												role="button" class="btn btn-outline-success btn-sm">Say
												Hello</a>
										</div>
									</div>




								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary btn-sm"
									data-dismiss="modal" id="result_close_btn">Close</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<div class="row">
		<div id="browserWarningWrapper" aria-live="polite" aria-atomic="true"
			style="position: relative; z-index: 9"
			class="d-flex justify-content-center align-items-center">
			<div id="browserWarning" class="toast" data-autohide="false"
				style="min-width: 300px; position: fixed; top: 50px; left: 50%; margin-left: -150px;"
				role="alert" aria-live="assertive" aria-atomic="true">
				<div class="toast-header">
					<strong class="mr-auto text-danger">Warning !</strong>
					<!-- <button type="button" class="ml-2 mb-1 close"
								data-dismiss="toast" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button> -->
				</div>

				<div id="browserWarningBody"
					class="toast-body bg-secondary text-white">
					Currently not supported in <em><b>Internet Explorer.</b></em><br>
					Try with <b>Google Chrome.</b>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript" src="js/jquery-3.5.1.slim.min.js"></script>
	<script type="text/javascript" src="js/popper.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script src="js/dom-to-image.js"></script>
	<script src="js/Filesaver.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#copyToast').toast('hide');
		});
	</script>
	<script type="text/javascript">
		$(function() {
			$('[data-toggle="tooltip"]').tooltip()
            $('[data-toggle="popover"]').popover()

		})
	</script>
	<script type="text/javascript">
		function checkFields(form) {
			var checks_radios = form.find(':checkbox, :radio'), inputs = form
					.find(':input').not(checks_radios).not(
							'[type="submit"],[type="button"],[type="reset"]');

			var checked = checks_radios.filter(':checked');
			var filled = inputs.filter(function() {
				return $.trim($(this).val()).length > 0;
			});

			if (checked.length + filled.length === 0) {
				return false;
			}

			return true;
		}

		$(function() {
			$('#searchForm1')
					.on(
							'submit',
							function(e) {
								e.preventDefault();
								var oneFilled = checkFields($(this));
								if (oneFilled) {
									document.getElementById("searchBtn").value = "searchClicked";
									document.getElementById("searchBtn")
											.submit();
								} else {
									alert('At least one field is required !');
								}
							});
		});

		function filterModules() {
			var input, filter, ul, li, a, i;
			input = document.getElementById("inputModule");
			filter = input.value.toUpperCase();
			div = document.getElementById("moduleList");
			a = div.getElementsByTagName("div");
			for (i = 0; i < a.length; i++) {
				txtValue = a[i].textContent || a[i].innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					a[i].style.display = "";
				} else {
					a[i].style.display = "none";
				}
			}
		}

		function filterVersions() {
			var input, filter, ul, li, a, i;
			input = document.getElementById("inputVersion");
			filter = input.value.toUpperCase();
			div = document.getElementById("versionList");
			a = div.getElementsByTagName("div");
			for (i = 0; i < a.length; i++) {
				txtValue = a[i].textContent || a[i].innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					a[i].style.display = "";
				} else {
					a[i].style.display = "none";
				}
			}
		}

		document.onreadystatechange = function() {
			if (document.readyState !== "complete") {
				document.querySelector("body").style.visibility = "hidden";
				document.querySelector("#se-pre-con").style.visibility = "visible";
			} else {
				document.querySelector("#se-pre-con").style.display = "none";
				document.querySelector("body").style.visibility = "visible";
			}
		};

		(function() {
			var googleChrome = {
				string : navigator.userAgent.match(/Chrome\/(\d+)/)

			};

			googleChrome.version = googleChrome.string ? parseInt(
					googleChrome.string[1], 10) : null;

			if (!googleChrome.string) {
				document.getElementById("container-fluid").style.display = "none";
				document.getElementById('browserWarningWrapper').style.display = "block";
				$('#browserWarning').toast('show');

			} else {
				document.getElementById('browserWarning').style.display = "none";
				$('#browserWarning').toast('hide');

			}
		})();

		function sortListDir(elementId) {
			var list, i, switching, b, shouldSwitch, dir, switchcount = 0;
			switching = true;
			div = document.getElementById(elementId);

			// Set the sorting direction to ascending:
			dir = "asc";
			// Make a loop that will continue until no switching has been done:
			while (switching) {
				// Start by saying: no switching is done:
				switching = false;
				b = div.getElementsByTagName("div")
				// Loop through all list-items:
				for (i = 0; i < (b.length - 1); i++) {
					// Start by saying there should be no switching:
					shouldSwitch = false;
					/* Check if the next item should switch place with the current item,
					based on the sorting direction (asc or desc): */
					if (dir == "asc") {
						if (b[i].innerHTML.toLowerCase() > b[i + 1].innerHTML
								.toLowerCase()) {
							/* If next item is alphabetically lower than current item,
							mark as a switch and break the loop: */
							shouldSwitch = true;
							break;
						}
					} else if (dir == "desc") {
						if (b[i].innerHTML.toLowerCase() < b[i + 1].innerHTML
								.toLowerCase()) {
							/* If next item is alphabetically higher than current item,
							mark as a switch and break the loop: */
							shouldSwitch = true;
							break;
						}
					}
				}
				if (shouldSwitch) {
					/* If a switch has been marked, make the switch
					and mark that a switch has been done: */
					b[i].parentNode.insertBefore(b[i + 1], b[i]);
					switching = true;
					// Each time a switch is done, increase switchcount by 1:
					switchcount++;
				} else {
					/* If no switching has been done AND the direction is "asc",
					set the direction to "desc" and run the while loop again. */
					if (switchcount == 0 && dir == "asc") {
						dir = "desc";
						switching = true;
					}
				}
			}
		}
	</script>

	<%!public String fetchURL(String fullUrl, String plainInput) throws Exception {
		HttpURLConnection con = null;
		String response = null;
		try {
			URL url = new URL(fullUrl);
			con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Content-Type", "application/json");

			con.setConnectTimeout(5000);
			con.setReadTimeout(5000);

			int status = con.getResponseCode();
			if (status > 299) {
				Reader streamReader = null;

				BufferedReader in = new BufferedReader(streamReader);
				String inputLine;
				StringBuffer content = new StringBuffer();
				while ((inputLine = in.readLine()) != null) {
					content.append(inputLine);
				}
				in.close();
				System.out.println("Below error occured: \n" + content.toString());

			} else {
				BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
				String inputLine;
				StringBuffer content = new StringBuffer();
				while ((inputLine = in.readLine()) != null) {
					content.append(inputLine);
				}
				in.close();
				response = content.toString();
			}
		} catch (Exception ex) {
			System.out.println("Exception in Fetch URL");
			throw ex;
		} finally {
			con.disconnect();
		}

		return response;
	}%>

</body>
</html>
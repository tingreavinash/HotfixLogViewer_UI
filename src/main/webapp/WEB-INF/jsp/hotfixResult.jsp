<%@page import="java.net.ConnectException"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Base64"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.InetAddress"%>
<%@page import="com.avinash.HotfixLogUI.Model.ECPLog"%>
<%@page import="com.avinash.HotfixLogUI.Model.ECPLogResponseObject"%>
<%@ page import="java.util.ResourceBundle"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.Reader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

</head>
<body>

	<%
	request.getSession(false);
	String show_input = "";
	if ("searchClicked".equals(request.getParameter("searchBtn"))) {

		String[] arrVersions = request.getParameterValues("SelectedVersion");
		List<String> selectedVersions = new ArrayList<String>();
		if (arrVersions != null) {
			for (String s : arrVersions) {
		selectedVersions.add(s);
			}
		} else {
			selectedVersions.add("");
		}
		if (selectedVersions.contains("Cramer 5 Rel 1")) {
			selectedVersions.add("cramer 5 rel 1");
		}

		if (selectedVersions.contains("Cramer 6 Rel 1")) {
			selectedVersions.add("Cramer 6 rel 1");
			selectedVersions.add("cramer 6 rel 1");
		}
		if (selectedVersions.contains("Cramer 6 Rel 2")) {
			selectedVersions.add("Cramer 6 rel 2");
		}
		if (selectedVersions.contains("Cramer 6 Rel 3")) {
			selectedVersions.add("Cramer 6 rel 3");
			selectedVersions.add("cramer 6 rel 3");
		}
		if (selectedVersions.contains("Cramer 6 Rel 4")) {
			selectedVersions.add("Cramer 6 rel 4");
		}
		if (selectedVersions.contains("OSS 9.1.0")) {
			selectedVersions.add("oss 9.0.0");
		}

		String[] arrModules = request.getParameterValues("SelectedModule");
		List<String> selectedModules = new ArrayList<String>();
		if (arrModules != null) {
			for (String s : arrModules) {
		selectedModules.add(s);
			}
		} else {
			selectedModules.add("");
		}

		if (selectedModules.contains("Foundations")) {
			selectedModules.add("foundations");
		}

		String ecpNo = request.getParameter("ecpNo").trim();
		String latestHF = request.getParameter("latestHotfix").trim();
		String description = request.getParameter("description").trim();
		String requestor = request.getParameter("requestor").trim();
		String fixedBy = request.getParameter("fixedBy").trim();
		String caseOrCrNo = request.getParameter("caseOrCrNo").trim();
		String filesModifiedInPerforce = request.getParameter("filesModifiedInPerforce").trim();
		String filesReleasedToCustomer = request.getParameter("filesReleasedToCustomer").trim();
		String specificFunc = request.getParameter("specificFunc").trim();

		if (!"".equals(description) || !"".equals(ecpNo) || !"".equals(latestHF) || !"".equals(requestor)
		|| !"".equals(fixedBy) || !"".equals(caseOrCrNo) || !"".equals(filesModifiedInPerforce)
		|| !"".equals(filesReleasedToCustomer) || !"".equals(specificFunc) || !selectedModules.contains("")
		|| !selectedVersions.contains("")) {

			StringBuilder sb = new StringBuilder();
			int i = 0;
			while (i < selectedModules.size()) {
		sb.append(selectedModules.get(i));
		if (i != selectedModules.size() - 1) {
			sb.append(",");
		}
		i++;
			}
			String modules = sb.toString();
			sb.delete(0, sb.length());

			int j = 0;
			while (j < selectedVersions.size()) {
		sb.append(selectedVersions.get(j));
		if (j != selectedVersions.size() - 1) {
			sb.append(",");
		}
		j++;
			}
			String versions = sb.toString();
			sb.delete(0, sb.length());

			String paramString = "?ecpNo=" + URLEncoder.encode(ecpNo, "UTF-8") + "&latestEcp="
			+ URLEncoder.encode(latestHF, "UTF-8") + "&description=" + URLEncoder.encode(description, "UTF-8")
			+ "&cramerVersion=" + URLEncoder.encode(versions, "UTF-8") + "&requestor="
			+ URLEncoder.encode(requestor, "UTF-8") + "&fixedBy=" + URLEncoder.encode(fixedBy, "UTF-8") + "&module="
			+ URLEncoder.encode(modules, "UTF-8") + "&caseOrCrNo=" + URLEncoder.encode(caseOrCrNo, "UTF-8")
			+ "&filesModifiedInPerforce=" + URLEncoder.encode(filesModifiedInPerforce, "UTF-8")
			+ "&filesReleasedToCustomer=" + URLEncoder.encode(filesReleasedToCustomer, "UTF-8") + "&specificFunc="
			+ URLEncoder.encode(specificFunc, "UTF-8");

			String plainInput = "?ecpNo=" + ecpNo + "&latestEcp=" + latestHF + "&description=" + description
			+ "&cramerVersion=" + versions + "&requestor=" + requestor + "&fixedBy=" + fixedBy + "&module="
			+ modules + "&caseOrCrNo=" + caseOrCrNo + "&filesModifiedInPerforce=" + filesModifiedInPerforce
			+ "&filesReleasedToCustomer=" + filesReleasedToCustomer + "&specificFunc=" + specificFunc;

			if (ecpNo != "")
		show_input = show_input.concat("<b><em>Hotfix No:</em></b> " + ecpNo + ", ");
			if (latestHF != "")
		show_input = show_input.concat("<b><em>Latest Hotfix:</em></b> " + latestHF + ", ");
			if (description != "")
		show_input = show_input.concat("<b><em>Description:</em></b> " + description + ", ");
			if (versions.length() > 0)
		show_input = show_input.concat("<b><em>Versions:</em></b> " + versions + ", ");
			if (requestor != "")
		show_input = show_input.concat("<b><em>Requested by:</em></b> " + requestor + ", ");
			if (fixedBy != "")
		show_input = show_input.concat("<b><em>Fixed by:</em></b> " + fixedBy + ", ");
			if (modules.length() > 0)
		show_input = show_input.concat("<b><em>Modules:</em></b> " + modules + ", ");
			if (caseOrCrNo != "")
		show_input = show_input.concat("<b><em>Case or CR No:</em></b> " + caseOrCrNo + ", ");
			if (filesModifiedInPerforce != "")
		show_input = show_input.concat("<b><em>Files modified:</em></b> " + filesModifiedInPerforce + ", ");
			if (filesReleasedToCustomer != "")
		show_input = show_input.concat("<b><em>Files released:</em></b> " + filesReleasedToCustomer + ", ");
			if (specificFunc != "")
		show_input = show_input.concat("<b><em>Specific function:</em></b> " + specificFunc + ", ");
			ResourceBundle resource = ResourceBundle.getBundle("application");
			String getAllResultsEndpoint = resource.getString("getAllResultsEndpoint");


			ObjectMapper objectMapper = new ObjectMapper();
			String fullUrl = getAllResultsEndpoint + paramString;
			HttpURLConnection con = null;
			String reponse ="";
			try {
			reponse = fetchURL(fullUrl, plainInput);

			ECPLogResponseObject respObject = objectMapper.readValue(reponse, ECPLogResponseObject.class);
			System.out.println("Results found: " + respObject.getCount());
			if (respObject.getCount() > 0) {
	%>
	<div class="alert Box-header--blue  text-center" role="alert">
		Results found: <span class="badge badge-pill badge-secondary"><%=respObject.getCount()%></span>

	</div>
	<div class="alert Box-header text-center">
		<%=show_input%>
	</div>
	<div class="list-group " id="hflist" style="margin-top: 10px;">
		<div class="row Box-hotfix-title">
			<div class="col col-sm-3 text-center ">
				<b>HOTFIX NUMBER</b>
			</div>
			<div class="col col-sm-9 text-center">
				<b>DESCRIPTION</b>
			</div>
		</div>
		<%
		for (int count = 0; count < respObject.getCount(); count++) {
			ECPLog ecp = new ECPLog();
			ecp = respObject.getDetails().get(count);
		%>
		<div id="ecp_image_<%=ecp.get_id()%>">
			<a class="list-group-item list-group-item-action hf-details-parent"
				data-toggle="collapse" href="#hfCollapse<%=ecp.get_id()%>"
				aria-expanded="false" aria-controls="hfCollapse<%=ecp.get_id()%>">
				<div class="row hf-list-top">
					<div class="col col-sm-3 ">

						<div class="row">
							<div class="col col-sm-10">
								<div id="ecpno_<%=ecp.get_id()%>"><%=ecp.getEcpNo()%>
								</div>

							</div>
							<div class="col col-sm-2">
								<span class="copy_icon" id="copy_ecpno_<%=ecp.get_id()%>"
									data-toggle="tooltip" data-placement="bottom"
									title="Copy to clipboard"
									onclick="copyToClipboard('ecpno_<%=ecp.get_id()%>', 'description_<%=ecp.get_id()%>', 'copy_ecpno_<%=ecp.get_id()%>')"><i
									class="fas fa-copy"></i></span>

							</div>
						</div>
						<%
						if ("YES".equalsIgnoreCase(ecp.getEcpFaulty())) {
						%>
						<span class="badge badge-danger badge-pill">FAULTY</span>
						<%
						}
						if ("TRUE".equalsIgnoreCase(ecp.getIsThisLatestHF())) {
						%>
						<span class="badge badge-success badge-pill">LATEST</span>
						<%
						}
						%>




					</div>
					<div class="col col-sm-9 hf-list-description">
						<div id="description_<%=ecp.get_id()%>"><%=ecp.getDescription()%></div>
					</div>
				</div>

			</a>


			<div class="collapse multi-collapse hf-details-child"
				style="background-color: white" data-parent="#hflist"
				id="hfCollapse<%=ecp.get_id()%>">
				<%
				if ("TRUE".equals(ecp.getIsThisLatestHF())) {
				%>
				<div class="bd-callout bd-callout-success">
					<%
					} else {
					%>
					<div class="bd-callout bd-callout-warning">
						<%
						}
						%>
						<%
						String requestDateString = "-";
						String releasedDateString = "-";
						try {
							Date date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.US).parse(ecp.getRequestDate());
							SimpleDateFormat dateFormatter = new SimpleDateFormat("EEEEE, d MMM yyyy");
							requestDateString = dateFormatter.format(date);

						} catch (Exception ex) {
							ex.printStackTrace();
						}

						try {
							Date date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.US).parse(ecp.getReleasedDate());
							SimpleDateFormat dateFormatter = new SimpleDateFormat("EEEEE, d MMM yyyy");
							releasedDateString = dateFormatter.format(date);

						} catch (Exception ex) {
							ex.printStackTrace();
						}
						%>

						<div class="row justify-content-end">
							<button class="btn btn-warning btn-sm"
								onclick="emailHotfix('<%=ecp.getEcpNo().replace("\n", "<br>")%>','<%=ecp.getDescription().replace("\n", "<br>")%>','<%=ecp.getCaseOrCrNo().replace("\n", "<br>")%>',
					'<%=ecp.getCramerVersion().replace("\n", "<br>")%>','<%=ecp.getEcpFaulty().replace("\n", "<br>")%>','<%=ecp.getFileLocationInPerforce().replace("\n", "<br>")%>','<%=ecp.getFilesModifiedInPerforce().replace("\n", "<br>")%>','<%=ecp.getFilesReleasedToCustomer().replace("\n", "<br>")%>',
					'<%=ecp.getFixedBy().replace("\n", "<br>")%>','<%=ecp.getLatestEcp().replace("\n", "<br>")%>',
					'<%=ecp.getModule().replace("\n", "<br>")%>','<%=ecp.getNotes().replace("\n", "<br>")%>','<%=ecp.getPrereqForLatestEcp().replace("\n", "<br>")%>','<%=releasedDateString%>','<%=requestDateString%>',
					'<%=ecp.getRequestor().replace("\n", "<br>")%>','<%=ecp.getRolledIntoVersion().replace("\n", "<br>")%>')">
								Email <i class="fas fa-share-square"></i>
							</button>

							<button class="btn btn-warning btn-sm" style="margin-left: 10px;"
								onclick="saveImage('ecp_image_<%=ecp.get_id()%>', '<%=ecp.getEcpNo()%>')">
								Save <i class="fas fa-download"></i>
							</button>
						</div>

						<!-- Row 1 -->
						<div class="row">
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Prereq's
										for Latest Hotfix</span><br>
									<textarea class="form-control" aria-label="With textarea"
										disabled><%=ecp.getPrereqForLatestEcp()%>
                        </textarea>
								</div>

							</div>
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Latest
										Hotfix</span><br>
									<%=ecp.getLatestEcp()%>
								</div>
							</div>



							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Case/CR
										No.</span><br>
									<%=ecp.getCaseOrCrNo()%>
								</div>

							</div>
						</div>


						<!-- Row 2 -->
						<div class="row">
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Version</span><br>
									<%=ecp.getCramerVersion()%>
								</div>


							</div>
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Rolled
										into Version</span><br>
									<%=ecp.getRolledIntoVersion()%>
								</div>

							</div>
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Roll-up
										CR</span> <br><%=ecp.getRollupCr()%>
								</div>

							</div>
						</div>

						<!-- Row 3 -->
						<div class="row">
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Module</span><br>
									<%=ecp.getModule()%>
								</div>

							</div>
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Is
										Mandatory ?</span><br>
									<%=ecp.getMandatoryEcp()%>
								</div>

							</div>
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Status</span><br>
									<%=ecp.getStatus()%>
								</div>

							</div>
						</div>

						<!-- Row 4 -->
						<div class="row">
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Specific
										Function</span><br>
									<%=ecp.getSpecificFunc()%>
								</div>

							</div>
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Severity</span><br>
									<%=ecp.getSeverity()%>
								</div>

							</div>
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Priority</span><br>
									<%=ecp.getPriority()%>
								</div>

							</div>
						</div>

						<!-- Row 5 -->
						<div class="row">
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Requested
										By</span><br>
									<%=ecp.getRequestor()%>
								</div>

							</div>
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Fixed
										By</span><br>
									<%=ecp.getFixedBy()%>
								</div>

							</div>
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Notes</span><br>
									<textarea class="form-control" aria-label="With textarea"
										disabled><%=ecp.getNotes()%>
                        </textarea>
								</div>

							</div>
						</div>

						<!-- Row 6 -->
						<div class="row">
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Requested
										Date</span><br>


									<%=requestDateString%>
								</div>

							</div>
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Released
										Date</span><br>

									<%=releasedDateString%>
								</div>

							</div>
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Additional
										Info</span><br>
									<textarea class="form-control" aria-label="With textarea"
										disabled><%=ecp.getAdditionalInfo()%>
                        </textarea>
								</div>

							</div>
						</div>

						<!-- Row 7 -->
						<div class="row">
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Files
										Modified</span><br>
									<textarea class="form-control" aria-label="With textarea"
										disabled><%=ecp.getFilesModifiedInPerforce()%>
                        </textarea>
								</div>

							</div>
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Files
										Location</span><br>
									<textarea class="form-control" aria-label="With textarea"
										disabled><%=ecp.getFileLocationInPerforce()%>
                        </textarea>
								</div>
							</div>
							<div class="col">
								<div>
									<span class="badge badge-pill badge-secondary hf-detail-tag">Files
										Released</span><br>
									<textarea class="form-control" aria-label="With textarea"
										disabled><%=ecp.getFilesReleasedToCustomer()%>
                            </textarea>

								</div>
							</div>
						</div>

						<!-- Row 8 -->
						<div class="row">
							<div class="col"></div>
							<div class="col"></div>
							<div class="col"></div>
						</div>
					</div>
				</div>


			</div>

			<%
			}
			%>
		</div>

		<%
		} else {
		System.out.println("No records found!");
		%>
		<div class="alert alert-warning" role="alert">
			<h4 class="alert-heading">Oops !</h4>
			<p>No matching records found.</p>
			<hr>
			<p class="mb-0">Try again with improved criteria.</p>
		</div>
		<%
		}

		

		} catch (Exception ex) {
		System.out.println("Exception: " + ex.getMessage());
		%>
		<div class="alert alert-warning" role="alert">
			<h4 class="alert-heading">Oops !</h4>
			<p>
				Operation failed due to any of below reasons:<br> 1. Server is
				down.<br> 2. Connection timed out. <br>
			</p>
			<hr>
			<p class="mb-0">Try again with improved criteria.</p>
		</div>
		<%
		}
		} else {
		%>
		<div class="alert alert-warning" role="alert">
			<h4 class="alert-heading">Oops !</h4>
			<p>
				Operation failed due to any of below reasons:<br> 1. No input
				is provided.<br>
			</p>
			<hr>
			<p class="mb-0">Try again with improved criteria.</p>
		</div>
		<%
		System.out.println("All fields are empty.");
		}

		}
		%>
	</div>
	<script type="text/javascript">
		function copyToClipboard(ecpNo, description, copyTagId) {

			const myTextarea = document.createElement('textarea');

			var copyString = 'HF Number:\t\t'
					+ document.getElementById(ecpNo).innerHTML.trim()
					+ '\nDescription:\t'
					+ document.getElementById(description).innerHTML.trim();

			myTextarea.innerHTML = copyString;

			document.body.appendChild(myTextarea);

			myTextarea.select();

			document.execCommand('copy');

			document.body.removeChild(myTextarea);
			document.getElementById('copyToastWrapper').style.display="block";
			document.getElementById('copyToastBody').innerHTML =document.getElementById(ecpNo).innerHTML+'<br>(Hotfix number and description)';
			
			//$('#copyToast').toast('show');

			var copyId = '#'+copyTagId;
			$(copyId).attr("title", "Copied \u2713").tooltip("_fixTitle").tooltip("show").attr("title", "Copy to clipboard").tooltip("_fixTitle");
			

		}
		function saveImage(elementId,ecpNumber) {

			domtoimage.toBlob(document.getElementById(elementId))
		    .then(function (blob) {
		        window.saveAs(blob, 'HF_Details_'+ecpNumber+'.png');
		    });

		}
		function emailHotfix(EcpNo, Description, CaseOrCrNo, CramerVersion, EcpFaulty, FileLocationInPerforce, 
				FilesModifiedInPerforce, FilesReleasedToCustomer, FixedBy, LatestEcp,
				Module, Notes, PrereqForLatestEcp, releasedDate, requestDate,
				Requestor, RolledIntoVersion){
			console.log(EcpNo+'\r\n'+Description+'\r\n'+ CaseOrCrNo+'\r\n'+ CramerVersion+'\r\n'+ EcpFaulty+'\r\n'+ FileLocationInPerforce+'\r\n'+ 
					FilesModifiedInPerforce+'\r\n'+FilesReleasedToCustomer+'\r\n'+FixedBy+'\r\n'+ LatestEcp+'\r\n'+
					Module+'\r\n'+ Notes+'\r\n'+ PrereqForLatestEcp+'\r\n'+ releasedDate+'\r\n'+ requestDate+'\r\n'+
					Requestor+'\r\n'+ RolledIntoVersion);

			var subject='Hotfix Details - '+EcpNo.replace("<br>",", ");
			
			var body='Hotfix Number:\t\t'+EcpNo.replace("<br>",", ");
			body+='\r\nDescription:\t\t'+Description.replace("<br>",", ");
			body+='\r\nLatest Hotfix:\t\t'+LatestEcp.replace("<br>",", ");
			body+='\r\nPrereq\'s for latest HF:\t'+PrereqForLatestEcp.replace("<br>",", ");
			body+='\r\nModule:\t\t'+Module.replace("<br>",", ");
			body+='\r\nCase or CR No:\t\t'+CaseOrCrNo.replace("<br>",", ");
			body+='\r\nVersion:\t\t'+CramerVersion.replace("<br>",", ");
			body+='\r\nRolled into:\t\t'+RolledIntoVersion.replace("<br>",", ");
			body+='\r\nIs HF faulty?:\t\t'+EcpFaulty.replace("<br>",", ");
			body+='\r\nFixed By:\t\t'+FixedBy.replace("<br>",", ");
			body+='\r\nRequested By:\t\t'+Requestor.replace("<br>",", ");
			body+='\r\nReleased Date:\t\t'+releasedDate.replace("<br>",", ");
			body+='\r\nRequested Date:\t'+requestDate.replace("<br>",", ");
			body+='\r\nNotes:\t\t\t'+Notes.replace("<br>",", ");
			body+='\r\nFiles Location:\t\t'+FileLocationInPerforce.replace("<br>",", ")	
			body+='\r\nFiles Modified:\t\t'+FilesModifiedInPerforce.replace("<br>",", ");
			body+='\r\nFiles Released:\t\t'+FilesReleasedToCustomer.replace("<br>",", ");
			body+='\r\n\r\n====================================';
			body+='\r\nReference: http://avinasht01/';

			
			window.location.assign('mailto:?subject='+subject+'&body='+encodeURIComponent(body));
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
			con.setRequestProperty("HostAddress", "");
			con.setRequestProperty("Hostname", "");
			//con.setRequestProperty("NTNET", "");

			con.setRequestProperty("SearchIput", plainInput);
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
			throw ex;
		} finally {
			con.disconnect();
		}

		return response;
	}%>
</body>
</html>
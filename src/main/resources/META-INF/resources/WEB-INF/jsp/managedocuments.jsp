	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
	
	<t:template>
		<jsp:body>		
					</tr><tr valign="top">
			<td><div id="pnCenter">
				<div id="pnCenterDisplay" style="width:692px;float:left">
					<div id="indexMain" style="float:left;"><div>
						<style>
	</style>
	<div id="main">
	<div id="head">
	</div>
	<div id="head-link">
	</div>
	<div id="left">
	</div>
	<div id="content">
	</div>
	<div id="right">
	</div>
	<div id="footer">
	</div>
	</div>
	
	
					</div></div><div id="news" style="float:left;"><div>
						<p class="MsoNormal" style="margin: 6pt 0cm 0.0001pt; text-align: justify;">
	</p><table style="text-align: justify;">
	 <!--  tbody -->
	  <tbody>
	<div class="generic-container">
		<div class="panel panel-default">
			  <!-- Default panel contents -->
		  	<div class="panel-heading"><span class="lead">List of Documents </span></div>
		  	<div class="tablecontainer">
				<table class="table table-hover">
		    		<thead>
			      		<tr>
					        <th>No.</th>
					        <th>File Name</th>
					        <th>Type</th>
					        <th>Description</th>
					        <th width="100"></th>
					        <th width="100"></th>
						</tr>
			    	</thead>
		    		<tbody>
					<c:forEach items="${documents}" var="doc" varStatus="counter">
						<tr>
							<td>${counter.index + 1}</td>
							<td>${doc.name}</td>
							<td>${doc.type}</td>
							<td>${doc.description}</td>
							<td><a href="<c:url value='/download-document-${doc.id}' />" class="btn btn-success custom-width">download</a></td>
							<td><a href="<c:url value='/delete-document-${doc.id}' />" class="btn btn-danger custom-width">delete</a></td>
						</tr>
					</c:forEach>
		    		</tbody>
		    	</table>
		    </div>
		</div>
		<div class="panel panel-default">
			
			<div class="panel-heading"><span class="lead">Upload New Document</span></div>
			<div class="uploadcontainer">
				<form:form method="POST" modelAttribute="fileBucket" enctype="multipart/form-data" class="form-horizontal">
			
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="file">Upload a document</label>
							<div class="col-md-7">
								<form:input type="file" path="file" id="file" class="form-control input-sm"/>
								<div class="has-error">
									<form:errors path="file" class="help-inline"/>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="file">Description</label>
							<div class="col-md-7">
								<form:input type="text" path="description" id="description" class="form-control input-sm"/>
							</div>
							
						</div>
					</div>
					
					<div class="row">
						<div class="form-actions floatRight">
							<input type="submit" value="Upload" class="btn btn-primary btn-sm">
						</div>
					</div>
	
				</form:form>
				</div>
		</div>
   	</div>
</tbody>
	    
	     <!--  end tbody -->
	</table>
	<br>
	<br>
	<p></p>
	
					</div></div>
				</div>
			
		</jsp:body>
	</t:template>
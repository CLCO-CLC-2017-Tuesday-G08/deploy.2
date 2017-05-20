	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
	<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
	
	<t:template>
		<jsp:body>					
		<table class="table">
 						<tr>
 							<th>Title</th>
					        <th>Eidt</th>				        
 						</tr>
 						<c:forEach items="${news}" var="news">
						<tr>
							<td >${news.title}</td>
							<td ><a href="<c:url value='/edit-news-${news.id}' />" class="btn btn-success">edit</a></td>
							</tr>						
					</c:forEach>
			</table>
		</jsp:body>
	</t:template>
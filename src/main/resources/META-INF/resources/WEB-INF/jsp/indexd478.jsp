	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
	<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
	
	<t:template>
		<jsp:body>					
	<c:forEach items="${news}" var="news">
 				 <c:if test="${news.id == 5 }">					
							${news.content}			
				</c:if>			 
		
			</c:forEach>	
	
		</jsp:body>
	</t:template>
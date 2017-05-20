<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
	<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
	<t:template>
		<jsp:body>
	<form method="POST" modelAttribute="news" class="form-horizontal">
			<h4>Title news</h2>		
	<input type="text" path="title" id="title" name="title" value="${newlist.title}" class="form-control input-sm"/>
	<h4>Content:</h2>		
       <textarea class="ckeditor" path="Content" name="Content" cols="80" rows="10">
            ${newlist.content}
       </textarea>
<input type="submit" value="commit" class="btn btn-primary btn-sm"/>

</form>
<div class="alert alert-success lead">
	    	${success}
		</div>
</jsp:body>
</t:template>
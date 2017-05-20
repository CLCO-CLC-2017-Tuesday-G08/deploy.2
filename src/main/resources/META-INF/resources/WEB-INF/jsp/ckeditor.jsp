<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CK editor test </title>
<!--  
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/ckfinder/ckfinder.js"></script>
-->
<script type="text/javascript" src="src/main/webapp/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="src/main/webapp/ckfinder/ckfinder.js"></script>

<script type="text/javascript">
	function BrowseServer(startupPath,functionData){
		var finder = new CKFinder();
		finder.basePath = 'ckfinder/'; //Đường path nơi đặt ckfinder
		finder.startupPath = startupPath; //Đường path hiện sẵn cho user chọn file
		finder.selectActionFunction = SetFileField; // hàm sẽ được gọi khi 1 file được chọn
		finder.selectActionData = functionData; //id của text field cần hiện địa chỉ hình
		//finder.selectThumbnailActionFunction = ShowThumbnails; //hàm sẽ được gọi khi 1 file thumnail được chọn	
		finder.popup(); // Bật cửa sổ CKFinder
	}
	
	function SetFileField(fileUrl,data){
		document.getElementById( data["selectActionData"] ).value = fileUrl;
	}
	
	function ShowThumbnails(fileUrl,data){	
		var sFileName = this.getSelectedFile().name; // this = CKFinderAPI
		document.getElementById( 'thumbnails' ).innerHTML +=
		'<div class="thumb">' +
		'<img src="' + fileUrl + '" />' +
		'<div class="caption">' +
		'<a href="' + data["fileUrl"] + '" target="_blank">' + sFileName + '</a> (' + data["fileSize"] + 'KB)' +
		'</div>' +
		'</div>';
		document.getElementById( 'preview' ).style.display = "";
		return false; // nếu là true thì ckfinder sẽ tự đóng lại khi 1 file thumnail được chọn
	}
</script>
</head>

<body>
	<textarea id="content"  name="content"></textarea>
	<script type="text/javascript">
		CKEDITOR.replace("content",{
			filebrowserBrowseUrl : 'ckfinder/ckfinder.html',
			filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?type=Images',
			filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?type=Flash',
			filebrowserUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
			filebrowserImageUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
			filebrowserFlashUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
		});
	</script>
	
	<br><br><br>
	<input type="text" name="urlHinh" id="urlHinh">
	<input type="button" name="btn-choose" id="btn-choose" value="Chon File" onclick="BrowseServer('Images:/','urlHinh')">
</body>
</html>
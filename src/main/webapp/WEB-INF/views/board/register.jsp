<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
	
<!-- 	<script type="text/javascript"> -->
// 		function boardSubmit(){
// 			alert("게시글이 등록 되었습니다.");
// 		}
<!-- 	</script> -->
	
<!-- 	<form action="/board/list"> -->
<!-- 		<input type="text" name="title" placeholder="글 제목을 입력해주세요."/> -->
<!-- 		<input type="text" name="content" placeholder="글 내용을 입력해주세요."/> -->
<!-- 		<input type="text" name="userid" placeholder="글 작성자를 입력해주세요."/> -->
<!-- 		<input type="submit" onclick="boardSubmit();"/> -->
<!-- 	</form> -->
<div class="row">
	<c:set var="ctx" value="${pageContext.request.contextPath == '/' ? '' : pageContext.request.contextPath }" scope="application"/>
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
</div><!-- .row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Register</div>
			<div class="panel-body">
				<form action="${ctx }/board/register" method="post">
					<div class="form-group">
						<label>Title</label><input class="form-control" name="title">
					</div>
					<div class="form-group">
						<label>Text Area</label>
						<textarea class="form-control" rows="3" name="content"></textarea>
					</div>
					<div class="form-group">
					<label>Writer</label>
					<input class="form-control" name="writer">
					</div>
					<button type="submit" class="btn btn-default">Submit Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>
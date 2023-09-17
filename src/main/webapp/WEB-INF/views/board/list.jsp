<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath == '/' ? '' : pageContext.request.contextPath }" scope="application"/>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Tables</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					Board List Page
					<button id="regBtn" type="button" class="btn btn-xs pull-right">Register New Board</button>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="board">
								<tr>
									<td>${board.bno }</td>
									<td><a href="/board/read?bno=${board.bno }">${board.title }</a></td>
									<td>${board.writer }</td>
									<td><fmt:formatDate value="${board.regdate }" pattern="yy-MM-dd"></fmt:formatDate></td>
									<td><span class="badge bg-ref">${board.viewcnt }</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- Model 추가 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		                  <div class="modal-dialog">
		                     <div class="modal-content">
		                        <div class="modal-header">
		                           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                           <h4 class="modal-title" id="myModalLabel">Modal title</h4>
		                        </div>
		                        <div>
		                           	<div class="modal-body">처리가 완료 되었습니다.</div>
		                           	<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save Changes</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var result = "${result}";
			
			checkModal(result);
			
			function checkModal(result) {
				if (result == "") {
					return;
				}
				
				if (parseInt(result) > 0) {
					$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
				}
				
				$("#myModal").modal("show");
			}
			
			$("#regBtn").on("click", function(){
				self.location = "${ctx}/board/register";
			});
		});
	</script>
<%@ include file="../includes/footer.jsp" %>
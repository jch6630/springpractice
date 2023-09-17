<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Tables</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					Board Detail Page
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
							
								<tr>
									<td>${board.bno }</td>
									<td>${board.title }</td>
									<td>${board.writer }</td>
									<td><fmt:formatDate value = "${board.regdate }" pattern="yy.MM.dd"></fmt:formatDate></td>
									<td><span class="badge bg-ref">${board.viewcnt }</span></td>
								</tr>
								<tr>
									<td>내용</td>
									<td colspan='4'>${board.content }</td>
								</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../includes/footer.jsp" %>
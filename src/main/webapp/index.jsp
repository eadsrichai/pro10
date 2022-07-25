<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@ page import="java.util.*"%>
<%@ page import="model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Show Student</title>
<link rel="stylesheet"
	href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
</head>

<body>
	<div class="container">
		<div>
			<p class="fs-1 bg bg-primary text-white mt-3 p-3">ระบบฐานข้อมูลนักศึกษา</p>
		</div>
		<div>
			<form action="Search" method="get">
				<input type="text" value="" name="id" placeholder="กรอกรหัสนักศึกษา" />
				<input class="btn btn-primary" type="submit" value="ค้นหา"
					name="Search" />
			</form>
			
		</div>
		<div class="badge text-white text-wrap link-primary">
			<a href="Creat">เพิ่มข้อมูล</a>
		</div>
		<div>
			<table class="table table-hover table-sm table-striped">
				<thead>
					<tr>
						<th scope="col">รหัส</th>
						<th scope="col">คำนำหน้า</th>
						<th scope="col">ชื่อ</th>
						<th scope="col">นามสกุล</th>
						<th scope="col">อายุ</th>
						<th scope="col">สาขาวิชา</th>
						<th scope="col" class="bg-danger text-white " colspan="2">Action</th>
					</tr>
				</thead>
				<tbody>

					<c:choose>
						<c:when test="${not empty student}">
							<c:set var="s" value="${student}" />
							<tr>
								<td><c:out value="${s.id}" /></td>
								<td><c:out value="${s.pre}" /></td>
								<td><c:out value="${s.fname}" /></td>
								<td><c:out value="${s.lname}" /></td>
								<td><c:out value="${s.age}" /></td>
								<td><c:out value="${s.dep.name_dep}" /></td>
								<td><a href="Update?id=<c:out value="${s.id }"/>"><button type="button" class="btn btn-warning btn-sm">Update</button></a></td>
								<td><a href="Delete?id=<c:out value="${s.id }"/>"><button type="button" class="btn btn-danger btn-sm">Delete</button></a></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="s" items="${studentList}">
								<tr>
									<td><c:out value="${s.id}" /></td>
									<td><c:out value="${s.pre}" /></td>
									<td><c:out value="${s.fname}" /></td>
									<td><c:out value="${s.lname}" /></td>
									<td><c:out value="${s.age}" /></td>
									<td><c:out value="${s.dep.name_dep}" /></td>
									<td><a href="Update?id=<c:out value="${s.id }"/>"><butto type="button" class="btn btn-warning btn-sm">Update</button></a></td>
									<td><a href="Delete?id=<c:out value="${s.id }"/>"><button type="button" class="btn btn-danger btn-sm">Delete</button></a></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
					
				</tbody>
			</table>

		</div>
	</div>
</body>
</html>
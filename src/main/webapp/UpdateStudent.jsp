<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="java.util.*"%>
<%@ page import="model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student</title>
<link rel="stylesheet"
	href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<div class="mt-3">
<div> 
	<p class="fs-1 bg bg-primary text-white mt-3 p-3">ระบบฐานข้อมูลนักศึกษา</p>
</div>
	<form action="UpdateStudent" method="get">
		<table>
			<tr>
				<td>รหัสนักศึกษา</td><td><input type="text" readonly name="id" value='<c:out value="${student.id}"/>' /></td>
			</tr>
			<tr>
				<td>คำนำหน้า</td>
				<td>
				<c:choose>
  					<c:when test="${student.pre eq 'นาย'}">
  					<select name ="pre">
  						<option value="นาย" selected>นาย</option>
  						<option value="นางสาว">นางสาว</option>
					</select>
  				</c:when>
  				<c:otherwise>
    				<select name ="pre">
  						<option value="นาย" >นาย</option>
  						<option value="นางสาว" selected>นางสาว</option>
					</select>
  					</c:otherwise>
				</c:choose>

				
					
				</td>
			</tr>
			<tr>
				<td>ชื่อนักศึกษา</td><td><input type="text" name="fname" value='<c:out value="${student.fname}"/>' /></td>
			</tr>
			<tr>
				<td>นามสกุล</td><td><input type="text" name="lname" value='<c:out value="${student.lname}"/>' /></td>
			</tr>
			
			<tr>
				<td>อายุ</td><td><input type="text" name="age" value='<c:out value="${student.age}"/>' /></td>
			</tr>
			<tr>
				<td>แผนกวิชา</td>
				<td>
				<select name ="id_dep">
				
				<c:forEach var="d" items="${depList}">
  					<option value="<c:out value="${d.id_dep}"/>">
  					<c:out value="${d.name_dep}"/>
  					</option>
  						
  				</c:forEach>
  				
				</select>
	
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" class="btn btn-primary" value="Update" name="submit"/></td>
			</tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>
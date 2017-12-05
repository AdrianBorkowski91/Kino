<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/style.css" type="text/css" rel="stylesheet">

</head>
<body>

	<nav class="navbar navbar-light bg-light">
	  <a class="navbar-brand" style="color: black;">
	    <img src="resources/icon/main_icon.png" width="30" height="30" class="d-inline-block align-top" alt="">
	    Twoje KINO
	  </a>
	</nav>
	
	<div class="card text-center" style="border-bottom-color: black;">
	
	  <div class="card-header">
	    <h5>REPERTUAR</h5> 
      </div>
	 
	  <div class="card-body" id="card-calendar">
	    <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups" style="float: right;">
		  <div class="btn-group mr-2" role="group" aria-label="First group">
		  	<a type="button" class="btn btn-secondary disabled" id="date-back" onclick="backDates()">&#60;&#60;&#60;</a>
		    <a type="button" class="btn btn-secondary active" id="date-1" onclick="activeDate(this, 1)"></a>
		    <a type="button" class="btn btn-secondary" id="date-2" onclick="activeDate(this, 2)"></a>
		    <a type="button" class="btn btn-secondary" id="date-3" onclick="activeDate(this, 3)"></a>
			<a type="button" class="btn btn-secondary" id="date-4" onclick="activeDate(this, 4)"></a>
			<a type="button" class="btn btn-secondary" id="date-5" onclick="activeDate(this, 5)"></a>
			<a type="button" class="btn btn-secondary" id="date-6" onclick="activeDate(this, 6)" style="display: none;"></a>
		    <a type="button" class="btn btn-secondary" id="date-7" onclick="activeDate(this, 7)" style="display: none;"></a>
		    <a type="button" class="btn btn-secondary" id="date-8" onclick="activeDate(this, 8)" style="display: none;"></a>
		    <a type="button" class="btn btn-secondary" id="date-9" onclick="activeDate(this, 9)" style="display: none;"></a>
			<a type="button" class="btn btn-secondary" id="date-10" onclick="activeDate(this, 10)" style="display: none;"></a>
		    <a type="button" class="btn btn-secondary" id="date-next" onclick="nextDates()">&#62;&#62;&#62;</a>
		  </div>
		</div>
	  </div>
	  
	  <div class="card-body">
		<table class="table table-inverse">
		  <tbody>
		  <%int i=0, j=1; %>
		  	<c:forEach var="film" items="${listFilm}">	
			    <tr>
			      <td><%=j %>.</td>
			      <td width="25%"><a href="about-film.jsp?id=${film.idFilm}" class="about-film"><img class="miniature-img" src="${pageContext.request.contextPath}/${film.picture}"></img>${film.name}</a></td>
			      <td width="75%">
				      <c:forEach var="seance" items="${listSeance}">					 
	   				 	<c:if test="${film.idFilm == seance.idFilm}">
	   				 		<div class="div-time-button day${seance.day}">
				      	   		<a id="day${seance.day}" href="book.jsp?id=${film.idFilm}&seance=${seance.idSeance}" class="time-button"><c:if test="${seance.timeStart.getHours()<=9}">0</c:if>${seance.timeStart.getHours()}:${seance.timeStart.getMinutes()}<c:if test="${seance.timeStart.getMinutes()<=9}">0</c:if></a>	 	
						   		<% i++; %>
						  	</div>						  
						</c:if>					
				      </c:forEach> 				         
			      </td>
			    </tr>
			    <% j++; %>
		   	</c:forEach> 
		  </tbody>
		</table>
	 	<span style="font-size: 13px;">*Aby zarezerwować bilet - naciśnij wybraną godzinę.</span>
	  </div>  
	</div>
	
	<input id="seance-length" type="hidden" value="<%=i %>"> 
	
<script>
displaySeances(1);
createDates();

function createDates(){
	var date = new Date();
	var dates= [];
	
	for(var i=0; i<10; i++){ 
		var day = date.getDate();
	
		if(day < 10){
			day= '0'+day;		
		}
	
		var month = date.getMonth()+1;
		
		if(month < 10){
			month= '0'+month;		
		}
		
		var year = date.getFullYear();
		
		dates[i]=day+"."+month+"."+year;
		
		var j=i+1;
		document.getElementById('date-'+j).innerHTML= dates[i];
		
		date.setHours(24);	
	}
}

function displaySeances(day){
	for (var i=1; i<=10; i++) {
		var x = document.getElementsByClassName("div-time-button day"+i);
		if(i==day){
			for(var j=0; j<x.length; j++){
		    	x[j].style.display= 'inline-block';
			}
		}
		else{
			for(var j=0; j<x.length; j++){
		    	x[j].style.display= 'none';
			}
		}
	}
}
function nextDates(){
	for(var i=1; i<=5; i++){ 
		document.getElementById('date-'+i).style.display= 'none';
	}
	for(var i=6; i<=10; i++){ 
		document.getElementById('date-'+i).style.display= 'block';
	}
	document.getElementById('date-next').className='btn btn-secondary disabled';
	document.getElementById('date-back').className='btn btn-secondary active';
}
function backDates(){
	for(var i=1; i<=5; i++){ 
		document.getElementById('date-'+i).style.display= 'block';
	}
	for(var i=6; i<=10; i++){ 
		document.getElementById('date-'+i).style.display= 'none';
	}
	document.getElementById('date-next').className='btn btn-secondary active';
	document.getElementById('date-back').className='btn btn-secondary disabled';
}
function activeDate(obj, day){
	var objID= obj.id;
	obj.className= 'btn btn-secondary active';
	
	for(var i=1; i<=10; i++){
		var id='date-'+i;
		if(objID!=id){
			document.getElementById('date-'+i).className= 'btn btn-secondary';
		}
	}
	displaySeances(day);
}
</script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>

</body>
</html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="pl.cinema.model.Film"%>
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
<style>
div.arrows{
	display: inline-block;
}
div#div-arrow-left{
	display: inline-block; 
	float: left;
}
div#div-arrow-right{
	display: inline-block; 
	float: right;
}
a.a-arrow{
	border: black;
}
p.param-film{
	color: #868e96;
	font-size: 15px;
}
span.param-film{
	font-style: italic;
}
img.param-film{
	width: 170px;
	height: 240px;
	margin: 5px;
}
h5.title-film{
	padding: 10px; 
	text-decoration: underline;
}
.reservation{
	font-size: 10px; 
	padding: 30px; 
	padding-top: 0px;
}
#div-arrow-left:HOVER {
    width: 70px;
} 
#div-arrow-right:HOVER {
    width: 70px;
} 


</style>
</head>
<body>
<% 
List<Film> listFilm = (List<Film>)request.getSession().getAttribute("listFilm");
int id= Integer.parseInt(request.getParameter("id"));
Film film= null;

for (int i=0; i<listFilm.size(); i++){
	if(listFilm.get(i).getIdFilm()==id){
		film= listFilm.get(i);
		request.setAttribute("film", film);
	}
}

%>

	<nav class="navbar navbar-light bg-light">
	  <a class="navbar-brand" style="color: black;">
	    <img src="resources/icon/main_icon.png" width="30" height="30" class="d-inline-block align-top" alt="">
	    Twoje KINO
	  </a>
	</nav>

	<div class="card text-center">
	
	  <div class="card-header">
	    <h5>REPERTUAR</h5>
      </div>
      
      <div class="arrows">
	    <div id="div-arrow-left">
	    	<a id="a-arrow-left" href="about-film.jsp?id=${film.idFilm-1}" onclick="backFilm(${film.idFilm})"><img src="resources/icon/arrow-circle-left-8x.png" width="50" height="50" class="d-inline-block align-top" alt=""></a>
	    </div>
	    <div id="div-arrow-right">
	    	<a id="a-arrow-right" href="about-film.jsp?id=${film.idFilm+1}" onclick="nextFilm(${film.idFilm})"><img src="resources/icon/arrow-circle-right-8x.png" width="50" height="50" class="d-inline-block align-top" alt=""></a>
	    </div>
	  </div> 
	   
	<h5 class="title-film">${film.name}</h5>
	
	  <div class="card-body">

	 	<div class="row">
			<div class="col-sm-3">
      			<img class="param-film" src="${pageContext.request.contextPath}/${film.picture}"></img>
      			<p class="param-film">Czas trwania: <span class="param-film">${film.duration} min</span></p>
      			<p class="param-film">Reżyseria: <span class="param-film">${film.direction}</span></p>
      			<p class="param-film">Scenariusz: <span class="param-film">${film.scenario}</span></p>
      			<p class="param-film">Gatunek: <span class="param-film">${film.gentres}</span></p>
      			<p class="param-film">Produkcja: <span class="param-film">${film.countries}</span></p>	
			</div>
			
 			<div class="col-sm-6">
      			<p class="param-film">${film.description}</p>
				<iframe width="100%" height="315" src="${film.trailer}" frameborder="0" allowfullscreen></iframe>
 			</div>
 			
			<div class="col-sm-3 reservation">
       			<h6>ZAREZERWUJ</h6>
				<table class="table table-inverse">
				  <tbody>
				  	<%for(int i=1; i<=10; i++){%>
				    <tr>
				      <c:set var="daye" value="<%=i%>"  scope="page"></c:set>
				      
				      <td width="25%"><span class="about-film" id="date-<%=i%>"></span></td>
				      <td width="75%">
					      <c:forEach var="seance" items="${listSeance}">					 
		   				 	<c:if test="${seance.idFilm == param['id'] && seance.day == pageScope.daye}">
		   				 		<a href="book.jsp?id=${film.idFilm}&seance=${seance.idSeance}" class="time-button"><c:if test="${seance.timeStart.getHours()<=9}">0</c:if>${seance.timeStart.getHours()}:${seance.timeStart.getMinutes()}<c:if test="${seance.timeStart.getMinutes()<=9}">0</c:if></a>	 					  
							</c:if>					
					      </c:forEach> 			
				      </td>
				  
				    </tr>
				   <%} %>
				  </tbody>
				</table>
			</div>		
 		</div>
  	</div>
  </div>
	  
<script>
createDates();
activeArrow(${param['id']});
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

function activeArrow(id){
	if(id==1){
		document.getElementById('div-arrow-left').style.display='none';
		document.getElementById('div-arrow-right').style.display='inline-block';
	}
	else if(id==8){
		document.getElementById('div-arrow-left').style.display='inline-block';
		document.getElementById('div-arrow-right').style.display='none';
	}
	else{
		document.getElementById('div-arrow-left').style.display='inline-block';
		document.getElementById('div-arrow-right').style.display='inline-block';
	}
}

function nextFilm(idFilm){
	var otherId= idFilm+1;
	activeArrow(idFilm);
	
	if(otherId==8){
		document.getElementById('div-arrow-right').style.display='none';
	}
}
function backFilm(idFilm){
	var otherId= idFilm-1;
	activeArrow(idFilm);
	
	if(otherId==1){
		document.getElementById("a-arrow-left").href = 'about-film.jsp?id='+otherId;
	}
}

</script>

	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
</body>
</html>